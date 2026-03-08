import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:damta/core/logger/log.dart';
import 'package:damta/domain/entity/users_entity.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_naver_login/flutter_naver_login.dart';
import 'package:flutter_naver_login/interface/types/naver_login_status.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

abstract interface class AuthDataSource {
  Future<UsersEntity?> signInWithApple();
  Future<UsersEntity?> signInWithGoogle();
  Future<UsersEntity?> signInWithCustomProvider(String provider);

  Future<void> signOut();
  Future<void> deleteAccount();

  Stream<UsersEntity?> authStateChanges();
}

class AuthDataSourceImpl implements AuthDataSource {
  AuthDataSourceImpl(this.auth, this.firestore);

  final FirebaseAuth auth;
  final FirebaseFirestore firestore;

  // [공통] Firebase 유저 처리

  Future<UsersEntity?> _handleFirebaseUser(
    UserCredential userCredential,
  ) async {
    final user = userCredential.user;
    if (user == null) return null;
    final users = UsersEntity(uId: user.uid, email: user.email);
    await _createUserIfNotExists(users);
    Log.d("Firebase 로그인 성공 🩷 uId : ${users.uId}");
    return users;
  }

  Future<void> _createUserIfNotExists(UsersEntity user) async {
    final doc = firestore.collection("users").doc(user.uId);
    if (!(await doc.get()).exists) {
      await doc.set({
        "uid": user.uId,
        "email": user.email,
        "createdAt": FieldValue.serverTimestamp(),
      });
      Log.d("신규 유저 Firestore 생성 완료");
    }
  }

  // [Apple]

  @override
  Future<UsersEntity?> signInWithApple() async {
    try {
      // 1. Apple 로그인 요청 > 인증 토큰 가져오기
      final appleCredential = await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
        // Android에서 반드시 필요
        webAuthenticationOptions: WebAuthenticationOptions(
          clientId: 'com.your.bundle.id', // Apple Developer에 등록한 Service ID
          redirectUri: Uri.parse(
            'https://your-project-id.firebaseapp.com/__/auth/handler',
          ),
        ),
      );
      // 2. Firebase Credential 생성
      final credential = OAuthProvider("apple.com").credential(
        idToken: appleCredential.identityToken,
        accessToken: appleCredential.authorizationCode,
      );
      final userCredential = await auth.signInWithCredential(credential);
      // 3. Firebase 로그인
      return _handleFirebaseUser(userCredential);
    } catch (e) {
      Log.e("Apple 로그인 실패: $e");
      rethrow;
    }
  }

  // [Google]

  @override
  Future<UsersEntity?> signInWithGoogle() async {
    try {
      // 1. Google 로그인 요청 > 인증 토큰 가져오기
      final account = await GoogleSignIn().signIn();
      if (account == null) {
        Log.d("Google 로그인 취소");
        return null;
      }
      final auth = await account.authentication;
      // 2. Firebase Credential 생성
      final credential = GoogleAuthProvider.credential(
        idToken: auth.idToken,
        accessToken: auth.accessToken,
      );
      final userCredential = await this.auth.signInWithCredential(credential);
      // 3. Firebase 로그인
      return _handleFirebaseUser(userCredential);
    } catch (e) {
      Log.e("Google 로그인 실패: $e");
      rethrow;
    }
  }

  // [Kakao][Naver]

  Future<String?> _getKakaoAccessToken() async {
    try {
      OAuthToken token;
      token = await UserApi.instance.loginWithKakaoAccount();

      Log.d("Kakao 로그인 성공");
      return token.accessToken;
    } on FirebaseFunctionsException catch (e) {
      Log.d('code: ${e.code}');
      Log.d('message: ${e.message}');
      Log.d('details: ${e.details}');
      return null;
    } catch (e) {
      Log.e("Kakao 로그인 실패: $e");
      return null;
    }
  }

  Future<String?> _getNaverAccessToken() async {
    try {
      final result = await FlutterNaverLogin.logIn();
      if (result.status == NaverLoginStatus.loggedIn) {
        Log.d("Naver 로그인 성공");
        return result.accessToken?.accessToken;
      } else {
        Log.d("Naver 로그인 실패: ${result.status}");
        return null;
      }
    } catch (e) {
      Log.e("Naver 로그인 실패: $e");
      return null;
    }
  }

  @override
  Future<UsersEntity?> signInWithCustomProvider(String provider) async {
    try {
      // 1. Kakao / Naver 로그인 요청
      final accessToken = provider == "Kakao"
          ? await _getKakaoAccessToken()
          : await _getNaverAccessToken();
      if (accessToken == null) return null;
      // 2. Firebase Custom Token 요청
      final callable = FirebaseFunctions.instance.httpsCallable(
        "create${provider}CustomToken",
      );
      final result = await callable.call({"accessToken": accessToken});
      final customToken = result.data["customToken"];
      // 3. Firebase Credential 생성
      final userCredential = await auth.signInWithCustomToken(customToken);
      // 4. Firebase 로그인
      return _handleFirebaseUser(userCredential);
    } catch (e) {
      Log.e("$provider 로그인 실패: $e");
      rethrow;
    }
  }

  // 로그아웃

  @override
  Future<void> signOut() async {
    try {
      final user = auth.currentUser;
      if (user == null) return;

      for (final provider in user.providerData) {
        switch (provider.providerId) {
          // Apple 로그아웃 필요 X
          case 'apple.com':
            break;
          // Google
          case 'google.com':
            await GoogleSignIn().signOut();
            break;
          // Kakao
          case 'oidc.kakao': // 커스텀일 경우
            await UserApi.instance.logout();
            break;
          // Naver
          case 'oidc.naver':
            await FlutterNaverLogin.logOut();
            break;
        }
      }
      // auth 로그아웃
      await auth.signOut();
      Log.d("로그아웃 완료");
    } catch (e) {
      Log.e("로그아웃 실패: $e");
      rethrow;
    }
  }

  // 회원탈퇴

  @override
  Future<void> deleteAccount() async {
    try {
      final user = auth.currentUser;
      if (user == null) return;

      // Firestore 문서 삭제
      await firestore.collection("users").doc(user.uid).delete();

      // Provider unlink
      for (final provider in user.providerData) {
        switch (provider.providerId) {
          // Kakao
          case 'oidc.kakao':
            await UserApi.instance.unlink();
            break;
          // Naver
          case 'oidc.naver':
            await FlutterNaverLogin.logOutAndDeleteToken();
            break;
        }
      }
      // auth 삭제
      await user.delete();

      Log.d("회원탈퇴 완료");
    } on FirebaseAuthException catch (e) {
      if (e.code == "requires-recent-login") {
        Log.e("재인증 필요");
        throw Exception("재로그인 후 다시 시도해주세요.");
      }
      Log.e("회원탈퇴 실패: ${e.message}");
      rethrow;
    } catch (e) {
      Log.e("회원탈퇴 실패: $e");
      rethrow;
    }
  }

  // 상태가 바뀔 때마다 (로그인, 로그아웃, 토큰 갱신, 앱 재실행 시 자동 로그인 유지) 자동으로 Stream emit
  // Splash > 로그인 여부 판단할 때 사용
  @override
  Stream<UsersEntity?> authStateChanges() {
    return auth.authStateChanges().map((user) {
      if (user == null) return null;
      return UsersEntity(uId: user.uid, email: user.email);
    });
  }
}

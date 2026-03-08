import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:damta/core/logger/log.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class FirebaseService {
  static final FirebaseService instance = FirebaseService._internal();
  factory FirebaseService() => instance;

  // late로 지연 초기화 시킴
  late final FirebaseAuth auth;
  late final FirebaseFirestore firestore;
  static String? get getUId {
    return FirebaseAuth.instance.currentUser?.uid;
  }

  FirebaseService._internal();
  // Firebase 초기화 메서드
  Future<void> initializeFirebase() async {
    try {
      await Firebase.initializeApp();
      auth = FirebaseAuth.instance;
      firestore = FirebaseFirestore.instance;
      Log.d("Firebase Core 초기화 성공 (-_- b)");
    } catch (e) {
      if (e.toString().contains('already been initialized')) {
        Log.e("Firebase Core는 이미 초기화되었습니다.");
        auth = FirebaseAuth.instance;
        firestore = FirebaseFirestore.instance;
      } else {
        Log.e("!!! Firebase Core 초기화 실패 !!! : $e");
        rethrow;
      }
    }
  }

  // 인증 및 사용자 문서 생성/업데이트 로직 (LoginPage에서 사용)
  // 카카오 ID 기반으로 Firebase Custom Token을 사용해서 로그인, Firestore 사용자 문서 생성 or 업데이트
  Future<User?> signInWithKakaoIdAndCreateUser(String kakaoId) async {
    try {
      UserCredential userCredential;
      User? user = auth.currentUser;
      if (user == null) {
        // 인증되지 않은 경우, 익명 로그인 시도
        userCredential = await auth.signInAnonymously();
        user = userCredential.user;
        Log.d("Firebase 익명 로그인 성공 (-_- b) : UID ${user!.uid}");
      } else {
        // 이미 로그인된 경우 (SplashPage에서 넘어옴)
        Log.d("Firebase 기존 세션 사용 (-_- b) : UID ${user.uid}");
      }

      // Firestore에 사용자 문서 생성 or 업데이트
      final userDocRef = firestore.collection('users').doc(user.uid);
      await userDocRef.set({
        'kakaoId': kakaoId, // 카카오 ID 저장
        'createdAt': FieldValue.serverTimestamp(),
        'lastSignInTime': FieldValue.serverTimestamp(),
        // schoolName 필드는 saveSchoolInfo에서 추가!!
      }, SetOptions(merge: true)); // 기존 필드는 유지하고 새로운 필드만 업데이트
      Log.d("Firestore 사용자 문서 업데이트/생성 성공 (-_- b) (UID: ${user.uid})");

      return user;
    } on FirebaseAuthException catch (e) {
      Log.e("!!! Firebase 인증 오류 !!! : ${e.code}");
      return null;
    } catch (e) {
      Log.e("!!! Firebase 로그인 및 문서 생성 중 오류 발생 !!! : $e");
      return null;
    }
  }

  // 학교 정보 저장
  Future<void> saveSchoolInfo({
    required String schoolName,
    required String officeCode,
    required String schoolCode,
  }) async {
    final user = auth.currentUser;
    if (user == null) {
      throw Exception("사용자가 로그인되어 있지 않습니다.");
    }
    // Firestore 'users' 컬렉션의 현재 사용자 문서에 업데이트
    final userDocRef = firestore.collection('users').doc(user.uid);
    await userDocRef.update({
      'schoolName': schoolName,
      'officeCode': officeCode,
      'schoolCode': schoolCode,
    });
    Log.d("학교 정보 Firestore 저장 성공 (-_- b) (학교명: $schoolName, UID: ${user.uid})");
  }

  // FCM 토큰 Firestore에 저장
  Future<void> saveFcmToken(String uid) async {
    try {
      final token = await FirebaseMessaging.instance.getToken();
      if (token == null) {
        Log.d("FCM 토큰을 가져오지 못했습니다.");
        return;
      }

      await firestore.collection('users').doc(uid).set({
        'fcmToken': token,
        'tokenUpdatedAt': FieldValue.serverTimestamp(),
      }, SetOptions(merge: true));

      Log.d("🩷 FCM 토큰 Firestore 저장 성공 : $token");
    } catch (e) {
      Log.e("FCM 토큰 저장 오류 : $e");
    }
  }

  // 토큰 변경 시 갱신
  void listenTokenRefresh(String uid) {
    FirebaseMessaging.instance.onTokenRefresh.listen((newToken) async {
      await firestore.collection('users').doc(uid).set({
        'fcmToken': newToken,
        'tokenUpdatedAt': FieldValue.serverTimestamp(),
      }, SetOptions(merge: true));

      Log.d("🔄 FCM 토큰 갱신됨: $newToken");
    });
  }
}

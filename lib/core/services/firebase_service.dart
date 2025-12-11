import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as fb_auth;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:damta/firebase_options.dart';

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
      if (Firebase.apps.isEmpty) {
        await Firebase.initializeApp(
          options: DefaultFirebaseOptions.currentPlatform,
        );
      }
      _instance = FirebaseService._internal();
      _instance!._firestore = FirebaseFirestore.instance;
      _instance!._auth = fb_auth.FirebaseAuth.instance;

      // iOS Foreground 알림 표시를 허용 (없으면 iOS에서 푸시 미표시)
      await FirebaseMessaging.instance
          .setForegroundNotificationPresentationOptions(
            alert: true,
            badge: true,
            sound: true,
          );

      _isInitialized = true;
      debugPrint('Firebase initialized successfully and services are ready.');
      await Firebase.initializeApp();

      auth = FirebaseAuth.instance;
      firestore = FirebaseFirestore.instance;
      print("Firebase Core 초기화 성공 (-_- b)");
    } catch (e) {
      if (e.toString().contains('already been initialized')) {
        print("Firebase Core는 이미 초기화되었습니다.");
        auth = FirebaseAuth.instance;
        firestore = FirebaseFirestore.instance;
      } else {
        print("!!! Firebase Core 초기화 실패 !!! : $e");
        rethrow;
      }
    }
  }

  // FCM 토큰 Firestore 저장
  Future<void> saveFcmToken(String uId) async {
    final token = await FirebaseMessaging.instance.getToken();
    print('🩷 FCM token: $token');
    if (token != null) {
      await _firestore.collection('users').doc(uId).update({'fcmToken': token});
      debugPrint('FCM token saved: $token');
    }
  }

  // 카카오 ID를 기반으로 사용자를 익명 로그인 처리하고 Firestore에 사용자 정보를 저장
  Future<fb_auth.User?> signInAnonymouslyWithKakaoId(String kakaoId) async {
    if (!_isInitialized) {
      debugPrint("FirebaseService not ready. Cannot sign in.");
      return null;
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
        print("Firebase 익명 로그인 성공 (-_- b) : UID ${user!.uid}");
      } else {
        // 이미 로그인된 경우 (SplashPage에서 넘어옴)
        print("Firebase 기존 세션 사용 (-_- b) : UID ${user.uid}");
      }

      // Firestore에 사용자 문서 생성 or 업데이트
      if (user != null) {
        final userDocRef = firestore.collection('users').doc(user.uid);

        await userDocRef.set({
          'kakaoId': kakaoId, // 카카오 ID 저장
          'createdAt': FieldValue.serverTimestamp(),
          'lastSignInTime': FieldValue.serverTimestamp(),
          // schoolName 필드는 saveSchoolInfo에서 추가!!
        }, SetOptions(merge: true)); // 기존 필드는 유지하고 새로운 필드만 업데이트

        print("Firestore 사용자 문서 업데이트/생성 성공 (-_- b) (UID: ${user.uid})");
      }
      return user;
    } on FirebaseAuthException catch (e) {
      print("!!! Firebase 인증 오류 !!! : ${e.code}");
      return null;
    } catch (e) {
      print("!!! Firebase 로그인 및 문서 생성 중 오류 발생 !!! : $e");
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
      'schoolSetAt':
          FieldValue.serverTimestamp(), // 학교 정보를 설정한 시간 기록 (흠 근데 굳이? 넣을 필요가 있었나... 진짜 정말 ㄹㅇ)
    });

    print("학교 정보 Firestore 저장 성공 (-_- b) (학교명: $schoolName, UID: ${user.uid})");
  }
}

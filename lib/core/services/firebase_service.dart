import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as fb_auth;
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:damta/firebase_options.dart';

class FirebaseService {
  late FirebaseFirestore _firestore;
  late fb_auth.FirebaseAuth _auth;

  static FirebaseService? _instance;
  static bool _isInitialized = false;

  FirebaseService._internal();

  static FirebaseService get instance {
    if (_instance == null) {
      _instance = FirebaseService._internal();
    }
    return _instance!;
  }

  FirebaseFirestore get firestore {
    if (!_isInitialized) {
      throw Exception(
        "FirebaseService not initialized. Call initializeFirebase() first.",
      );
    }
    return _firestore;
  }

  fb_auth.FirebaseAuth get auth {
    if (!_isInitialized) {
      throw Exception(
        "FirebaseService not initialized. Call initializeFirebase() first.",
      );
    }
    return _auth;
  }

  Future<void> initializeFirebase() async {
    if (_isInitialized) return;

    try {
      if (Firebase.apps.isEmpty) {
        await Firebase.initializeApp(
          options: DefaultFirebaseOptions.currentPlatform,
        );
      }

      _instance = FirebaseService._internal();
      _instance!._firestore = FirebaseFirestore.instance;
      _instance!._auth = fb_auth.FirebaseAuth.instance;

      _isInitialized = true;
      debugPrint('Firebase initialized successfully and services are ready.');
    } catch (e) {
      debugPrint('Error initializing Firebase: $e');
      _isInitialized = false;
    }
  }

  // 카카오 ID를 기반으로 사용자를 익명 로그인 처리하고 Firestore에 사용자 정보를 저장
  Future<fb_auth.User?> signInAnonymouslyWithKakaoId(String kakaoId) async {
    if (!_isInitialized) {
      debugPrint("FirebaseService not ready. Cannot sign in.");
      return null;
    }

    try {
      fb_auth.UserCredential userCredential = await _auth.signInAnonymously();
      fb_auth.User? user = userCredential.user;

      if (user != null) {
        final userDoc = _firestore.collection('users').doc(user.uid);

        await userDoc.set({
          'kakaoId': kakaoId,
          'uid': user.uid,
          'createdAt': FieldValue.serverTimestamp(),
          'lastSignInAt': FieldValue.serverTimestamp(),
        }, SetOptions(merge: true));

        debugPrint("Firebase Sign-in Success. UID: ${user.uid}");
      }
      return user;
    } catch (e) {
      debugPrint("Firebase Sign-in Failed: $e");
      return null;
    }
  }
}

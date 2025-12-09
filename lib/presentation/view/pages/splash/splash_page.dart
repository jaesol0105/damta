import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:firebase_auth/firebase_auth.dart' as fb_auth;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:damta/core/services/firebase_service.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _checkAuthenticationStatus();
    });
  }

  Future<void> _checkAuthenticationStatus() async {
    await Future.delayed(const Duration(milliseconds: 500));

    final fb_auth.User? user = FirebaseService.instance.auth.currentUser;

    if (user == null) {
      // 미인증: 로그인 페이지로 이동
      if (mounted) context.go('/');
      return;
    }

    // 인증 완료: 학교 정보 입력 여부 확인
    try {
      final DocumentSnapshot userDoc = await FirebaseService.instance.firestore
          .collection('users')
          .doc(user.uid)
          .get();

      if (!userDoc.exists) {
        // Firestore 문서가 없는 경우 로그인 페이지로 이동
        if (mounted) context.go('/');
        return;
      }

      final data = userDoc.data() as Map<String, dynamic>?;
      final kakaoId = data?['kakaoId'] as String?;

      // schoolName 필드가 없거나 비어 있으면 학교 정보 미입력으로 간주!
      final hasSchoolInfo =
          data?.containsKey('schoolName') == true &&
          (data?['schoolName'] as String).isNotEmpty;

      if (hasSchoolInfo) {
        // 학교 정보 입력 완료: 홈 페이지로 이동 (자동 로그인)
        if (mounted) context.go('/home');
      } else if (kakaoId != null) {
        // 학교 정보 미입력: 학교 입력 페이지로 이동 (kakaoId를 extra로 전달)
        if (mounted) context.go('/school', extra: kakaoId);
      } else {
        // 카카오 ID도 없는 경우 로그인 페이지로 이동
        if (mounted) context.go('/');
      }
    } catch (e) {
      print("사용자 프로필 상태 확인 오류: $e");
      // 오류 발생 시에도 안전하게 로그인 페이지로 이동!!
      if (mounted) context.go('/');
    }
  }

  @override
  Widget build(BuildContext context) {
    // 추후 추가 예정 (애니메이션)
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(), // 로딩 표시
            SizedBox(height: 20),
            Text("인증 상태 확인 중...", style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}

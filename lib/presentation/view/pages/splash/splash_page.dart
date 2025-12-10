import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:firebase_auth/firebase_auth.dart' as fb_auth;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:damta/core/services/firebase_service.dart';
import 'package:lottie/lottie.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  bool _initialized = false; // onLoaded 중복 호출 방지

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _checkAuthenticationStatus();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  /// 앱 시작전 스플래시 화면에서 수행할 초기화 작업
  Future<void> _loadHomeData() async {
    await Future.delayed(const Duration(seconds: 2)); // 데모용 딜레이

    // await ref.read(initAppUseCaseProvider).execute();
  }

  /// 초기화 작업 끝날때까지 애니메이션 반복
  Future<void> _startInit() async {
    _controller.repeat(); // 반복

    try {
      await _loadHomeData(); // 데이터 로딩이 끝날 때까지 대기
    } catch (e) {
      log('SplashPage _startInit 실패: $e');
    }

    // final dataFuture = _loadHomeData(); // 데이터 로드
    // final minDisplayFuture = Future.delayed(const Duration(seconds: 2)); // 최소 딜레이 시간 설정
    // await Future.wait([dataFuture, minDisplayFuture]); // 데이터 로딩 + 최소 노출 시간 둘 다 끝나면

    _controller.stop();

    if (!mounted) return;
    context.go('/'); // 페이지 라우팅
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
          data?.containsKey('schoolName') == true && (data?['schoolName'] as String).isNotEmpty;

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
      print("!!! 사용자 프로필 상태 확인 오류 !!! : $e");
      // 오류 발생 시에도 안전하게 로그인 페이지로 이동!!
      if (mounted) context.go('/');
    }
  }

  @override
  Widget build(BuildContext context) {
    // 추후 추가 예정 (애니메이션)
    return Scaffold(
      backgroundColor: Colors.white, // 네이티브 스플래쉬 컬러와 동일하게 맞추면 자연스럽게 넘어가는거처럼 보임
      body: Center(
        child: Lottie.asset(
          'assets/lottie/splash.json',
          controller: _controller,
          onLoaded: (composition) {
            if (_initialized) return;
            _initialized = true;
            _startInit();
          },
        ),
      ),
    );
  }
}

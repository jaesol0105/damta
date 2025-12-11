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
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  /// 앱 시작전 스플래시 화면에서 수행할 초기화 작업
  Future<void> _loadHomeData() async {
    await Future.delayed(const Duration(seconds: 4)); // 데모용 딜레이
    // await ref.read(initAppUseCaseProvider).execute();
  }

  /// 인증, 유저 정보, 학교 정보 여부 체크하고 라우팅 분기 (+ 홈 화면에서 필요한 데이터 로드)
  Future<void> _runInit() async {
    try {
      // 네이티브 스플래시 → Flutter 스플래시 자연스럽게 보이도록 최소 딜레이
      await Future.delayed(const Duration(milliseconds: 500));

      // 로그인된 사용자가 있는지 확인
      final fb_auth.User? user = FirebaseService.instance.auth.currentUser;

      if (user == null) {
        // 로그인 안 된 경우: 초기 데이터 로드(필요 시) + 로그인 화면
        print('🐿️[Splash] 로그인 안 된 상태 → / 로 이동');
        await _loadHomeData();
        if (!mounted) return;
        context.go('/');
        return;
      }

      // Firestore에서 유저 문서 조회
      final DocumentSnapshot userDoc = await FirebaseService.instance.firestore
          .collection('users')
          .doc(user.uid)
          .get();

      if (!userDoc.exists) {
        // Firestore 유저 문서가 없는 경우 로그인 페이지로 이동
        await _loadHomeData();
        if (!mounted) return;
        context.go('/');
        return;
      }

      final data = userDoc.data() as Map<String, dynamic>?;
      final kakaoId = data?['kakaoId'] as String?;

      // schoolName 필드가 없거나 비어 있으면 학교 정보 미입력으로 간주!
      final hasSchoolInfo =
          data?.containsKey('schoolName') == true && (data?['schoolName'] as String).isNotEmpty;

      // 여기서 홈 화면에 필요한 데이터도 같이 로드
      await _loadHomeData();

      if (!mounted) return;
      if (hasSchoolInfo) {
        context.go('/home'); // 학교 정보 입력 완료: 홈으로 이동 (자동 로그인)
      } else if (kakaoId != null) {
        context.go('/school', extra: kakaoId); // 학교 정보 미입력: 학교 입력 페이지로 이동 (kakaoId를 extra로 전달)
      } else {
        context.go('/'); // 카카오 ID도 없는 경우 로그인 페이지로 이동
      }
    } catch (e, s) {
      print("!!! 사용자 프로필 상태 확인 오류 !!! : $e");
      if (mounted) context.go('/'); // 오류 발생 시에도 안전하게 로그인 페이지로 이동!!
    } finally {
      if (mounted) {
        _controller.stop();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    // 추후 추가 예정 (애니메이션)
    return Scaffold(
      backgroundColor: Colors.white, // 네이티브 스플래쉬 컬러와 동일하게 맞추면 자연스럽게 넘어가는거처럼 보임
      body: Center(
        child: Lottie.asset(
          'assets/lottie/splash_chick.json',
          controller: _controller,
          onLoaded: (composition) {
            if (_initialized) return;
            _initialized = true;
            _controller.repeat(period: composition.duration);
            _runInit();
          },
        ),
      ),
    );
  }
}

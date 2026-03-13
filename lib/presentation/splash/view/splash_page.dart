import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:damta/core/logger/log.dart';
import 'package:damta/core/service/firebase_service.dart';
import 'package:damta/core/theme/app_theme.dart';
import 'package:firebase_auth/firebase_auth.dart' as fb_auth;
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>
    with SingleTickerProviderStateMixin {
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
    await Future.delayed(const Duration(seconds: 3));
  }

  /// 인증, 유저 정보, 학교 정보 여부 체크하고 라우팅 분기 (+ 홈 화면에서 필요한 데이터 로드)
  Future<void> _runInit() async {
    try {
      // 네이티브 스플래시 → Flutter 스플래시 자연스럽게 보이도록 최소 딜레이
      // await Future.delayed(const Duration(milliseconds: 500));

      // 로그인된 사용자가 있는지 확인
      final fb_auth.User? user = FirebaseService.instance.auth.currentUser;

      if (user == null) {
        // 로그인 안 된 경우: 초기 데이터 로드(필요 시) + 로그인 화면
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
      // final kakaoId = data?['kakaoId'] as String?;

      // schoolName 필드가 없거나 비어 있으면 학교 정보 미입력으로 간주!
      final hasSchoolInfo =
          data?.containsKey('schoolName') == true &&
          (data?['schoolName'] as String).isNotEmpty;

      // 여기서 홈 화면에 필요한 데이터도 같이 로드
      await _loadHomeData();

      if (!mounted) return;
      if (hasSchoolInfo) {
        context.go('/home'); // 학교 정보 입력 완료: 홈으로 이동 (자동 로그인)
      } else {
        context.go('/school');
      }
    } catch (e, _) {
      Log.e("!!! 사용자 프로필 상태 확인 오류 !!! : $e");
      if (mounted) context.go('/'); // 오류 발생 시에도 안전하게 로그인 페이지로 이동!!
    } finally {
      if (mounted) {
        _controller.stop();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: vrc(context).background,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRect(
              child: Align(
                alignment: Alignment.center,
                widthFactor: 0.5, // 좌우 50% 잘림
                heightFactor: 0.5, // 상하 50% 잘림
                child: Lottie.asset(
                  'assets/lottie/splash_chick_v2_small_notext.json',
                  controller: _controller,
                  onLoaded: (composition) {
                    if (_initialized) return;
                    _initialized = true;
                    _controller.repeat(period: composition.duration);
                    _runInit();
                  },
                  fit: BoxFit.contain,
                ),
              ),
            ),
            // 타이핑 텍스트
            DefaultTextStyle(
              style: TextStyle(
                color: vrc(context).disabledText,
                fontWeight: FontWeight.w600,
                letterSpacing: -0.3,
              ),
              child: AnimatedTextKit(
                pause: const Duration(seconds: 3),
                animatedTexts: [
                  TyperAnimatedText(
                    'Loading...',
                    speed: const Duration(milliseconds: 100),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

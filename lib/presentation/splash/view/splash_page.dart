import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:damta/core/logger/log.dart';
import 'package:damta/core/theme/app_theme.dart';
import 'package:damta/presentation/ui_provider/users_provider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lottie/lottie.dart';

class SplashPage extends ConsumerStatefulWidget {
  const SplashPage({super.key});

  @override
  ConsumerState<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends ConsumerState<SplashPage>
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

  Future<void> _runInit() async {
    try {
      // 사용자 정보 확인
      final user = await ref.read(userProvider.future);
      final hasSchoolInfo = user.schoolName != null;

      // 딜레이
      await Future.delayed(const Duration(seconds: 3));

      // 학교 정보 여부에 따라 라우팅 분기
      if (mounted) {
        context.go(hasSchoolInfo ? '/home' : '/school');
      }
    } catch (e, _) {
      Log.e("사용자 프로필 상태 확인 오류: $e");
      if (mounted) {
        context.go('/');
      }
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
            // DefaultTextStyle(
            //   style: TextStyle(
            //     color: vrc(context).disabledText,
            //     fontWeight: FontWeight.w600,
            //   ),
            //   child: AnimatedTextKit(
            //     pause: const Duration(seconds: 3),
            //     animatedTexts: [
            //       TyperAnimatedText(
            //         'LOADING...',
            //         speed: const Duration(milliseconds: 100),
            //       ),
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}

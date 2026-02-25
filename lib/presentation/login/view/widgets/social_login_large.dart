import 'package:damta/presentation/login/view_model/auth_view_model.dart';
import 'package:damta/presentation/util/custom_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SocialLoginLarge extends HookConsumerWidget {
  const SocialLoginLarge({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      spacing: 10,
      children: [
        largeButton(
          label: 'Apple 계정으로 로그인',
          backgroundColor: Colors.black,
          textColor: Colors.white,
          iconPath: 'assets/images/apple_logo_20.svg',
          onPressed: () =>
              ref.read(authViewModelProvider.notifier).signInApple(),
        ),
        largeButton(
          label: 'Google 계정으로 로그인',
          backgroundColor: const Color(0xfff2f2f2),
          textColor: Colors.black,
          iconPath: 'assets/images/google_logo_18.svg',
          onPressed: () =>
              ref.read(authViewModelProvider.notifier).signInGoogle(),
        ),
        largeButton(
          label: '카카오 로그인',
          backgroundColor: const Color(0xfffee500),
          textColor: const Color(0xff191919),
          iconPath: 'assets/images/kakao_logo_18.svg',
          onPressed: () =>
              ref.read(authViewModelProvider.notifier).signInKakao(),
        ),
        largeButton(
          label: '네이버 로그인',
          backgroundColor: const Color(0xff03A94D),
          textColor: Colors.white,
          iconPath: 'assets/images/naver_logo_18.svg',
          onPressed:
              // () => ref.read(authViewModelProvider.notifier).signInNaver(),
              () => showCustomSnackBar(context, '이용할 수 없습니다'),
        ),
      ],
    );
  }

  Widget largeButton({
    required String label,
    required Color backgroundColor,
    required Color textColor,
    required VoidCallback onPressed,
    required String iconPath,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: SizedBox(
        width: double.infinity,
        height: 52,
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: backgroundColor,
            foregroundColor: textColor,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            side: backgroundColor == Colors.white
                ? BorderSide(color: Colors.grey)
                : BorderSide.none,
            padding: const EdgeInsets.symmetric(horizontal: 20),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 8,
            children: [
              SvgPicture.asset(iconPath),
              Text(
                label,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  height: 1.60,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

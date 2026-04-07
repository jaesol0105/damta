import 'dart:io';
import 'package:damta/core/service/analytics_service.dart';
import 'package:damta/presentation/login/view_model/auth_view_model.dart';
import 'package:damta/presentation/widget/custom_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SocialLoginSmall extends HookConsumerWidget {
  const SocialLoginSmall({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 14,
      children: [
        smallButton(
          label: 'Apple',
          iconPath: 'assets/images/apple_login_s.png',
          onTap: () {
            ref.read(authViewModelProvider.notifier).signInApple();
            AnalyticsService.event('login', p: {'type': 'apple'}); // 📝
          },
        ),
        smallButton(
          label: 'Google',
          iconPath: 'assets/images/google_login_s.png',
          onTap: () {
            ref.read(authViewModelProvider.notifier).signInGoogle();
            AnalyticsService.event('login', p: {'type': 'google'}); // 📝
          },
        ),
        smallButton(
          label: '카카오',
          iconPath: 'assets/images/kakao_login_s.png',
          onTap: () {
            ref.read(authViewModelProvider.notifier).signInKakao();
            AnalyticsService.event('login', p: {'type': 'kakao'}); // 📝
          },
        ),
        smallButton(
          label: '네이버',
          iconPath: 'assets/images/naver_login_s.png',
          onTap: () {
            if (Platform.isIOS) {
              ref.read(authViewModelProvider.notifier).signInNaver();
              AnalyticsService.event('login', p: {'type': 'naver'}); // 📝
            } else {
              showCustomSnackBar(context: context, message: '이용할 수 없습니다');
            }
          },
        ),
      ],
    );
  }

  Widget smallButton({
    required String label,
    required String iconPath,
    required Function() onTap,
  }) {
    return Column(
      spacing: 10,
      children: [
        InkWell(
          borderRadius: BorderRadius.circular(30),
          onTap: onTap,
          child: Image.asset(iconPath, width: 60, height: 60),
        ),
        Text(label),
      ],
    );
  }
}

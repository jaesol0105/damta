import 'package:damta/presentation/login/view/widgets/social_login_small.dart';
import 'package:damta/presentation/login/view/widgets/terms_bottom_sheet.dart';
import 'package:damta/presentation/login/view_model/auth_view_model.dart';
import 'package:damta/presentation/widget/custom_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:go_router/go_router.dart';

class LoginPage extends HookConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(authViewModelProvider);

    /// 상태 listen
    ref.listen<AsyncValue<void>>(authViewModelProvider, (prev, next) {
      next.whenOrNull(
        // 로그인 성공 시
        data: (_) async {
          // 최초 로그인 시 약관 동의 체크
          if (prev?.isLoading == true) {
            final agreed = await showTermsBottomSheet(context);
            if (agreed) {
              context.go('/school'); // 동의해야 학교 페이지로 이동
            } else {
              showCustomSnackBar(
                context: context,
                message: "약관에 동의해야 앱을 이용할 수 있습니다",
              );
            }
          }
        },
        // 로그인 실패 시
        error: (e, _) =>
            showCustomSnackBar(context: context, message: '로그인 실패'),
      );
    });

    return Stack(
      children: [
        Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 50,
            children: [
              Image.asset(
                "assets/images/damta_logo_color_down.png",
                width: 300,
              ),
              const SocialLoginSmall(), // 원형 로그인
              // const SocialLoginLarge(), // 사각형 로그인
              // const TermsAgreementText(), // 약관동의 문구
            ],
          ),
        ),

        /// 로딩 오버레이
        if (state.isLoading)
          const ColoredBox(
            color: Colors.black26,
            child: Center(
              child: CircularProgressIndicator(color: Colors.amber),
            ),
          ),
      ],
    );
  }
}

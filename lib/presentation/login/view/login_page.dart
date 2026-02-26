import 'package:damta/presentation/login/view/widgets/social_login_small.dart';
import 'package:damta/presentation/login/view/widgets/terms_agreement_text.dart';
import 'package:damta/presentation/login/view_model/auth_view_model.dart';
import 'package:damta/presentation/util/custom_snackbar.dart';
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
        data: (_) {
          if (prev?.isLoading == true) {
            context.go('/school');
          }
        },
        // 로그인 실패 시
        error: (e, _) => showCustomSnackBar(context, '로그인 실패'),
      );
    });

    return Stack(
      children: [
        Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 120),
              Image.asset("assets/images/damta_logo.png", width: 300),
              const SizedBox(height: 120),

              // const SocialLoginLarge(), // 사각형 버튼 스타일
              const SocialLoginSmall(), // 원형 버튼 스타일

              const SizedBox(height: 50),
              const TermsAgreementText(),
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

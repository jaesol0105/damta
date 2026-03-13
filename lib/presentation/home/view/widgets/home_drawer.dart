import 'package:damta/core/service/analytics_service.dart';
import 'package:damta/core/theme/app_theme.dart';
import 'package:damta/presentation/login/view_model/auth_view_model.dart';
import 'package:damta/presentation/widget/custom_dialog.dart';
import 'package:damta/presentation/widget/custom_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomeDrawer extends HookConsumerWidget {
  const HomeDrawer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Drawer(
      width: 250,
      child: ListView(
        children: [
          // 앱 로고
          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: drawerItem(
              onTap: () {},
              // () => context.push('/melon'),
              context: context,
              leading: SizedBox(
                width: 120,
                child: Image.asset("assets/images/damta_logo_color_down.png"),
              ),
            ),
          ),

          /// 학교 정보 수정
          drawerItem(
            onTap: () {
              Navigator.of(context).pop();
              context.go('/school');
            },
            context: context,
            leading: Icon(Icons.school),
            title: '학교 정보 수정',
          ),

          /// 회원 탈퇴
          drawerItem(
            onTap: () => showCustomDialog(
              context: context,
              title: '정말 탈퇴하시겠습니까?',
              content: '탈퇴 시 데이터가 모두 삭제되며 복구되지 않습니다.',
              confirmText: '탈퇴하기',
              cancelText: '유지하기',
              reverseButtons: true,
              onConfirm: () {
                ref
                    .read(authViewModelProvider.notifier)
                    .deleteAccount(
                      onError: () {
                        Navigator.pop(context);
                        Navigator.pop(context);
                        showCustomSnackBar(
                          context: context,
                          message: '회원 탈퇴에 실패했습니다',
                        );
                      },
                    );
                AnalyticsService.event('withdraw'); // 📝
              },
            ),
            context: context,
            leading: Icon(Icons.delete),
            title: '회원 탈퇴',
            color: Colors.red,
          ),

          /// 로그아웃
          drawerItem(
            onTap: () => showCustomDialog(
              context: context,
              title: '로그아웃 하시겠습니까?',
              confirmText: '확인',
              cancelText: '취소',
              reverseButtons: false,
              onConfirm: () {
                ref
                    .read(authViewModelProvider.notifier)
                    .signOut(
                      onError: () {
                        Navigator.pop(context);
                        Navigator.pop(context);
                        showCustomSnackBar(
                          context: context,
                          message: '로그아웃에 실패했습니다',
                        );
                      },
                    );
                AnalyticsService.event('logout'); // 📝
              },
            ),
            context: context,
            leading: Icon(Icons.logout),
            title: '로그아웃',
          ),
        ],
      ),
    );
  }

  Widget drawerItem({
    required BuildContext context,
    required GestureTapCallback? onTap,
    required Widget leading,
    String? title,
    Color? color,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: vrc(context).border!)),
        ),
        child: ListTile(
          leading: leading,
          title: title == null ? null : Text(title),
          iconColor: color,
          textColor: color,
        ),
      ),
    );
  }
}

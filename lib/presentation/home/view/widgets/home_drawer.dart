import 'package:damta/core/service/analytics_service.dart';
import 'package:damta/core/theme/app_theme.dart';
import 'package:damta/presentation/login/view_model/auth_view_model.dart';
import 'package:damta/presentation/widget/custom_dialog.dart';
import 'package:damta/presentation/widget/custom_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

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
            child: _drawerItem(
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
          _drawerItem(
            onTap: () {
              Navigator.of(context).pop();
              context.go('/school');
            },
            context: context,
            leading: Icon(Icons.school),
            title: '학교 정보 수정',
          ),

          /// 문의/신고
          _drawerItem(
            onTap: () => showCustomDialog(
              context: context,
              title: '문의 및 관리자의 조치가 필요한\n사항은 아래로 연락해 주세요',
              content: 'at6768569@gmail.com',
              confirmText: '메일 보내기',
              cancelText: '취소',
              reverseButtons: false,
              onConfirm: () async {
                final Uri emailUri = Uri(
                  scheme: 'mailto',
                  path: 'at6768569@gmail.com',
                  query: Uri.encodeFull('subject=[담타 문의]&body=문의 내용을 작성해주세요.'),
                );

                if (await canLaunchUrl(emailUri)) {
                  await launchUrl(emailUri);
                } else {
                  Navigator.pop(context);
                  Navigator.pop(context);
                  showCustomSnackBar(
                    context: context,
                    message: '메일 앱을 열 수 없습니다.',
                  );
                }
              },
            ),
            context: context,
            leading: Icon(Icons.mail_outline),
            title: '문의 / 신고',
          ),

          /// 회원 탈퇴
          _drawerItem(
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
          _drawerItem(
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

  Widget _drawerItem({
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

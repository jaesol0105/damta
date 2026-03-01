import 'package:damta/core/services/firebase_service.dart';
import 'package:damta/core/theme/app_theme.dart';
import 'package:damta/presentation/notification/view_model/notification_view_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hugeicons/hugeicons.dart';

class HomeActions extends HookConsumerWidget {
  const HomeActions({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final uId = FirebaseService.getUId.toString();
    final notiList =
        ref.watch(notificationViewModelProvider(uId: uId)).value ?? [];
    // 내 알림 목록 중 isRead == false 인 알림이 있는지 여부
    final bool hasNewNoti = notiList.any((n) => n.isRead == false);

    return Row(
      children: [
        /// 알림
        actionsItem(
          context,
          onTap: () => context.push("/notification/$uId"),
          hugeIcon: HugeIcons.strokeRoundedNotification02,
          hasUpdate: hasNewNoti,
        ),

        /// 설정
        actionsItem(
          context,
          onTap: () => Scaffold.of(context).openEndDrawer(),
          hugeIcon: HugeIcons.strokeRoundedSettings01,
        ),
      ],
    );
  }

  Widget actionsItem(
    BuildContext context, {
    required GestureTapCallback? onTap,
    required List<List<dynamic>> hugeIcon,
    bool? hasUpdate,
  }) {
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: GestureDetector(
        onTap: onTap,
        child: Stack(
          children: [
            Center(
              child: HugeIcon(
                icon: hugeIcon,
                size: 26,
                color: vrc(context).contentText,
                strokeWidth: 2,
              ),
            ),
            hasUpdate == null
                ? SizedBox.shrink()
                : hasUpdate
                ? Align(
                    alignment: Alignment.topRight,
                    child: Transform.translate(
                      offset: const Offset(15, 13),
                      child: Container(
                        width: 11.5,
                        height: 11.5,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 1.5),
                        ),
                      ),
                    ),
                  )
                : const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}

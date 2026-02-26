import 'package:damta/core/services/firebase_service.dart';
import 'package:damta/core/theme/app_theme.dart';
import 'package:damta/presentation/notification/view_model/notification_view_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hugeicons/hugeicons.dart';

class NotiButton extends ConsumerWidget {
  const NotiButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final uId = FirebaseService.getUId.toString();
    final notiList =
        ref.watch(notificationViewModelProvider(uId: uId)).value ?? [];

    // 내 알림 목록 중 isRead == false 인 알림이 하나라도 있는지 확인하는 변수
    final hasNewNoti = notiList.any((n) => n.isRead == false);

    return Stack(
      children: [
        IconButton(
          onPressed: () => context.push("/notification/$uId"),
          icon: HugeIcon(
            icon: HugeIcons.strokeRoundedNotification02,
            size: 24,
            color: vrc(context).labelText,
            strokeWidth: 2,
          ),
          // child: Icon(Icons.notifications_none, size: 30, color: darkgrey),
        ),
        if (hasNewNoti)
          Positioned(
            right: 11,
            top: 11,
            child: Container(
              width: 9.5,
              height: 9.5,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.red,
              ),
            ),
          ),
      ],
    );
  }
}

import 'package:damta/core/services/firebase_service.dart';
import 'package:damta/core/theme/app_theme.dart';
import 'package:damta/presentation/view_model/notification_view_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class NotiButton extends ConsumerWidget {
  const NotiButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final uId = 'uId'; // TODO : 더미데이터 지우기
    // final uId = FirebaseService.getUId.toString();
    final notiList =
        ref.watch(notificationViewModelProvider(uId: uId)).value ?? [];

    // 내 알림 목록 중 isRead == false 인 알림이 하나라도 있는지 확인하는 변수
    final hasNewNoti = notiList.any((n) => n.isRead == false);

    return InkWell(
      onTap: () => context.push("/notification/$uId"),
      child: SizedBox(
        width: 60,
        height: 60,
        child: Stack(
          children: [
            Center(
              child: Icon(Icons.notifications_none, size: 30, color: darkgrey),
            ),
            hasNewNoti
                ? const Align(
                    alignment: Alignment(0.3, -0.3),
                    child: Icon(Icons.circle, size: 10, color: Colors.red),
                  )
                : const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}

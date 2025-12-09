import 'package:damta/core/app_theme.dart';
import 'package:damta/core/di/notification_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class NotificationView extends ConsumerWidget {
  const NotificationView({
    super.key,
    required this.uId,
    required this.pId,
    required this.isRead,
    required this.title,
    required this.content,
    required this.time,
  });
  final String uId;
  final String pId;
  final bool isRead;
  final String title;
  final String content;
  final String time;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InkWell(
      onTap: () async {
        context.push('/post/$pId');
        ref.read(notificationViewModelProvider(uId).notifier).markAsRead(pId);
      },
      child: Container(
        decoration: BoxDecoration(
          color: isRead ? Colors.transparent : blue,
          border: Border(bottom: BorderSide(color: grey)),
        ),
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 7,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
                // TODO : 알림 테스트용 삭제 버튼 > 지우기
                InkWell(
                  onTap: () {
                    ref
                        .read(notificationViewModelProvider(uId).notifier)
                        .deleteNotis(pId);
                  },
                  child: Icon(Icons.clear),
                ),
              ],
            ),
            Text(content),
            Text(time),
          ],
        ),
      ),
    );
  }
}

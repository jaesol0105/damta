import 'package:damta/core/theme/app_colors.dart';
import 'package:damta/core/theme/app_theme.dart';
import 'package:damta/presentation/notification/view_model/notification_view_model.dart';
import 'package:damta/presentation/post/view_model/post_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class NotificationView extends ConsumerWidget {
  const NotificationView({
    super.key,
    required this.uId,
    required this.pId,
    required this.nId,
    required this.isRead,
    required this.title,
    required this.content,
    required this.time,
  });
  final String uId;
  final String pId;
  final String nId;
  final bool isRead;
  final String title;
  final String content;
  final String time;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InkWell(
      onTap: () async {
        // 전체 게시글 확인
        final posts = ref.read(postViewModelProvider);
        final exists = posts.any((p) => p.pId == pId);
        // 게시글이 지워졌으면
        if (!exists) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text('게시물이 존재하지 않습니다.')));
          await ref
              .read(notificationViewModelProvider(uId: uId).notifier)
              .deleteNotis(nId); // pId 없는 알림 자동 삭제
          return; // 이동 막기
        }

        context.push('/post/$pId');
        ref
            .read(notificationViewModelProvider(uId: uId).notifier)
            .markAsRead(pId);
      },
      child: Container(
        decoration: BoxDecoration(
          color: isRead ? Colors.transparent : blue,
          border: Border(bottom: BorderSide(color: vrc(context).moduleBorder!)),
        ),
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 7,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    title,
                    style: TextStyle(fontWeight: FontWeight.bold, color: AppColors.gray700),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                InkWell(
                  onTap: () async => await ref
                      .read(notificationViewModelProvider(uId: uId).notifier)
                      .deleteNotis(nId),
                  child: Icon(Icons.clear, color: AppColors.gray500),
                ),
              ],
            ),
            Text(content, overflow: TextOverflow.ellipsis),
            Text(time, style: TextStyle(fontSize: 12, color: darkgrey)),
          ],
        ),
      ),
    );
  }
}

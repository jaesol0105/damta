import 'package:damta/core/app_theme.dart';
import 'package:damta/core/di/notification_provider.dart';
import 'package:damta/domain/entity/notification_entity.dart';
import 'package:damta/presentation/core/util/time_ago.dart';
import 'package:damta/presentation/view/pages/notification/widgets/notification_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class NotificationPage extends ConsumerWidget {
  const NotificationPage({super.key, required this.uId});

  final String uId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notis = ref.watch(notificationViewModelProvider(uId));

    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () => context.go('/'),
          child: SizedBox(
            width: 60,
            height: 60,
            child: Icon(Icons.arrow_back, size: 30, color: darkgrey),
          ),
        ),
        title: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('알림', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
              Text('도장중학교', style: TextStyle(fontSize: 14, color: darkgrey)),
            ],
          ),
        ),
      ),
      // 무한 스크롤
      body: NotificationListener(
        onNotification: (notification) {
          if (notification is ScrollUpdateNotification) {
            if (notification.metrics.pixels >= notification.metrics.maxScrollExtent) {
              ref.read(notificationViewModelProvider(uId).notifier).getMoreNotis();
            }
            return true;
          }
          return false;
        },
        // 당겨서 새로고침
        child: RefreshIndicator(
          color: blue,
          onRefresh: () async {
            ref.read(notificationViewModelProvider(uId).notifier).markAsReadAll();
          },
          child: notis.isEmpty
              ? Center(child: Text("알림이 없습니다"))
              : ListView.builder(
                  itemCount: notis.length,
                  itemBuilder: (_, index) {
                    final n = notis[index];
                    return NotificationView(
                      uId: uId,
                      pId: n.pId,
                      isRead: n.isRead,
                      title: n.isComment
                          ? "'${n.pTitle}'에 댓글이 달렸습니다."
                          : "'${n.pTitle}'에 반응이 생겼습니다.",
                      content: n.content,
                      time: timeAgo(n.createdAt),
                    );
                  },
                ),
        ),
      ),
      // TODO : 알림 테스트용 FAB + 더미데이터 > 게시판 연결 후 지우기
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // 1. 댓글 추가 시
          // ref
          //     .read(notificationViewModelProvider(uId).notifier)
          //     .addNoti(
          //       NotificationEntity(
          //         nId: '',
          //         uId: uId,
          //         pId: 'pId1',
          //         pTitle: '오늘 끝나고 노래방 갈 사람',
          //         createdAt: DateTime.now(),
          //         isComment: true,
          //         content: '나나나나나',
          //         isNew: true,
          //         isRead: false,
          //       ),
          //     );
          // 2. 이모지 추가 시
          ref
              .read(notificationViewModelProvider(uId).notifier)
              .addNoti(
                NotificationEntity(
                  nId: '',
                  uId: uId,
                  pId: 'pId2',
                  pTitle: '아 자퇴하고 싶다',
                  createdAt: DateTime.now(),
                  isComment: false,
                  content: '🩷',
                  isNew: true,
                  isRead: false,
                ),
              );
        },
      ),
    );
  }
}

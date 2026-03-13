import 'package:damta/core/theme/app_theme.dart';
import 'package:damta/presentation/ui_provider/users_provider.dart';
import 'package:damta/presentation/util/time_ago.dart';
import 'package:damta/presentation/notification/view/widgets/notification_view.dart';
import 'package:damta/presentation/notification/view_model/notification_view_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class NotificationPage extends ConsumerWidget {
  const NotificationPage({super.key, required this.uId});

  final String uId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // user 불러오기
    final userAsync = ref.watch(userProvider);

    final notis =
        ref.watch(notificationViewModelProvider(uId: uId)).value ?? [];

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            context.pop();
          },
        ),
        elevation: 0,
        centerTitle: false,
        titleSpacing: 0,
        title: Padding(
          padding: const EdgeInsets.only(left: 4),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '알림',
                style: TextStyle(
                  fontSize: 16,
                  height: 0.95,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                userAsync.when(
                  data: (user) => user.schoolName ?? '도장중학교',
                  error: (e, _) => "학교 정보를 찾을 수 없습니다.",
                  loading: () => "",
                ),
                style: TextStyle(fontSize: 14, color: vrc(context).detailText),
              ),
            ],
          ),
        ),
      ),
      // 무한 스크롤
      body: NotificationListener<ScrollNotification>(
        onNotification: (notification) {
          if (notification is ScrollEndNotification) {
            if (notification.metrics.pixels >=
                notification.metrics.maxScrollExtent - 50) {
              ref
                  .read(notificationViewModelProvider(uId: uId).notifier)
                  .getMoreNotis();
            }
            return true;
          }
          return false;
        },
        // 당겨서 새로고침
        child: RefreshIndicator(
          color: blue,
          onRefresh: () async {
            ref
                .read(notificationViewModelProvider(uId: uId).notifier)
                .markAsReadAll();
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
                      nId: n.nId!,
                      isRead: n.isRead,
                      title: n.isComment
                          ? "'${n.pTitle}' 에 댓글이 달렸습니다."
                          : "'${n.pTitle}' 에 반응이 생겼습니다.",
                      content: n.content,
                      time: timeAgo(n.nCreatedAt),
                    );
                  },
                ),
        ),
      ),
    );
  }
}

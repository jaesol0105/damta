import 'package:damta/core/theme/app_theme.dart';
import 'package:damta/presentation/view/pages/notification/widgets/notification_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// TODO : Entity 로 빼기
class NotificationEntity {
  const NotificationEntity({
    this.nId,
    required this.pId,
    required this.pTitle,
    required this.createdAt,
    required this.isComment,
    this.comment,
    this.emoji,
    required this.isNew,
    required this.isRead,
  });

  final String? nId;
  final String pId; // 해당 게시글 ID
  final String pTitle; // 해당 게시글 제목
  final String createdAt; // 시간
  final bool isComment; // 댓글인지 여부 (true = 댓글, false = 반응)
  final String? comment; // 댓글 내용
  final String? emoji; // 반응 내용
  final bool isNew; // 새로운 알림인지 여부 (댓글 표시 형식 다르게 하기 위한 변수)
  final bool isRead; // 알림 읽었는지 여부 (알림 목록에 표시되는 알림이 사라지지 않고, 읽음/안읽음 상태만 바꾸기 위한 변수)
}

/*
TODO : 게시글에서 함수 추가

1. 이모지 추가 시
ref.read(NotificationViewModelProvider.notifier)
  .addNoti(
    NotificationEntity(
      pId: pId, // post ID 넣어주세요
      pTitle: pTItle // 게시글 제목 넣어주세요
      createdAt: DateTime.now(), // converter 적용된 날짜 형식 넣어주세요
      isComment: false,
      emoji: emoji, // 어떤 이모지인지 넣어주세요
      isNew: true,
      isRead: false,
    ),
  );

2. 댓글 추가 시
ref.read(NotificationViewModelProvider.notifier)
  .addNoti(
    NotificationEntity(
      pId: pId, // post ID 넣어주세요
      pTitle: pTitle, // 게시글 제목 넣어주세요
      createdAt: DateTime.now(), // converter 적용된 날짜 형식 넣어주세요
      isComment: true,
      comment: comment, // 댓글 내용 넣어주세요 
      isNew: true,
      isRead: false,
    ),
  );
*/

class NotificationPage extends StatelessWidget {
  NotificationPage({super.key});

  // TODO : uId 로 내가 작성한 글 리스트만 가져오기
  final List<NotificationEntity> notis =
      // TODO : 더미데이터 지우기
      [
        NotificationEntity(
          pId: '1',
          pTitle: '아 자퇴하고싶다',
          createdAt: '2시간 전',
          isComment: true,
          comment: "개 웃기네 ㅋㅋㅋㅋ",
          isNew: true,
          isRead: false,
        ),
        NotificationEntity(
          pId: '2',
          pTitle: '아 자퇴하고싶다',
          createdAt: '11/23',
          isComment: false,
          emoji: "🩷",
          isNew: true,
          isRead: true,
        ),
      ];

  // 알림을 postId 기준으로 그룹화
  Map<String, List<NotificationEntity>> groupByPost(List<NotificationEntity> list) {
    final map = <String, List<NotificationEntity>>{};

    for (var n in list) {
      map.putIfAbsent(n.pId, () => []);
      map[n.pId]!.add(n);
    }
    return map;
  }

  // 그룹 안에서 새로운 댓글/반응을 묶는 함수
  List<NotificationEntity> groupedNotis(List<NotificationEntity> list) {
    final grouped = groupByPost(list); // pId로 묶기
    final List<NotificationEntity> result = [];

    grouped.forEach((postId, notis) {
      final newComments = notis.where((n) => n.isNew && n.isComment).toList();
      final newEmojis = notis.where((n) => n.isNew && !n.isComment).toList();

      // 새로운 댓글/알림 5개 이상일 때 묶어서 하나로 보여주기
      if (newComments.length >= 5) {
        result.add(
          NotificationEntity(
            pId: postId,
            pTitle: notis.first.pTitle,
            createdAt: newComments.first.createdAt,
            isComment: true,
            comment: "${newComments.length}개의 새로운 댓글",
            isNew: true,
            isRead: false,
          ),
        );
      }
      if (newEmojis.length >= 5) {
        result.add(
          NotificationEntity(
            pId: postId,
            pTitle: notis.first.pTitle,
            createdAt: newEmojis.first.createdAt,
            isComment: false,
            emoji: "${newEmojis.length}개의 새로운 반응",
            isNew: true,
            isRead: false,
          ),
        );
      }
      // 기본 알림 표시 (5개 미만 isNew = false 인 알림)
      for (var n in notis) {
        if (n.isNew == false ||
            (n.isNew && newComments.length < 5 && n.isComment) ||
            (n.isNew && newEmojis.length < 5 && !n.isComment)) {
          result.add(n);
        }
      }
    });
    // 최근순 정렬
    result.sort((a, b) => b.createdAt.compareTo(a.createdAt));
    return result;
  }

  @override
  Widget build(BuildContext context) {
    final items = groupedNotis(notis);

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
              // ref.read(notificationViewModelProvider.notifier).getMoreNotis();
            }
            return true;
          }
          return false;
        },
        // 당겨서 새로고침
        child: RefreshIndicator(
          color: blue,
          // backgroundColor: Colors.white,
          onRefresh: () async {
            // ref.read(todoViewModelProvider.notifier).getNotis(),
            // TODO : isRead = true 변경하기
          },

          child: notis.isEmpty
              ? Center(child: Text("알림이 없습니다"))
              : ListView.builder(
                  itemCount: items.length,
                  itemBuilder: (_, index) {
                    final n = items[index];

                    return NotificationView(
                      id: n.pId,
                      isRead: n.isRead,
                      title: n.isComment
                          ? "'${n.pTitle}'에 댓글이 달렸습니다."
                          : "'${n.pTitle}'에 반응이 생겼습니다.",
                      content: n.comment ?? n.emoji,
                      time: n.createdAt,
                    );
                  },
                ),
        ),
      ),
    );
  }
}

import 'package:damta/domain/entity/comment_entity.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PostDetailPage extends StatelessWidget {
  const PostDetailPage({super.key, required this.id});
  final String id;

  @override
  Widget build(BuildContext context) {
    List<CommentEntity> list = [];
    for (var i = 1; i <= 30; i++) {
      list.add(
        CommentEntity(
          cContent: "내용$i",
          cWriter: "작성자$i",
          cCreatedAt: DateTime.now(),
          pId: "포스트id",
          uId: '',
        ),
      );
    }
    print(list.length);

    String timeAgo(DateTime date) {
      final Duration diff = DateTime.now().difference(date);
      if (diff.inSeconds < 60) {
        return '방금 전';
      } else if (diff.inMinutes < 60) {
        return '${diff.inMinutes}분 전';
      } else if (diff.inHours < 24) {
        return '${diff.inHours}시간 전';
      } else if (diff.inDays < 7) {
        return '${diff.inDays}일 전';
      } else {
        return '${(diff.inDays / 7).floor()}주 전';
      }
    }

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            context.pop();
          },
        ),
        title: Column(
          children: [
            const Text("익명게시판"),
            const Text("도장중학교", style: TextStyle(color: Colors.grey)),
          ],
        ),
        actions: [Icon(Icons.notifications_outlined)],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1), // 선 높이
          child: Container(
            color: Colors.grey, // 선 색상
            height: 1, // 두께
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: InkWell(
            onTap: () {},
            child: Column(
              spacing: 10,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IntrinsicHeight(
                  child: Row(
                    children: [
                      Text("작성자"),
                      VerticalDivider(
                        width: 10,
                        thickness: 0,
                        color: Colors.grey,
                      ),
                      Text("작성시간"),
                      VerticalDivider(
                        width: 10,
                        thickness: 0,
                        color: Colors.grey,
                      ),
                      Text("조회수"),
                    ],
                  ),
                ),
                Text("제목", style: TextStyle(fontWeight: FontWeight.bold)),
                Text("내용"),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.chat_bubble_outline),
                    TextButton(
                      onPressed: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return Container();
                          },
                        );
                      },
                      child: Text("댓글달기"),
                    ),
                  ],
                ),
                ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: list.length,
                  itemBuilder: (context, index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        IntrinsicHeight(
                          child: Row(
                            children: [
                              Text(list[index].cWriter), // 작성자
                              VerticalDivider(
                                width: 10,
                                thickness: 0,
                                color: Colors.grey,
                              ),
                              Text(timeAgo(DateTime.now())), // 날짜
                            ],
                          ),
                        ),
                        Text(list[index].cContent), // 댓글 내용
                      ],
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return const Divider(
                      height: 1,
                      thickness: 0,
                      color: Colors.grey,
                      // indent: 20,
                      // endIndent: 20,
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:damta/domain/entity/post_entity.dart';
import 'package:damta/presentation/core/util/date_formatter.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PostPage extends StatelessWidget {
  const PostPage({super.key});

  @override
  Widget build(BuildContext context) {
    List<PostEntity> list = [];
    for (var i = 1; i <= 30; i++) {
      list.add(
        PostEntity(
          pTitle: "제목$i",
          pContent: "내용$i",
          pWriter: "작성자$i",
          pCreatedAt: DateTime.now(),
          view: i,
          uId: '',
        ),
      );
    }
    print(list.length);
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
      body: ListView.separated(
        itemCount: list.length,
        itemBuilder: (context, index) {
          return InkWell(
            splashColor: Color(0xFFD5ECFF),
            onTap: () {
              context.push(":id");
            },
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 5,
                children: [
                  Text(
                    list[index].pTitle,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(list[index].pContent),
                  SizedBox(height: 10),
                  IntrinsicHeight(
                    child: Row(
                      children: [
                        Icon(Icons.chat_bubble_outline),
                        const Text("300"),
                        SizedBox(width: 10),
                        Icon(Icons.favorite_border),
                        const Text("13"),
                        // 세로 구분선
                        VerticalDivider(
                          width: 10,
                          thickness: 0,
                          color: Colors.grey,
                        ),
                        Text(DateFormatter.format(DateTime.now())),
                        VerticalDivider(
                          width: 10,
                          thickness: 0,
                          color: Colors.grey,
                        ),
                        Text("조회 ${list[index].view.toString()}"),
                      ],
                    ),
                  ),
                ],
              ),
            ),
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
    );
  }
}

import 'package:damta/domain/entity/post_entity.dart';
import 'package:damta/presentation/core/util/date_formatter.dart';
import 'package:damta/presentation/view_model/post_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class PostPage extends HookConsumerWidget {
  const PostPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<PostEntity> list = ref.watch(postViewModelProvider);

    useEffect(() {
      ref.read(postViewModelProvider.notifier).loadPosts();
      return null;
    }, []);

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
              context.push("/post/${list[index].pId}");
            },
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    list[index].pTitle, // 제목
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5),
                  Text(
                    list[index].pContent, // 내용
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 10),
                  IntrinsicHeight(
                    child: Row(
                      children: [
                        Icon(Icons.chat_bubble_outline),
                        Text((list[index].cIds?.length ?? 0).toString()), // 댓글수
                        SizedBox(width: 10),
                        Icon(Icons.favorite_border),
                        Text(
                          (list[index].emojis?.length ?? 0).toString(), // 이모지수
                        ),
                        // 세로 구분선
                        VerticalDivider(
                          width: 10,
                          thickness: 0,
                          color: Colors.grey,
                        ),
                        // Text(DateFormatter.format(DateTime.now())),
                        Text(
                          DateFormatter.format(list[index].pCreatedAt),
                        ), // 등록일
                        VerticalDivider(
                          width: 10,
                          thickness: 0,
                          color: Colors.grey,
                        ),
                        Text("조회 ${list[index].view.toString()}"), // 조회수
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

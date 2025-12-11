import 'package:damta/domain/entity/comment_entity.dart';
import 'package:damta/domain/entity/post_entity.dart';
import 'package:damta/presentation/core/util/time_ago.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PostListItem extends StatelessWidget {
  const PostListItem({super.key, required this.post, required this.comments});

  final PostEntity post;
  final List<CommentEntity> comments;

  @override
  Widget build(BuildContext context) {
    final commentCount = comments.where((c) => c.pId == post.pId).length;

    return InkWell(
      splashColor: const Color(0xFFD5ECFF),
      onTap: () {
        context.push("/post/${post.pId}");
      },
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              post.pTitle,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),
            Text(post.pContent, overflow: TextOverflow.ellipsis),
            const SizedBox(height: 10),
            IntrinsicHeight(
              child: Row(
                children: [
                  const Icon(Icons.chat_bubble_outline),
                  Text(commentCount.toString()),
                  const SizedBox(width: 10),
                  const Icon(Icons.favorite_border),
                  Text((post.emojis?.length ?? 0).toString()),
                  const VerticalDivider(
                    width: 10,
                    thickness: 0,
                    color: Colors.grey,
                  ),
                  Text(timeAgo(post.pCreatedAt)),
                  const VerticalDivider(
                    width: 10,
                    thickness: 0,
                    color: Colors.grey,
                  ),
                  Text("조회 ${(post.uIdForView?.length ?? 0).toString()}"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

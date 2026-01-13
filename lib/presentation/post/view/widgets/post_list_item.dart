import 'package:damta/core/theme/app_theme.dart';
import 'package:damta/domain/entity/comment_entity.dart';
import 'package:damta/domain/entity/post_entity.dart';
import 'package:damta/presentation/util/time_ago.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hugeicons/hugeicons.dart';

class PostListItem extends StatelessWidget {
  const PostListItem({super.key, required this.post, required this.comments});

  final PostEntity post; // 현재 포스트
  final List<CommentEntity> comments; // 댓글 목록 - 전체를 다 가져오나?

  @override
  Widget build(BuildContext context) {
    final commentCount = comments
        .where((c) => c.pId == post.pId)
        .length; // 댓글 개수 계산

    return InkWell(
      onTap: () {
        context.push("/post/${post.pId}");
      },
      // 클릭했을때 퍼지는 색깔
      splashColor: vrc(context).border,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              post.pTitle,
              maxLines: 1,
              overflow: TextOverflow.ellipsis, // 길어지면 ... 출력
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),
            Text(post.pContent, overflow: TextOverflow.ellipsis),
            const SizedBox(height: 10),
            IntrinsicHeight(
              child: Row(
                children: [
                  const HugeIcon(
                    icon: HugeIcons.strokeRoundedBubbleChat,
                    // icon: HugeIcons.strokeRoundedComment01,
                    size: 20,
                    color: Colors.grey,
                    strokeWidth: 2,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    commentCount.toString(),
                    style: TextStyle(color: vrc(context).detailText),
                  ),
                  const SizedBox(width: 8),
                  const HugeIcon(
                    icon: HugeIcons.strokeRoundedFavourite,
                    size: 20,
                    color: Color.fromARGB(255, 247, 88, 76),
                    strokeWidth: 2,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    (post.emojis?.length ?? 0).toString(),
                    style: TextStyle(color: Color.fromARGB(255, 247, 88, 76)),
                  ),
                  const SizedBox(width: 10),
                  Container(width: 2, height: 12, color: vrc(context).border),
                  const SizedBox(width: 10),
                  Text(
                    timeAgo(post.pCreatedAt),
                    style: TextStyle(color: vrc(context).detailText),
                  ),
                  const SizedBox(width: 10),
                  Container(width: 2, height: 12, color: vrc(context).border),
                  const SizedBox(width: 10),
                  Text(
                    "조회 ${(post.uIdForView?.length ?? 0).toString()}",
                    style: TextStyle(color: vrc(context).detailText),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

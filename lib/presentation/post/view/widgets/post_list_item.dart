import 'package:damta/core/theme/app_colors.dart';
import 'package:damta/core/theme/app_theme.dart';
import 'package:damta/domain/entity/post_entity.dart';
import 'package:damta/presentation/util/time_ago.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hugeicons/hugeicons.dart';

class PostListItem extends StatelessWidget {
  const PostListItem({super.key, required this.post});

  final PostEntity post;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.push("/post/${post.pId}");
      },
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
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 5),
            Text(post.pContent, overflow: TextOverflow.ellipsis),
            const SizedBox(height: 10),
            IntrinsicHeight(
              child: Row(
                children: [
                  const HugeIcon(
                    icon: HugeIcons.strokeRoundedBubbleChat,
                    size: 20,
                    color: Colors.grey,
                    strokeWidth: 2,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    (post.commentCount ?? 0).toString(),
                    style: TextStyle(color: vrc(context).detailText),
                  ),
                  const SizedBox(width: 8),
                  const HugeIcon(
                    icon: HugeIcons.strokeRoundedFavourite,
                    size: 20,
                    color: AppColors.reactionLike,
                    strokeWidth: 2,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    (post.reactions?.length ?? 0).toString(),
                    style: const TextStyle(color: AppColors.reactionLike),
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
                    '조회 ${post.viewCount ?? 0}',
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

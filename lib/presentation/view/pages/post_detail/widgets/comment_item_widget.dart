import 'package:damta/domain/entity/comment_entity.dart';
import 'package:damta/presentation/core/util/time_ago.dart';
import 'package:damta/presentation/view_model/comment_view_model.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CommentItemWidget extends StatelessWidget {
  const CommentItemWidget({super.key, required this.comment});

  final CommentEntity comment;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        IntrinsicHeight(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(comment.cWriter),
                  const VerticalDivider(
                    width: 10,
                    thickness: 0,
                    color: Colors.grey,
                  ),
                  Text(timeAgo(comment.cCreatedAt)),
                ],
              ),
              SizedBox(
                width: 50,
                height: 50,
                child: Consumer(
                  builder: (context, ref, child) {
                    return IconButton(
                      onPressed: () {
                        final cId = comment.cId;
                        if (cId != null) {
                          ref
                              .read(commentViewModelProvider.notifier)
                              .deleteComment(cId);
                        }
                      },
                      icon: const Icon(Icons.delete_outline),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        Text(comment.cContent),
      ],
    );
  }
}

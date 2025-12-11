import 'package:damta/core/services/firebase_service.dart';
import 'package:damta/domain/entity/comment_entity.dart';
import 'package:damta/presentation/core/util/time_ago.dart';
import 'package:damta/presentation/view_model/comment_view_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CommentItemWidget extends StatelessWidget {
  const CommentItemWidget({super.key, required this.comment});

  final CommentEntity comment;

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        return InkWell(
          onLongPress: () {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text("삭제"),
                  content: Text("이 댓글을 삭제하시겠습니까?"),
                  actions: [
                    TextButton(
                      onPressed: () {
                        context.pop();
                      },
                      child: Text("취소"),
                    ),
                    TextButton(
                      onPressed: () {
                        context.pop();
                        final cId = comment.cId;
                        if (cId != null &&
                            comment.uId == FirebaseService.getUId) {
                          ref
                              .read(commentViewModelProvider.notifier)
                              .deleteComment(cId);
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text("사용자님이 작성하신 댓글만 삭제할 수 있습니다."),
                            ),
                          );
                        }
                      },
                      child: Text("삭제"),
                    ),
                  ],
                );
              },
            );
          },
          child: Column(
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
                  ],
                ),
              ),
              Text(comment.cContent),
            ],
          ),
        );
      },
    );
  }
}

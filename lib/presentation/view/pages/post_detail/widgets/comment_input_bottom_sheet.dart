import 'package:damta/core/services/firebase_service.dart';
import 'package:damta/domain/entity/comment_entity.dart';
import 'package:damta/domain/entity/notification_entity.dart';
import 'package:damta/domain/entity/post_entity.dart';
import 'package:damta/presentation/view_model/comment_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../view_model/notification_view_model.dart';

class CommentInputBottomSheet extends HookConsumerWidget {
  const CommentInputBottomSheet({
    super.key,
    required this.post,
    required this.pId,
  });

  final PostEntity post;
  final String pId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final commentController = useTextEditingController();
    final writerController = useTextEditingController();

    return Padding(
      padding: EdgeInsets.only(
        left: 10,
        right: 10,
        top: 5,
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("댓글 작성"),
              TextButton(
                onPressed: () async {
                  if (commentController.text.trim().isEmpty) {
                    return;
                  }
                  if (writerController.text.trim().isEmpty) {
                    writerController.text = "익명";
                  }
                  final commentEntity = CommentEntity(
                    cId: null,
                    uId: 'uId', // TODO : 더미데이터 > post.uId 바꾸기
                    cContent: commentController.text.trim(),
                    cWriter: writerController.text,
                    cCreatedAt: DateTime.now(),
                    pId: pId,
                  );
                  await ref
                      .read(commentViewModelProvider.notifier)
                      .addComment(commentEntity);
                  // 댓글 알림 추가
                  await ref // TODO : 더미데이터 > post.uId 바꾸기
                      .read(notificationViewModelProvider(uId: 'uId').notifier)
                      .addNoti(
                        NotificationEntity(
                          uId: 'uId', // TODO : 더미데이터 > post.uId 바꾸기
                          pId: pId,
                          pTitle: post.pTitle,
                          isComment: true,
                          content: commentController.text.trim(),
                          isNew: true,
                          isRead: false,
                        ),
                      );
                  commentController.clear();
                  writerController.clear();
                  if (context.mounted) {
                    context.pop();
                  }
                },
                child: const Text("완료"),
              ),
            ],
          ),
          TextField(
            autofocus: true,
            controller: writerController,
            maxLines: 1,
            decoration: InputDecoration(
              hintText: "닉네임을 입력해주세요",
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(width: 0.5),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(width: 0.5),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(width: 0.5),
              ),
            ),
          ),
          const SizedBox(height: 5),
          TextField(
            maxLines: 5,
            autofocus: false,
            controller: commentController,
            decoration: InputDecoration(
              hintText: "댓글을 입력해주세요",
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(width: 0.5),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(width: 0.5),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(width: 0.5),
              ),
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}

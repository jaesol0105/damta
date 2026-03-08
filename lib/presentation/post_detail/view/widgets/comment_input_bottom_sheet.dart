import 'package:damta/core/service/analytics_service.dart';
import 'package:damta/core/service/firebase_service.dart';
import 'package:damta/core/theme/app_theme.dart';
import 'package:damta/domain/entity/comment_entity.dart';
import 'package:damta/domain/entity/notification_entity.dart';
import 'package:damta/domain/entity/post_entity.dart';
import 'package:damta/presentation/notification/view_model/notification_view_model.dart';
import 'package:damta/presentation/post_detail/view_model/comment_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CommentInputBottomSheet extends HookConsumerWidget {
  /// 댓글 입력 창 바텀 시트
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
    final currentUserId = FirebaseService.getUId;

    return Padding(
      padding: EdgeInsets.only(
        left: 16,
        right: 16,
        top: 20,
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),

      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // 라벨 영역
              Padding(
                padding: const EdgeInsets.only(left: 4),
                child: const Text(
                  "댓글 작성",
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
              ),

              // 버튼 영역
              TextButton(
                onPressed: () async {
                  if (commentController.text.trim().isEmpty) {
                    return;
                  }
                  final commentEntity = CommentEntity(
                    cId: null,
                    uId: currentUserId.toString(),
                    cContent: commentController.text.trim(),
                    cWriter: '', // NicknameGenerator로 addComment 내부에서 덮어씀
                    cCreatedAt: DateTime.now(),
                    pId: pId,
                  );
                  await ref
                      .read(commentViewModelProvider.notifier)
                      .addComment(commentEntity);

                  // 자기 게시글에 댓글 시 알림 발생 방지
                  if (currentUserId != null && post.uId != currentUserId) {
                    await ref
                        .read(
                          notificationViewModelProvider(uId: post.uId).notifier,
                        )
                        .addNoti(
                          NotificationEntity(
                            uId: post.uId,
                            pId: pId,
                            pTitle: post.pTitle,
                            isComment: true,
                            content: commentController.text.trim(),
                            isNew: true,
                            isRead: false,
                          ),
                        );
                  }
                  if (context.mounted) context.pop();

                  // 📝
                  AnalyticsService.event(
                    'post_action',
                    p: {'action': 'cmt_create'},
                  );
                },
                child: const Text("완료"),
              ),
            ],
          ),
          const SizedBox(height: 5),

          // 텍스트 필드 영역
          TextField(
            maxLines: 5,
            autofocus: false,
            controller: commentController,
            decoration: InputDecoration(
              hintText: "댓글을 입력해주세요",
              hintStyle: TextStyle(color: vrc(context).disabledText),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(width: 1, color: vrc(context).border!),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(width: 2, color: vrc(context).border!),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(width: 1, color: vrc(context).border!),
              ),
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}

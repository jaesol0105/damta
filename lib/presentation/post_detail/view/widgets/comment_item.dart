import 'package:damta/core/service/analytics_service.dart';
import 'package:damta/core/service/firebase_service.dart';
import 'package:damta/core/theme/app_theme.dart';
import 'package:damta/domain/entity/comment_entity.dart';
import 'package:damta/domain/enum/report_target_type_enum.dart';
import 'package:damta/presentation/post_detail/view/widgets/report_bottom_sheet.dart';
import 'package:damta/presentation/widget/custom_dialog.dart';
import 'package:damta/presentation/util/time_ago.dart';
import 'package:damta/presentation/post_detail/view_model/comment_view_model.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CommentItem extends StatelessWidget {
  /// 댓글 위젯
  const CommentItem({
    super.key,
    required this.comment,
    required this.schoolCode,
  });

  final CommentEntity comment;
  final String schoolCode;

  @override
  Widget build(BuildContext context) {
    final currentUId = FirebaseService.getUId;
    final isOwner = comment.uId == currentUId;

    return Consumer(
      builder: (context, ref, child) {
        return InkWell(
          // 롱 프레스
          onLongPress: () {
            if (isOwner) {
              showCustomDialog(
                context: context,
                title: '댓글을 삭제하시겠습니까?',
                confirmText: '삭제',
                confirmColor: fxc(context).brandColor,
                cancelText: '취소',
                reverseButtons: false,
                onConfirm: () {
                  Navigator.pop(context);
                  final cId = comment.cId;
                  if (cId != null) {
                    ref
                        .read(commentViewModelProvider.notifier)
                        .deleteComment(cId, comment.pId);
                    // 📝
                    AnalyticsService.event(
                      'post_action',
                      p: {'action': 'cmt_delete'},
                    );
                  }
                },
              );
            } else if (currentUId != null) {
              showModalBottomSheet(
                context: context,
                builder: (_) => ReportBottomSheet(
                  reporterUid: currentUId,
                  targetType: ReportTargetType.comment,
                  targetId: comment.cId ?? '',
                  targetUid: comment.uId,
                  schoolCode: schoolCode,
                ),
              );
            }
          },

          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 14.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          comment.cWriter,
                          style: TextStyle(color: vrc(context).detailText),
                        ),
                        const SizedBox(width: 10),
                        Container(
                          width: 2,
                          height: 12,
                          color: vrc(context).border,
                        ),
                        const SizedBox(width: 10),
                        Text(
                          timeAgo(comment.cCreatedAt),
                          style: TextStyle(color: vrc(context).detailText),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(width: 4),
                Text(comment.cContent),
              ],
            ),
          ),
        );
      },
    );
  }
}

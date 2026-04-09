import 'dart:io';

import 'package:damta/core/service/analytics_service.dart';
import 'package:damta/core/service/firebase_service.dart';
import 'package:damta/core/theme/app_theme.dart';
import 'package:damta/domain/entity/notification_entity.dart';
import 'package:damta/domain/entity/post_entity.dart';
import 'package:damta/presentation/notification/view_model/notification_view_model.dart';
import 'package:damta/presentation/post/view_model/post_view_model.dart';
import 'package:damta/presentation/util/emoji_list.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class EmojiPicker {
  static OverlayEntry createEmojiPickerOverlay({
    required BuildContext context,
    required PostEntity post,
    required WidgetRef ref,
    required VoidCallback onClose,
  }) {
    final screenSize = MediaQuery.of(context).size;
    final currentUserId = FirebaseService.getUId;

    return OverlayEntry(
      builder: (context) => Stack(
        children: [
          Positioned.fill(
            child: GestureDetector(
              onTap: onClose,
              child: Container(color: Colors.transparent),
            ),
          ),
          Center(
            child: Material(
              elevation: 8,
              borderRadius: BorderRadius.circular(12),
              child: Container(
                width: screenSize.width * 0.75,
                constraints: BoxConstraints(maxHeight: screenSize.height * 0.5),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: vrc(context).surface,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurStyle: BlurStyle.normal,
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: SingleChildScrollView(
                  child: Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: emojiList
                        .map(
                          (emoji) => InkWell(
                            onTap: () {
                              if (currentUserId == null) return;
                              // 이미 같은 이모지를 선택했으면 무시
                              if (post.reactions?.containsKey(
                                    '${currentUserId}_$emoji',
                                  ) ==
                                  true) {
                                onClose();
                                return;
                              }
                              // 이모지 반응 추가
                              ref
                                  .read(postViewModelProvider.notifier)
                                  .addReaction(post.pId!, currentUserId, emoji);
                              // 자기 게시글에 반응 시 알림 발생 방지
                              if (post.uId != currentUserId) {
                                ref
                                    .read(
                                      notificationViewModelProvider(
                                        uId: post.uId,
                                      ).notifier,
                                    )
                                    .addNoti(
                                      NotificationEntity(
                                        uId: post.uId,
                                        pId: post.pId!,
                                        pTitle: post.pTitle,
                                        isComment: false,
                                        content: emoji,
                                        isNew: true,
                                        isRead: false,
                                      ),
                                    );
                              }
                              onClose();

                              // 📝
                              AnalyticsService.event(
                                'post_action',
                                p: {'action': 'emoji'},
                              );
                            },
                            child: Container(
                              width: 40,
                              height: 40,
                              alignment: Alignment.center,
                              child: Text(
                                emoji,
                                style: TextStyle(
                                  fontSize: 24,
                                  fontFamily: Platform.isAndroid
                                      ? 'NotoColorEmoji'
                                      : null,
                                ),
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

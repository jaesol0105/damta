import 'dart:io';

import 'package:damta/core/config/routes.dart';
import 'package:damta/core/services/analytics_service.dart';
import 'package:damta/core/services/firebase_service.dart';
import 'package:damta/core/theme/app_theme.dart';
import 'package:damta/domain/enum/report_target_type_enum.dart';
import 'package:damta/presentation/post_detail/view/widgets/report_bottom_sheet.dart';
import 'package:damta/presentation/ui_provider/users_provider.dart';
import 'package:damta/presentation/util/time_ago.dart';
import 'package:damta/presentation/post_detail/view/full_image_page.dart';
import 'package:damta/presentation/post_detail/view/widgets/comment_input_bottom_sheet.dart';
import 'package:damta/presentation/post_detail/view/widgets/comment_item_widget.dart';
import 'package:damta/presentation/post_detail/view/widgets/emoji_picker_widget.dart';
import 'package:damta/presentation/post_detail/view_model/comment_view_model.dart';
import 'package:damta/presentation/post/view_model/post_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hugeicons/hugeicons.dart';

class PostDetailPage extends HookConsumerWidget {
  const PostDetailPage({super.key, required this.pId});
  final String pId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final showEmojiPicker = useState(false);
    final overlayEntryRef = useRef<OverlayEntry?>(null);

    final userValue = ref.watch(userProvider).value;
    final currentUId = userValue?.uId;
    final schoolCode = userValue?.schoolCode ?? '';

    final postList = ref.watch(postViewModelProvider);
    final post = postList.firstWhere(
      (p) => p.pId == pId,
      orElse: () => throw Exception("Post not found"),
    );
    final isOwner = post.uId == currentUId;

    final comments = ref.watch(commentViewModelProvider);
    final commentList = comments.where((c) => c.pId == pId).toList()
      ..sort(
        (a, b) => (a.cCreatedAt ?? DateTime(0)).compareTo(
          b.cCreatedAt ?? DateTime(0),
        ),
      );

    // 페이지 진입 시 댓글 로드 + 조회수 증가
    useEffect(() {
      ref.read(commentViewModelProvider.notifier).getComments(pId);
      ref.read(postViewModelProvider.notifier).incrementViewCount(pId);
      return null;
    }, []);

    void removePopup() {
      overlayEntryRef.value?.remove();
      overlayEntryRef.value = null;
      showEmojiPicker.value = false;
    }

    void showPopup() {
      if (overlayEntryRef.value != null) return;
      overlayEntryRef.value = EmojiPickerWidget.createEmojiPickerOverlay(
        context: context,
        post: post,
        ref: ref,
        onClose: removePopup,
      );
      Overlay.of(context).insert(overlayEntryRef.value!);
      showEmojiPicker.value = true;
    }

    useEffect(() {
      return () {
        overlayEntryRef.value?.remove();
      };
    }, []);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, size: 28),
          onPressed: () {
            context.pop();
          },
        ),
        elevation: 0,
        centerTitle: false,
        titleSpacing: 0,
        title: Padding(
          padding: const EdgeInsets.only(left: 4),
          child: Text(
            '익명 게시판',
            style: TextStyle(
              fontSize: 20,
              height: 0.95,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        actions: [
          // 게시글 작성자만 수정/삭제 메뉴 표시
          if (isOwner)
            Padding(
              padding: EdgeInsets.only(right: 10),
              child: PopupMenuButton<String>(
                icon: const Icon(Icons.more_vert, size: 28),
                onSelected: (value) {
                  if (value == 'edit') {
                    context.push(AppRoutePath.postEditor, extra: post);
                  } else if (value == 'delete') {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text("삭제"),
                          content: Text("정말로 삭제하시겠습니까?"),
                          actions: [
                            TextButton(
                              onPressed: () {
                                context.pop();
                              },
                              child: Text("취소"),
                            ),
                            TextButton(
                              onPressed: () async {
                                if (context.mounted) {
                                  context.pop();
                                  context.pop();
                                }
                                await ref
                                    .read(postViewModelProvider.notifier)
                                    .deletePost(pId);
                                // 📝
                                AnalyticsService.event(
                                  'post_action',
                                  p: {'action': 'delete'},
                                );
                              },
                              child: const Text("삭제"),
                            ),
                          ],
                        );
                      },
                    );
                  }
                },
                itemBuilder: (context) => [
                  const PopupMenuItem(value: 'edit', child: Text('수정')),
                  const PopupMenuItem(value: 'delete', child: Text('삭제')),
                ],
              ),
            )
          else if (currentUId != null)
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: IconButton(
                icon: const Icon(Icons.more_vert, size: 28),
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (_) => ReportBottomSheet(
                      reporterUid: currentUId,
                      targetType: ReportTargetType.post,
                      targetId: pId,
                      targetUid: post.uId,
                      schoolCode: schoolCode,
                    ),
                  );
                },
              ),
            ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            spacing: 10,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IntrinsicHeight(
                child: Padding(
                  padding: const EdgeInsets.only(left: 1),
                  child: Row(
                    children: [
                      Text(
                        post.pWriter,
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
                        timeAgo(post.pCreatedAt),
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
                        '조회수 ${post.viewCount ?? 0}',
                        style: TextStyle(color: vrc(context).detailText),
                      ),
                    ],
                  ),
                ),
              ),
              Text(
                post.pTitle,
                style: TextStyle(
                  fontSize: 18,
                  height: 1.2,
                  fontWeight: FontWeight.bold,
                  color: vrc(context).labelText,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 1),
                child: Text(post.pContent, style: TextStyle(height: 1.2)),
              ),
              SizedBox(height: 20),

              if (post.pImageUrl != null && post.pImageUrl!.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: buildPostImage(context, post.pImageUrl!),
                ),

              // 이모지 반응 (슬랙처럼 그룹화 + 카운트 표시)
              Builder(
                builder: (context) {
                  // 이모지별 카운트 + 첫 반응 시각 집계
                  // key: userId_emoji 형태, value: timestamp 형식
                  final grouped = <String, int>{};
                  final firstTime = <String, int>{};
                  for (final entry
                      in post.reactions?.entries ??
                          <MapEntry<String, String>>[]) {
                    final sep = entry.key.indexOf('_');
                    if (sep < 0) continue;
                    final emoji = entry.key.substring(sep + 1);
                    final ts = int.tryParse(entry.value) ?? 0;
                    grouped[emoji] = (grouped[emoji] ?? 0) + 1;
                    if (!firstTime.containsKey(emoji) ||
                        ts < firstTime[emoji]!) {
                      firstTime[emoji] = ts;
                    }
                  }

                  // 첫 반응 시각 기준 오름차순 정렬
                  final sortedEntries = grouped.entries.toList()
                    ..sort(
                      (a, b) => (firstTime[a.key] ?? 0).compareTo(
                        firstTime[b.key] ?? 0,
                      ),
                    );

                  // 현재 유저가 반응한 이모지 목록
                  final myEmojis = (post.reactions ?? {}).entries
                      .where(
                        (e) =>
                            currentUId != null &&
                            e.key.startsWith('${currentUId}_'),
                      )
                      .map((e) => e.key.substring(e.key.indexOf('_') + 1))
                      .toSet();

                  return Wrap(
                    spacing: 6,
                    runSpacing: 6,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      // 이모지 추가 버튼
                      InkWell(
                        onTap: () {
                          if (showEmojiPicker.value) {
                            removePopup();
                          } else {
                            showPopup();
                          }
                        },
                        borderRadius: BorderRadius.circular(30),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: vrc(context).background,
                            border: Border.all(
                              color: vrc(context).border!,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: HugeIcon(
                            icon: HugeIcons.strokeRoundedHeartAdd,
                            size: 24,
                            color: vrc(context).detailText,
                            strokeWidth: 2,
                          ),
                        ),
                      ),
                      // 그룹화된 이모지 버블
                      ...sortedEntries.map((entry) {
                        final isHighlighted = myEmojis.contains(entry.key);
                        return InkWell(
                          borderRadius: BorderRadius.circular(30),
                          onTap: () {
                            if (currentUId == null) return;
                            if (isHighlighted) {
                              ref
                                  .read(postViewModelProvider.notifier)
                                  .removeReaction(
                                    post.pId!,
                                    currentUId,
                                    entry.key,
                                  );
                            } else {
                              ref
                                  .read(postViewModelProvider.notifier)
                                  .addReaction(
                                    post.pId!,
                                    currentUId,
                                    entry.key,
                                  );
                            }
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: isHighlighted
                                  ? Theme.of(
                                      context,
                                    ).colorScheme.primary.withOpacity(0.12)
                                  : vrc(context).background,
                              border: Border.all(
                                color: vrc(context).border!,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  entry.key,
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontFamily: Platform.isAndroid
                                        ? 'NotoColorEmoji'
                                        : null,
                                  ),
                                ),
                                if (entry.value >= 1) ...[
                                  const SizedBox(width: 4),
                                  Text(
                                    '${entry.value}',
                                    style: TextStyle(
                                      fontSize: 13,
                                      color: isHighlighted
                                          ? Theme.of(
                                              context,
                                            ).colorScheme.primary
                                          : null,
                                    ),
                                  ),
                                ],
                              ],
                            ),
                          ),
                        );
                      }),
                    ],
                  );
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      HugeIcon(
                        icon: HugeIcons.strokeRoundedBubbleChat,
                        size: 24,
                        color: vrc(context).detailText,
                        strokeWidth: 2,
                      ),
                      SizedBox(width: 8),
                      Text(
                        commentList.length.toString(),
                        style: TextStyle(color: vrc(context).detailText),
                      ),
                    ],
                  ),
                  TextButton(
                    onPressed: () {
                      showModalBottomSheet(
                        isScrollControlled: true,
                        context: context,
                        builder: (context) =>
                            CommentInputBottomSheet(post: post, pId: pId),
                      );
                    },
                    child: const Text("댓글달기"),
                  ),
                ],
              ),
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: commentList.length,
                itemBuilder: (context, index) {
                  return CommentItemWidget(
                    comment: commentList[index],
                    schoolCode: schoolCode,
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return Divider(
                    height: 1,
                    thickness: 0,
                    color: vrc(context).border,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget buildPostImage(BuildContext context, String url) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => FullImagePage(imageUrl: url)),
      );
    },
    child: ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Image.network(
        url,
        width: double.infinity,
        height: 180,
        fit: BoxFit.cover,
      ),
    ),
  );
}

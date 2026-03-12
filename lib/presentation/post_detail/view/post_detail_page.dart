import 'dart:io';

import 'package:damta/core/config/routes.dart';
import 'package:damta/core/service/analytics_service.dart';
import 'package:damta/core/theme/app_theme.dart';
import 'package:damta/domain/enum/report_target_type_enum.dart';
import 'package:damta/presentation/post_detail/view/widgets/emoji_reaction_section.dart';
import 'package:damta/presentation/post_detail/view/widgets/report_bottom_sheet.dart';
import 'package:damta/presentation/ui_provider/users_provider.dart';
import 'package:damta/presentation/widget/custom_dialog.dart';
import 'package:damta/presentation/util/time_ago.dart';
import 'package:damta/presentation/post_detail/view/full_image_page.dart';
import 'package:damta/presentation/post_detail/view/widgets/comment_input_bottom_sheet.dart';
import 'package:damta/presentation/post_detail/view/widgets/comment_item.dart';
import 'package:damta/presentation/post_detail/view/widgets/emoji_picker.dart';
import 'package:damta/presentation/post_detail/view_model/comment_view_model.dart';
import 'package:damta/presentation/post/view_model/post_view_model.dart';
import 'package:damta/presentation/widget/custom_snackbar.dart';
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

    final currentUId = ref.watch(currentUIdProvider);
    final schoolCode = ref.watch(userProvider).value?.schoolCode ?? '';

    final postList = ref.watch(postViewModelProvider);
    final postIdx = postList.indexWhere((p) => p.pId == pId); // 현재 글
    final currentPost = postIdx != -1 ? postList[postIdx] : null; // 글 숨기기 대응
    final cachedPost = useState(currentPost); // 캐싱해서 삭제 후 pop 할때 빈 화면 방지
    if (currentPost != null) cachedPost.value = currentPost;
    final post = cachedPost.value;

    if (post == null) {
      return Scaffold(
        appBar: AppBar(),
        body: const Center(
          child: Text('삭제된 게시글입니다.', style: TextStyle(color: Colors.grey)),
        ),
      );
    }

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
      overlayEntryRef.value = EmojiPicker.createEmojiPickerOverlay(
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
                    showCustomDialog(
                      context: context,
                      title: '게시글을 삭제합니다',
                      confirmText: '삭제',
                      cancelText: '취소',
                      reverseButtons: false,
                      onConfirm: () async {
                        if (context.mounted) {
                          Navigator.pop(context);
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
                    builder: (_) => _PostActionSheet(
                      currentUId: currentUId,
                      pId: pId,
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

              // 이모지 반응 영역
              EmojiReactionSection(
                reactions: post.reactions,
                currentUId: currentUId,
                onTogglePicker: () {
                  if (showEmojiPicker.value) {
                    removePopup();
                  } else {
                    showPopup();
                  }
                },
                onTapEmoji: (emoji, isHighlighted) {
                  if (currentUId == null) return;
                  final notifier = ref.read(postViewModelProvider.notifier);
                  if (isHighlighted) {
                    notifier.removeReaction(post.pId!, currentUId!, emoji);
                  } else {
                    notifier.addReaction(post.pId!, currentUId!, emoji);
                  }
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
                  return CommentItem(
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

/// 게시글 신고, 숨기기 선택 시트
class _PostActionSheet extends ConsumerWidget {
  const _PostActionSheet({
    required this.currentUId,
    required this.pId,
    required this.targetUid,
    required this.schoolCode,
  });

  final String currentUId;
  final String pId;
  final String targetUid;
  final String schoolCode;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: const Icon(Icons.flag_outlined),
            title: const Text('신고하기'),
            onTap: () {
              Navigator.pop(context);
              showModalBottomSheet(
                context: context,
                builder: (_) => ReportBottomSheet(
                  reporterUid: currentUId,
                  targetType: ReportTargetType.post,
                  targetId: pId,
                  targetUid: targetUid,
                  schoolCode: schoolCode,
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.visibility_off_outlined),
            title: const Text('이 글 숨기기'),
            onTap: () async {
              try {
                await ref
                    .read(postViewModelProvider.notifier)
                    .hidePost(pId, currentUId);
                if (context.mounted) {
                  showCustomSnackBar(
                    context: context,
                    message: '게시글을 숨겼습니다. 해당 글이 더는 표시되지 않습니다.',
                  );
                  Navigator.pop(context);
                  context.pop();
                }
              } catch (e) {
                if (context.mounted) {
                  showCustomSnackBar(
                    context: context,
                    message: e.toString().replaceAll('Exception: ', ''),
                  );
                  Navigator.pop(context);
                }
              }
            },
          ),
        ],
      ),
    );
  }
}

import 'package:damta/core/config/routes.dart';
import 'package:damta/core/services/analytics_service.dart';
import 'package:damta/core/services/firebase_service.dart';
import 'package:damta/core/theme/app_theme.dart';
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

    final post = ref
        .watch(postViewModelProvider)
        .firstWhere(
          (p) => p.pId == pId,
          orElse: () => throw Exception("Post not found"),
        );
    final comments = ref.watch(commentViewModelProvider);
    final commentList = comments.where((c) => c.pId == pId).toList()
      ..sort((a, b) => a.cCreatedAt.compareTo(b.cCreatedAt));

    useEffect(() {
      print('😡$post');
      ref.read(commentViewModelProvider.notifier).getComments();
      ref
          .read(postViewModelProvider.notifier)
          .updatePost(
            post.copyWith(
              uIdForView: {
                ...(post.uIdForView ?? {}),
                FirebaseService.getUId.toString(),
              },
            ),
          );
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
                                context.pop(); // 다이얼로그 닫기
                                context.pop(); // 상세 페이지 닫기
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
                        '조회수 ${(post.uIdForView?.length ?? 0).toString()}',
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

              // 이미지 출력 추가
              if (post.pImageUrl != null && post.pImageUrl!.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: buildPostImage(context, post.pImageUrl!),
                ),

              Row(
                spacing: 5,
                children: [
                  InkWell(
                    onTap: () {
                      if (showEmojiPicker.value) {
                        removePopup();
                      } else {
                        showPopup();
                      }
                    },
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
                    // child: Icon(Icons.add_circle_outline),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        spacing: 5,
                        children:
                            post.emojis?.reversed
                                .map(
                                  (e) => Text(
                                    e,
                                    style: const TextStyle(fontSize: 24),
                                  ),
                                )
                                .toList() ??
                            [],
                      ),
                    ),
                  ),
                ],
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
                      //const Icon(Icons.chat_bubble_outline),
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
                  return CommentItemWidget(comment: commentList[index]);
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
      // 확대 이미지 페이지로 이동
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

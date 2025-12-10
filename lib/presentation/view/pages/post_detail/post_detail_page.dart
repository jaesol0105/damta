import 'package:damta/presentation/core/util/date_formatter.dart';
import 'package:damta/presentation/core/util/time_ago.dart';
import 'package:damta/presentation/view/pages/post_detail/widgets/comment_input_bottom_sheet.dart';
import 'package:damta/presentation/view/pages/post_detail/widgets/comment_item_widget.dart';
import 'package:damta/presentation/view/pages/post_detail/widgets/emoji_picker_widget.dart';
import 'package:damta/presentation/view_model/comment_view_model.dart';
import 'package:damta/presentation/view_model/post_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

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
      ref.read(commentViewModelProvider.notifier).getComments();
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
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            context.pop();
          },
        ),
        title: const Column(
          children: [
            Text("익명게시판"),
            Text("도장중학교", style: TextStyle(color: Colors.grey)),
          ],
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 20),
            child: PopupMenuButton<String>(
              icon: const Icon(Icons.more_vert),

              onSelected: (value) {
                if (value == 'edit') {
                  print('수정 선택');
                } else if (value == 'delete') {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        actions: [
                          TextButton(
                            onPressed: () {
                              context.pop();
                            },
                            child: Text("취소"),
                          ),
                          TextButton(
                            onPressed: () async {
                              await ref
                                  .read(postViewModelProvider.notifier)
                                  .deletePost(pId);
                              if (context.mounted) {
                                context.pop(); // 다이얼로그 닫기
                                context.pop(); // 상세 페이지 닫기
                              }
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
                child: Row(
                  children: [
                    Text(post.pWriter),
                    const VerticalDivider(
                      width: 10,
                      thickness: 0,
                      color: Colors.grey,
                    ),
                    Text(timeAgo(post.pCreatedAt)),
                    const VerticalDivider(
                      width: 10,
                      thickness: 0,
                      color: Colors.grey,
                    ),
                    Text(post.view.toString()),
                  ],
                ),
              ),
              Text(
                post.pTitle,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(post.pContent),
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
                    child: const SizedBox(
                      width: 50,
                      height: 50,
                      child: Icon(Icons.add_circle_outline),
                    ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        spacing: 5,
                        children:
                            post.emojis
                                ?.map(
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
                      const Icon(Icons.chat_bubble_outline),
                      Text(commentList.length.toString()),
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
                  return const Divider(
                    height: 1,
                    thickness: 0,
                    color: Colors.grey,
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

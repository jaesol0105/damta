import 'package:damta/core/services/firebase_service.dart';
import 'package:damta/data/util/extension/date_time_extension.dart';
import 'package:damta/domain/entity/post_entity.dart';
import 'package:damta/presentation/view_model/post_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class PostInputBottomSheet extends HookConsumerWidget {
  const PostInputBottomSheet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final titleController = useTextEditingController();
    final contentController = useTextEditingController();
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
              const Text("게시글 작성"),
              TextButton(
                onPressed: () async {
                  if (titleController.text.trim().isEmpty) {
                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(const SnackBar(content: Text("제목을 입력해주세요")));
                    return;
                  }
                  if (contentController.text.trim().isEmpty) {
                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(const SnackBar(content: Text("내용을 입력해주세요")));
                    return;
                  }
                  if (writerController.text.trim().isEmpty) {
                    writerController.text = "익명";
                  }
                  final postEntity = PostEntity(
                    pId: null,
                    uId: FirebaseService.getUId.toString(),
                    pTitle: titleController.text.trim(),
                    pContent: contentController.text.trim(),
                    pWriter: writerController.text.trim(),
                    pCreatedAt: DateTime.now(),
                    pImageUrl: null,
                    emojis: null,
                    uIdForView: {},
                  );
                  await ref
                      .read(postViewModelProvider.notifier)
                      .addPost(postEntity);
                  titleController.clear();
                  contentController.clear();
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
            controller: titleController,
            maxLines: 1,
            decoration: InputDecoration(
              hintText: "제목을 입력해주세요",
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
            controller: contentController,
            decoration: InputDecoration(
              hintText: "내용을 입력해주세요",
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

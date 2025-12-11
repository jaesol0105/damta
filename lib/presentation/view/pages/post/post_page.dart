import 'package:damta/presentation/view/pages/home/widgets/noti_button.dart';
import 'package:damta/presentation/view/pages/post/widgets/post_input_bottom_sheet.dart';
import 'package:damta/presentation/view/pages/post/widgets/post_list_item.dart';
import 'package:damta/presentation/view_model/comment_view_model.dart';
import 'package:damta/presentation/view_model/post_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class PostPage extends HookConsumerWidget {
  const PostPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final posts = ref.watch(postViewModelProvider);
    final comments = ref.watch(commentViewModelProvider);

    useEffect(() {
      ref.read(postViewModelProvider.notifier).loadPosts();
      ref.read(commentViewModelProvider.notifier).getComments();
      return null;
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
        // TODO : 알림 버튼 지우기
        actions: [NotiButton()],
      ),
      body: ListView.separated(
        itemCount: posts.length,
        itemBuilder: (context, index) {
          return PostListItem(post: posts[index], comments: comments);
        },
        separatorBuilder: (BuildContext context, int index) {
          return const Divider(height: 1, thickness: 0, color: Colors.grey);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            isScrollControlled: true,
            context: context,
            builder: (context) => const PostInputBottomSheet(),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

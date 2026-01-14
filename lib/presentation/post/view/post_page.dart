import 'package:damta/core/config/routes.dart';
import 'package:damta/core/theme/app_theme.dart';
import 'package:damta/presentation/home/view/widgets/noti_button.dart';
import 'package:damta/presentation/post/view/widgets/post_list_item.dart';
import 'package:damta/presentation/post_detail/view_model/comment_view_model.dart';
import 'package:damta/presentation/post/view_model/post_view_model.dart';
import 'package:damta/presentation/ui_provider/users_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hugeicons/hugeicons.dart';

class PostPage extends HookConsumerWidget {
  const PostPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // user 불러오기
    final userAsync = ref.watch(userProvider);

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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '익명 게시판',
                style: TextStyle(
                  fontSize: 16,
                  height: 0.95,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                userAsync.when(
                  data: (user) => user.schoolName,
                  error: (e, _) => "학교 정보를 찾을 수 없습니다.",
                  loading: () => "",
                ),
                style: TextStyle(fontSize: 14, color: vrc(context).detailText),
              ),
            ],
          ),
        ),
        actions: [NotiButton()],
      ),
      body: Stack(
        children: [
          ListView.separated(
            itemCount: posts.length,
            itemBuilder: (context, index) {
              return PostListItem(post: posts[index], comments: comments);
            },
            separatorBuilder: (BuildContext context, int index) {
              return Divider(
                height: 1,
                thickness: 0,
                color: vrc(context).border,
              );
            },
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 10,
            child: SafeArea(
              top: false,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Center(
                  child: ElevatedButton(
                    onPressed: () {
                      context.push(AppRoutePath.postEditor);
                    },
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      backgroundColor: Color.fromARGB(255, 104, 195, 255),
                      foregroundColor: vrc(context).contentText,
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      minimumSize: const Size(0, 48),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                        side: BorderSide(color: vrc(context).border!),
                      ),
                    ),

                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        HugeIcon(
                          icon: HugeIcons.strokeRoundedPen01,
                          size: 20,
                          color: Colors.white,
                          strokeWidth: 2,
                        ),
                        SizedBox(width: 6),
                        Text(
                          '글 쓰기',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     context.push(AppRoutePath.postEditor);
      //     // showModalBottomSheet(
      //     //   isScrollControlled: true,
      //     //   context: context,
      //     //   builder: (context) => const PostInputBottomSheet(),
      //     // );
      //   },
      //   child: const Icon(Icons.add),
      // ),
    );
  }
}

import 'package:damta/domain/entity/comment_entity.dart';
import 'package:damta/presentation/core/util/date_formatter.dart';
import 'package:damta/presentation/core/util/time_ago.dart';
import 'package:damta/presentation/view_model/post_view_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class PostDetailPage extends ConsumerStatefulWidget {
  const PostDetailPage({super.key, required this.pId});
  final String pId;

  @override
  ConsumerState<PostDetailPage> createState() => _PostDetailPageState();
}

class _PostDetailPageState extends ConsumerState<PostDetailPage> {
  OverlayEntry? overlayEntry;

  final LayerLink layerLink = LayerLink();
  @override
  Widget build(BuildContext context) {
    List<CommentEntity> list = [];
    final post = ref
        .watch(postViewModelProvider)
        .firstWhere(
          (p) => p.pId == widget.pId,
          orElse: () => throw Exception("Post not found"),
        );

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            context.pop();
          },
        ),
        title: Column(
          children: [
            const Text("익명게시판"),
            const Text("도장중학교", style: TextStyle(color: Colors.grey)),
          ],
        ),
        actions: [Icon(Icons.notifications_outlined)],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1), // 선 높이
          child: Container(
            color: Colors.grey, // 선 색상
            height: 1, // 두께
          ),
        ),
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
                    Text(post.pWriter), // 작성자
                    VerticalDivider(
                      width: 10,
                      thickness: 0,
                      color: Colors.grey,
                    ),
                    Text(DateFormatter.format(post.pCreatedAt)), // 작성시간
                    VerticalDivider(
                      width: 10,
                      thickness: 0,
                      color: Colors.grey,
                    ),
                    Text(post.view.toString()), // 조회수
                  ],
                ),
              ),
              Text(
                post.pTitle,
                style: TextStyle(fontWeight: FontWeight.bold), // 제목
              ),
              Text(post.pContent), // 내용
              Row(
                spacing: 5,
                children: [
                  // 반응추가
                  CompositedTransformTarget(
                    link: layerLink,
                    child: InkWell(
                      onTap: () {
                        showPopup();
                      },
                      child: SizedBox(
                        width: 50,
                        height: 50,
                        child: Icon(Icons.add_circle_outline),
                      ),
                    ),
                  ),
                  // 선택된 이모지들
                  Expanded(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        spacing: 5,
                        children:
                            post.emojis
                                ?.map(
                                  (e) =>
                                      Text(e, style: TextStyle(fontSize: 24)),
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
                    // spacing: 5,
                    children: [
                      Icon(Icons.chat_bubble_outline),
                      Text((post.cIds?.length).toString()), // 댓글수
                    ],
                  ),
                  TextButton(
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return Container();
                        },
                      );
                    },
                    child: Text("댓글달기"),
                  ),
                ],
              ),
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: list.length,
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      IntrinsicHeight(
                        child: Row(
                          children: [
                            Text(list[index].cWriter), // 작성자
                            VerticalDivider(
                              width: 10,
                              thickness: 0,
                              color: Colors.grey,
                            ),
                            Text(timeAgo(DateTime.now())), // 날짜
                          ],
                        ),
                      ),
                      Text(list[index].cContent), // 댓글 내용
                    ],
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const Divider(
                    height: 1,
                    thickness: 0,
                    color: Colors.grey,
                    // indent: 20,
                    // endIndent: 20,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  OverlayEntry _buildOverlay() {
    return OverlayEntry(
      builder: (context) {
        return Positioned.fill(
          child: Stack(
            children: [
              // 배경 클릭시 닫기
              GestureDetector(
                onTap: removePopup,
                child: Container(color: Colors.transparent),
              ),

              // 버튼 위에 붙는 팝업
              CompositedTransformFollower(
                link: layerLink,
                offset: const Offset(0, -60), // 버튼 위로 60px 이동
                showWhenUnlinked: false,
                child: Material(
                  elevation: 5,
                  borderRadius: BorderRadius.circular(12),
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: ["🤣", "👍", "❤️", "🔥"]
                          .map(
                            (e) => GestureDetector(
                              onTap: () {
                                // 1. 리스트에 추가

                                // 2. 팝업 닫기
                                removePopup();
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(6),
                                child: Text(e, style: TextStyle(fontSize: 24)),
                              ),
                            ),
                          )
                          .toList(),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void showPopup() {
    overlayEntry = _buildOverlay();
    Overlay.of(context).insert(overlayEntry!); // 화면 위에 띄움
  }

  void removePopup() {
    overlayEntry?.remove();
    overlayEntry = null;
  }
}

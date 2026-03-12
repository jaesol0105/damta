import 'dart:io';

import 'package:damta/core/service/analytics_service.dart';
import 'package:damta/core/theme/app_theme.dart';
import 'package:damta/core/util/debouncer.dart';
import 'package:damta/domain/entity/post_entity.dart';
import 'package:damta/presentation/post/view_model/post_view_model.dart';
import 'package:damta/presentation/post_editor/view_model/post_editor_view_model.dart';
import 'package:damta/presentation/widget/custom_dialog.dart';
import 'package:damta/presentation/widget/custom_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class PostEditorPage extends HookConsumerWidget {
  const PostEditorPage({super.key, required this.post});

  final PostEntity post;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(postEditorViewModelProvider(post));
    final viewModel = ref.read(postEditorViewModelProvider(post).notifier);

    final isEditMode = post.pId?.isNotEmpty == true;
    final isKeyboardVisible = MediaQuery.of(context).viewInsets.bottom > 0;

    final titleController = useTextEditingController();
    final contentController = useTextEditingController();

    // 디바운서
    final titleDebouncer = useMemoized(
      () => Debouncer(
        duration: const Duration(milliseconds: 300),
        callback: () {
          viewModel.setTitle(titleController.text);
        },
      ),
    );

    final contentDebouncer = useMemoized(
      () => Debouncer(
        duration: const Duration(milliseconds: 200),
        callback: () {
          viewModel.setContent(contentController.text);
        },
      ),
    );

    // 초기 상태값 반영
    useEffect(() {
      titleController.text = state.title;
      contentController.text = state.content;
      return null;
    }, const []);

    // Debouncer의 Timer dispose
    useEffect(() {
      return () {
        titleDebouncer.dispose();
        contentDebouncer.dispose();
      };
    }, const []);

    Future<void> onTapSave() async {
      try {
        final (success, error, updated) = await viewModel.save();
        if (!success) {
          if (error != null && context.mounted) {
            showCustomSnackBar(context: context, message: error);
          }
          return;
        }
        // 저장 성공 후 게시글 목록 갱신
        await ref.read(postViewModelProvider.notifier).getPosts();
        if (context.mounted) {
          context.pop();
        }

        // 📝
        AnalyticsService.event('post_action', p: {'action': 'create'});
      } catch (e) {
        if (context.mounted) {
          // 유즈케이스로부터 필터링 throw 받기
          showCustomSnackBar(
            context: context,
            message: e.toString().replaceAll('Exception: ', ''),
          );
        }
      }
    }

    /// 뒤로가기 시 나가기 여부 확인
    void showExitDialog() {
      // 수정 사항 없으면 바로 나가기 허용
      if (!state.isEdited) {
        context.pop();
        return;
      }

      // 수정 사항 있을 때 경고 다이얼로그
      showCustomDialog(
        context: context,
        title: '작성 중인 내용이 있습니다',
        confirmText: '나가기',
        cancelText: '계속 작성',
        reverseButtons: false,
        onConfirm: () {
          Navigator.of(context).pop();
          context.pop();
        },
      );
    }

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) return;
        showExitDialog();
      },
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: false,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios, size: 20),
            onPressed: showExitDialog,
          ),
          titleSpacing: 0,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                isEditMode ? '글 수정' : '글 쓰기',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Builder(
              builder: (context) {
                return Column(
                  children: [
                    const SizedBox(height: 24),
                    // 제목
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextField(
                          controller: titleController,
                          onChanged: (text) {
                            titleDebouncer.run();
                          },
                          decoration: InputDecoration(
                            hintText: '제목을 입력하세요',
                            hintStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                            border: InputBorder.none,
                            isDense: true,
                            contentPadding: EdgeInsets.zero,
                          ),
                        ),
                        const SizedBox(height: 12),
                        Container(height: 1, color: vrc(context).border),
                      ],
                    ),
                    const SizedBox(height: 20),
                    // 내용 + 글자수
                    Expanded(
                      child: Stack(
                        children: [
                          TextField(
                            controller: contentController,
                            onChanged: (text) {
                              contentDebouncer.run();
                            },
                            maxLines: null,
                            keyboardType: TextInputType.multiline,
                            decoration: const InputDecoration(
                              hintText: '내용을 입력하세요',
                              hintStyle: TextStyle(
                                color: Colors.grey,
                                fontSize: 16,
                              ),
                              border: InputBorder.none,
                              isCollapsed: true,
                            ),
                          ),

                          // 글자수 표시: 텍스트필드의 오른쪽 아래에 고정
                          Positioned(
                            right: 0,
                            bottom: 0,
                            child: AnimatedSwitcher(
                              duration: const Duration(milliseconds: 200),
                              transitionBuilder: (child, animation) {
                                return FadeTransition(
                                  opacity: animation,
                                  child: SizeTransition(
                                    sizeFactor: animation,
                                    axis: Axis.vertical,
                                    child: child,
                                  ),
                                );
                              },
                              child: state.content.isEmpty
                                  ? const SizedBox.shrink(
                                      key: ValueKey('counter-empty'),
                                    )
                                  : Container(
                                      key: const ValueKey('counter-visible'),
                                      margin: const EdgeInsets.only(bottom: 4),
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
                                        borderRadius: BorderRadius.circular(10),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.black.withOpacity(
                                              0.05,
                                            ),
                                            blurRadius: 4,
                                            offset: const Offset(0, 2),
                                          ),
                                        ],
                                      ),
                                      child: Text(
                                        '${state.content.length} / 8,000',
                                        style: const TextStyle(
                                          fontSize: 10,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    // 키보드가 올라와 있을 때 이미지 미리보기 숨김 (overflow 방지)
                    if (!isKeyboardVisible)
                      _PostImagePreview(
                        hasImage: state.hasImage,
                        localImageFile: state.localImageFile,
                        imageUrl: state.imageUrl,
                        onTapRemoveImage: viewModel.removeImage,
                      ),

                    SizedBox(
                      height: (!isKeyboardVisible && state.hasImage) ? 16 : 8,
                    ),

                    // 하단 이미지 + 완료 버튼
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: viewModel.pickImages,
                          child: Row(
                            children: const [
                              SizedBox(width: 6),
                              Icon(
                                Icons.image_outlined,
                                size: 28,
                                color: Color(0xFFBDBDBD),
                              ),
                            ],
                          ),
                        ),
                        ElevatedButton(
                          onPressed: state.canSubmit ? onTapSave : null,
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            backgroundColor: state.canSubmit
                                ? const Color(0xFFE0F2FF)
                                : const Color(0xFFEDEDED),
                            foregroundColor: Colors.black87,
                            shape: const StadiumBorder(),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 40,
                              vertical: 12,
                            ),
                          ),
                          child: const Text(
                            '완료',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

class _PostImagePreview extends StatelessWidget {
  /// 게시글 이미지 미리보기
  const _PostImagePreview({
    required this.hasImage,
    required this.localImageFile,
    required this.imageUrl,
    required this.onTapRemoveImage,
  });

  final bool hasImage;
  final File? localImageFile;
  final String? imageUrl;
  final VoidCallback onTapRemoveImage;

  @override
  Widget build(BuildContext context) {
    if (!hasImage) {
      return const SizedBox.shrink();
    }

    // 이미지가 있을 때 썸네일 + 삭제 버튼
    Widget imageWidget;
    if (localImageFile != null) {
      imageWidget = ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Image.file(
          localImageFile!,
          width: double.infinity,
          height: 180,
          fit: BoxFit.cover,
        ),
      );
    } else if (imageUrl != null && imageUrl!.isNotEmpty) {
      imageWidget = ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Image.network(
          imageUrl!,
          width: double.infinity,
          height: 180,
          fit: BoxFit.cover,
        ),
      );
    } else {
      imageWidget = Container(
        width: double.infinity,
        height: 140,
        decoration: BoxDecoration(
          color: const Color(0xFFF7F7F7),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: const Color(0xFFE0E0E0)),
        ),
      );
    }
    return Stack(
      children: [
        imageWidget,
        Positioned(
          top: 8,
          right: 8,
          child: InkWell(
            onTap: onTapRemoveImage,
            child: Container(
              width: 28,
              height: 28,
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.55),
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.close, size: 16, color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}

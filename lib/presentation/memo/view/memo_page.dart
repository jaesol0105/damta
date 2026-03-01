import 'package:damta/core/theme/app_theme.dart';
import 'package:damta/core/util/debouncer.dart';
import 'package:damta/presentation/memo/view_model/memo_view_model.dart';
import 'package:damta/presentation/util/custom_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MemoPage extends HookConsumerWidget {
  const MemoPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final memoAsync = ref.watch(memoViewModelProvider);
    final viewModel = ref.read(memoViewModelProvider.notifier);

    final contentController = useTextEditingController();
    final isEdited = useState(false);
    final initialized = useState(false);

    // 저장된 메모 불러와서 텍스트필드에 반영
    useEffect(() {
      if (!initialized.value) {
        memoAsync.whenData((content) {
          contentController.text = content;
          initialized.value = true;
        });
      }
      return null;
    }, [memoAsync]);

    // 디바운싱 적용
    final debouncer = useMemoized(
      () => Debouncer(
        duration: const Duration(milliseconds: 600),
        callback: () => viewModel.save(contentController.text),
      ),
    );
    useEffect(() => debouncer.dispose, const []);

    void showExitDialog() {
      if (!isEdited.value) {
        context.pop();
        return;
      }
      showCustomDialog(
        context: context,
        title: '저장하지 않고 나가시겠어요?',
        confirmText: '나가기',
        cancelText: '계속 작성',
        reverseButtons: false,
        onConfirm: () {
          Navigator.of(context).pop();
          context.pop();
        },
      );
    }

    Future<void> onSave() async {
      await viewModel.save(contentController.text);
      isEdited.value = false;
      if (context.mounted) context.pop();
    }

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, _) {
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
          title: const Text(
            '메모',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
          actions: [
            TextButton(
              onPressed: isEdited.value ? onSave : null,
              child: Text(
                '저장',
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 15,
                  color: isEdited.value
                      ? vrc(context).labelText
                      : Colors.grey.withOpacity(0.5),
                ),
              ),
            ),
            const SizedBox(width: 8),
          ],
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                const SizedBox(height: 16),
                Expanded(
                  child: Stack(
                    children: [
                      TextField(
                        controller: contentController,
                        onChanged: (text) {
                          isEdited.value = true;
                          debouncer.run();
                        },
                        maxLines: null,
                        expands: true,
                        keyboardType: TextInputType.multiline,
                        textAlignVertical: TextAlignVertical.top,
                        decoration: const InputDecoration(
                          hintText: '내용을 입력하세요',
                          hintStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 16,
                          ),
                          border: InputBorder.none,
                          isCollapsed: true,
                          contentPadding: EdgeInsets.zero,
                        ),
                      ),
                      // 글자수 표시
                      Positioned(
                        right: 0,
                        bottom: 0,
                        child: AnimatedSwitcher(
                          duration: const Duration(milliseconds: 200),
                          transitionBuilder: (child, animation) =>
                              FadeTransition(
                                opacity: animation,
                                child: SizeTransition(
                                  sizeFactor: animation,
                                  axis: Axis.vertical,
                                  child: child,
                                ),
                              ),
                          child: contentController.text.isEmpty
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
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.05),
                                        blurRadius: 4,
                                        offset: const Offset(0, 2),
                                      ),
                                    ],
                                  ),
                                  child: Text(
                                    '${contentController.text.length}자',
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
                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:damta/presentation/home/view/widgets/edit_animated_card.dart';
import 'package:damta/presentation/home/view/widgets/home_app_bar.dart';
import 'package:damta/presentation/home/view/module_builder.dart';
import 'package:damta/presentation/home/view/widgets/home_drawer.dart';
import 'package:damta/presentation/home/view_model/home_view_model.dart';
import 'package:damta/presentation/home/view_model/module_item.dart';
import 'package:damta/presentation/ui_provider/users_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:reorderables/reorderables.dart';

class HomePage extends HookConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final schoolName = ref
        .watch(userProvider)
        .when(
          data: (user) => user.schoolName,
          loading: () => '로딩 중...',
          error: (_, __) => '학교 미지정',
        );

    final modules = ref.watch(homeViewModelProvider);
    final notifier = ref.read(homeViewModelProvider.notifier);

    final isEditMode = useState(false);
    final scrollController = useScrollController();

    void enterEditMode() {
      if (!isEditMode.value) isEditMode.value = true;
    }

    void exitEditMode() {
      isEditMode.value = false;
      notifier.save();
    }

    final currentVisible = modules.where((m) => m.visible).toList()
      ..sort((a, b) => a.order.compareTo(b.order));

    return PopScope(
      canPop: !isEditMode.value,
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) return;
        if (isEditMode.value) exitEditMode();
      },
      child: Scaffold(
        endDrawer: HomeDrawer(),
        body: SafeArea(
          child: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onLongPress: isEditMode.value ? null : enterEditMode,
            child: CustomScrollView(
              controller: scrollController,
              slivers: [
                // 상단바
                // 아래로 스크롤 시 숨김, 위로 스크롤 시 복구
                SliverAppBar(
                  floating: true,
                  snap: true,
                  automaticallyImplyLeading: false,
                  elevation: 0,
                  titleSpacing: 20,
                  centerTitle: false,
                  surfaceTintColor: Colors.transparent,
                  title: HomeAppBar.buildTitle(
                    context: context,
                    isEditMode: isEditMode.value,
                    schoolName: schoolName!,
                  ),
                  actions: HomeAppBar.buildActions(
                    context: context,
                    isEditMode: isEditMode.value,
                    onAddPhoto: notifier.addPhoto,
                    onExitEdit: exitEditMode,
                    onSettings: () {},
                  ),
                ),

                // 홈 화면 모듈들
                SliverPadding(
                  padding: const EdgeInsets.fromLTRB(16, 4, 16, 24),
                  sliver: SliverToBoxAdapter(
                    child: LayoutBuilder(
                      builder: (context, constraints) {
                        const gap = 16.0;
                        final maxWidth = constraints.maxWidth;
                        final halfWidth = (maxWidth - gap) / 2;
                        final miniHeight = halfWidth * 6 / 5;

                        Widget buildSized(ModuleItem module) {
                          final itemWidth = module.width == ModuleWidth.full
                              ? maxWidth
                              : halfWidth;

                          return SizedBox(
                            key: ValueKey(module.id),
                            width: itemWidth,
                            height:
                                (module.type == ModuleType.weather ||
                                    module.type == ModuleType.anonBoard)
                                ? null
                                : miniHeight,
                            child: EditAnimatedCard(
                              isEditMode: isEditMode.value,
                              phaseSeed: module.id.hashCode,
                              elevation: isEditMode.value ? 2.5 : 0.0,
                              referenceWidth: halfWidth,
                              itemWidth: itemWidth,
                              child: ModuleBuilder.buildModule(
                                module: module,
                                isEditMode: isEditMode.value,
                                onDelete: () => notifier.removeById(module.id),
                              ),
                            ),
                          );
                        }

                        // 일반 모드
                        if (!isEditMode.value) {
                          return Wrap(
                            spacing: gap,
                            runSpacing: gap,
                            children: [
                              for (final m in currentVisible) buildSized(m),
                            ],
                          );
                        }

                        // 편집 모드
                        return ReorderableWrap(
                          ignorePrimaryScrollController: true,
                          spacing: gap,
                          runSpacing: gap,
                          onReorder: notifier.reorder,
                          children: [
                            for (final m in currentVisible)
                              ReorderableWidget(
                                key: ValueKey(m.id),
                                reorderable: true,
                                child: buildSized(m),
                              ),
                          ],
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

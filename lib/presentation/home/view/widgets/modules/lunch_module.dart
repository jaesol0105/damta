import 'package:damta/core/theme/app_colors.dart';
import 'package:damta/core/theme/app_theme.dart';
import 'package:damta/domain/enum/meal_type_enum.dart';
import 'package:damta/presentation/home/view/widgets/modules/shared/mini_card.dart';
import 'package:damta/presentation/home/view/widgets/modules/shared/more_button.dart';
import 'package:damta/presentation/ui_provider/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class MealModule extends ConsumerWidget {
  /// 급식 모듈
  const MealModule({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mealAsync = ref.watch(mealForCurrentUserProvider);

    return mealAsync.when(
      loading: () =>
          _buildCard(context, child: const _LunchText(items: ['로딩 중...'])),
      error: (_, __) =>
          _buildCard(context, child: const _LunchText(items: ['불러오기 실패'])),
      data: (state) {
        final (meal, type) = state.currentMeal;

        if (meal == null || meal.dishes.isEmpty) {
          return _buildCard(
            context,
            child: Text(
              '오늘 급식 정보가 없습니다',
              style: TextStyle(
                fontSize: 12.5,
                fontWeight: FontWeight.w500,
                color: vrc(context).detailText,
              ),
            ),
          );
        }

        return _buildCard(
          context,
          bottomLabel: type?.label,
          child: _LunchText(items: meal.dishes),
        );
      },
    );
  }

  Widget _buildCard(
    BuildContext context, {
    required Widget child,
    String? bottomLabel,
  }) {
    return Builder(
      builder: (ctx) => MiniCard(
        icon: 'assets/icons/icon_meal.png',
        bottomLabelColor: AppColors.moduleLunchCard,
        title: '  급식',
        trailing: MoreButton(onTap: () => ctx.push('/meal')),
        bottomLabel: bottomLabel,
        child: child,
      ),
    );
  }
}

class _LunchText extends StatelessWidget {
  const _LunchText({required this.items});

  final List<String> items;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 4),
      child: Text(
        items.join('\n'),
        style: TextStyle(
          height: 1.25,
          fontSize: 12.5,
          fontWeight: FontWeight.w500,
          color: vrc(context).labelText,
        ),
      ),
    );
  }
}

import 'package:damta/domain/enums/meal_type_enum.dart';
import 'package:damta/presentation/view/pages/meal/widgets/date_selector.dart';
import 'package:damta/presentation/view/pages/meal/widgets/meal_card.dart';
import 'package:damta/presentation/view/pages/meal/widgets/meal_shimmer.dart';
import 'package:damta/presentation/view_model/meal_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class MealPage extends ConsumerWidget {
  const MealPage({super.key});

  final officeCode = 'J10';
  final schoolCode = '7642041';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mealState = ref.watch(
      mealViewModelProvider(officeCode: officeCode, schoolCode: schoolCode),
    );

    return Scaffold(
      backgroundColor: Colors.white, // 나중에 Theme으로 위임
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        // 백 버튼
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => context.pop(),
        ),
      ),

      body: mealState.when(
        data: (state) => _mealContent(context, ref, state),
        loading: () => const MealShimmer(),
        error: (error, stack) => _mealError(context, ref, error),
      ),
    );
  }

  /// 바디 내용
  Widget _mealContent(BuildContext context, WidgetRef ref, MealState state) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Text('오늘의 급식', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600)),
        ),
        const SizedBox(height: 18),
        if (!state.hasAnyMeal)
          Expanded(
            child: const Center(
              child: Text(
                '이번 달은 등록된 급식 정보가 없어요',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            ),
          )
        else ...[
          DateSelector(
            selectedDate: state.selectedDate, // 선택된 날짜
            mealDates: state.mealDates, // 셀렉터에 표시할 날짜
            onDateSelected: (date) {
              ref
                  .read(
                    mealViewModelProvider(officeCode: officeCode, schoolCode: schoolCode).notifier,
                  )
                  .selectDate(date);
            },
          ),
          const SizedBox(height: 40),
          Expanded(child: _mealList(state)),
        ],
      ],
    );
  }

  /// 일일 급식 메뉴 리스트 (+ 이모지 설정)
  Widget _mealList(MealState state) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      children: [
        _mealCard(state, MealType.breakfast, '조식', '🍙'),
        _mealCard(state, MealType.lunch, '중식', '🍱'),
        _mealCard(state, MealType.dinner, '석식', '🌙'),
      ],
    );
  }

  /// 급식 메뉴 위젯, 아침/점심/저녁 단위
  Widget _mealCard(MealState state, MealType type, String title, String emoji) {
    final meal = state.getMealByType(type);
    if (meal == null) {
      return const SizedBox.shrink(); // 해당 시간대에 급식이 없으면 표시하지 않음
    }
    return Column(
      children: [
        MealCard(title: title, emoji: emoji, dishes: meal.dishes, kcal: meal.kcal),
        const SizedBox(height: 20),
      ],
    );
  }

  /// 네트워크 오류 표시 위젯
  Widget _mealError(BuildContext context, WidgetRef ref, Object error) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.error_outline, size: 64, color: Colors.red),
          const SizedBox(height: 16),
          Text('네트워크 오류가 발생했습니다', style: TextStyle(fontSize: 16, color: Colors.grey[700])),
          const SizedBox(height: 8),
          Text(
            error.toString(),
            style: TextStyle(fontSize: 12, color: Colors.grey[500]),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          // 재시도 버튼
          IconButton(
            onPressed: () {
              ref
                  .read(
                    mealViewModelProvider(officeCode: officeCode, schoolCode: schoolCode).notifier,
                  )
                  .reload();
            },
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
    );
  }
}

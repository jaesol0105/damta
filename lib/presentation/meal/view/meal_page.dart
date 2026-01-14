import 'package:damta/core/theme/app_theme.dart';
import 'package:damta/domain/enum/meal_type_enum.dart';
import 'package:damta/presentation/meal/view/widgets/date_selector.dart';
import 'package:damta/presentation/meal/view/widgets/meal_card.dart';
import 'package:damta/presentation/meal/view/widgets/meal_shimmer.dart';
import 'package:damta/presentation/meal/%20view_model/meal_view_model.dart';
import 'package:damta/presentation/ui_provider/users_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class MealPage extends ConsumerWidget {
  const MealPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // user 불러오기
    final userAsync = ref.watch(userProvider);

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
      ),
      body: userAsync.when(
        loading: () => const MealShimmer(),
        error: (e, _) => Center(child: Text(e.toString())),
        data: (user) {
          // user 에 저장된 officeCode, schoolCode 가져오기
          final officeCode = user.officeCode;
          final schoolCode = user.schoolCode;
          print('🩷 급식표 : $officeCode, $schoolCode, ${user.schoolName}');

          final mealState = ref.watch(
            mealViewModelProvider(
              officeCode: officeCode,
              schoolCode: schoolCode,
            ),
          );

          return mealState.when(
            loading: () => const MealShimmer(),
            error: (e, _) =>
                _mealError(context, ref, e, officeCode, schoolCode),
            data: (state) =>
                _mealContent(context, ref, state, officeCode, schoolCode),
          );
        },
      ),
    );
  }
}

/// 바디 내용
Widget _mealContent(
  BuildContext context,
  WidgetRef ref,
  MealState state,
  String officeCode,
  String schoolCode,
) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      const Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Text(
          '오늘의 급식',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
        ),
      ),
      const SizedBox(height: 18),
      if (!state.hasAnyMeal)
        Expanded(
          child: Center(
            child: Text(
              '이번 달은 등록된 급식 정보가 없어요',
              style: TextStyle(fontSize: 16, color: vrc(context).detailText),
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
                  mealViewModelProvider(
                    officeCode: officeCode,
                    schoolCode: schoolCode,
                  ).notifier,
                )
                .selectDate(date);
          },
        ),
        const SizedBox(height: 30),
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
      MealCard(
        title: title,
        emoji: emoji,
        dishes: meal.dishes,
        kcal: meal.kcal,
      ),
      const SizedBox(height: 20),
    ],
  );
}

/// 네트워크 오류 표시 위젯
Widget _mealError(
  BuildContext context,
  WidgetRef ref,
  Object error,
  String officeCode,
  String schoolCode,
) {
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.error_outline, size: 48, color: vrc(context).errorText),
        const SizedBox(height: 16),
        Text(
          '급식정보를 불러오는데 실패했습니다',
          style: TextStyle(fontSize: 16, color: vrc(context).errorText),
        ),
        const SizedBox(height: 16),
        ElevatedButton(
          onPressed: () {
            ref
                .read(
                  mealViewModelProvider(
                    officeCode: officeCode,
                    schoolCode: schoolCode,
                  ).notifier,
                )
                .reload();
          },
          style: ElevatedButton.styleFrom(
            elevation: 0,
            backgroundColor: fxc(context).brandColor,
            foregroundColor: Colors.white,
          ),
          child: const Text('다시 시도'),
        ),
      ],
    ),
  );
}

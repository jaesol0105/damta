import 'package:damta/core/di/provider.dart';
import 'package:damta/domain/enum/meal_type_enum.dart';
import 'package:damta/domain/entity/meal_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'meal_view_model.freezed.dart';
part 'meal_view_model.g.dart';

@freezed
abstract class MealState with _$MealState {
  const MealState._(); // getter 사용하려면 필요

  const factory MealState({
    required DateTime selectedDate,
    required List<MealEntity> allMeals,
  }) = _MealState;

  /// 선택된 날짜의 급식 목록만 필터링
  List<MealEntity> get mealsForSelectedDate {
    return allMeals.where((meal) {
      final d = selectedDate;
      return meal.date.year == d.year &&
          meal.date.month == d.month &&
          meal.date.day == d.day;
    }).toList();
  }

  /// 선택된 날짜의 시간대별 (아침/점심/저녁) 급식메뉴 가져오기
  MealEntity? getMealByType(MealType type) {
    try {
      return mealsForSelectedDate.firstWhere((meal) => meal.type == type);
    } catch (_) {
      return null;
    }
  }

  /// 현재 시간 기준으로 홈 화면에 표시할 식사와 식사 타입을 반환. 홈 화면 모듈용.
  (MealEntity?, MealType?) get currentMeal {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final minute = now.hour * 60 + now.minute;

    // 오늘 날짜 기준으로 필터링
    final todayMeals = allMeals
        .where(
          (m) =>
              m.date.year == today.year &&
              m.date.month == today.month &&
              m.date.day == today.day,
        )
        .toList();

    // 시간에 따라 출력할 식사 타입을 필터링
    final List<MealType> priority;
    if (minute < 9 * 60 + 30) {
      priority = [MealType.breakfast, MealType.lunch, MealType.dinner];
    } else if (minute < 14 * 60) {
      priority = [MealType.lunch, MealType.dinner, MealType.breakfast];
    } else {
      priority = [MealType.dinner, MealType.lunch, MealType.breakfast];
    }
    for (final type in priority) {
      try {
        final meal = todayMeals.firstWhere((m) => m.type == type);
        if (meal.dishes.isNotEmpty) return (meal, type);
      } catch (_) {}
    }
    // 오늘 급식 데이터가 없을 경우
    return (null, null);
  }

  /// 해당 날짜에 급식이 있는지 여부
  bool get hasAnyMeal => mealsForSelectedDate.isNotEmpty;

  /// 급식이 있는 날짜들의 '년/월/일' 집합
  List<DateTime> get mealDates {
    return allMeals
        .map((meal) => DateTime(meal.date.year, meal.date.month, meal.date.day))
        .toList();
  }
}

@riverpod
class MealViewModel extends _$MealViewModel {
  @override
  Future<MealState> build({
    required String officeCode,
    required String schoolCode,
  }) async {
    return _fetchMeals(officeCode, schoolCode);
  }

  // 급식 정보 가져오기
  Future<MealState> _fetchMeals(String officeCode, String schoolCode) async {
    final repo = await ref.read(mealRepositoryProvider.future);

    final today = DateTime.now();
    final endDate = today.add(const Duration(days: 31));

    final meals = await repo.getMeals(
      officeCode: officeCode,
      schoolCode: schoolCode,
      fromDate: today,
      toDate: endDate,
    );

    DateTime selected = DateTime(today.year, today.month, today.day);

    // 오늘 급식 있는지 확인
    final hasTodayMeal = meals.any(
      (m) =>
          m.date.year == selected.year &&
          m.date.month == selected.month &&
          m.date.day == selected.day,
    );

    // 오늘 급식 없을 경우, 가장 가까운 미래 급식 날짜 선택
    if (!hasTodayMeal && meals.isNotEmpty) {
      final future = meals.firstWhere(
        (m) => !m.date.isBefore(selected),
        orElse: () => meals.first,
      );
      selected = DateTime(future.date.year, future.date.month, future.date.day);
    }

    return MealState(selectedDate: selected, allMeals: meals);
  }

  /// 급식 정보 리로드
  Future<void> reload() async {
    // 바로 로딩 상태로 만들어서 Shimmer 보이도록
    state = const AsyncValue.loading();
    // 실패하면 AsyncError, 성공하면 AsyncData로 자동 전환
    state = await AsyncValue.guard(() => _fetchMeals(officeCode, schoolCode));
  }

  // 날짜 선택
  void selectDate(DateTime date) {
    final current = state.value;
    if (current == null) return;
    state = AsyncValue.data(current.copyWith(selectedDate: date));
  }
}

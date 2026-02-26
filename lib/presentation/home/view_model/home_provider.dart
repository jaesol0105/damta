import 'package:damta/presentation/meal/view_model/meal_view_model.dart';
import 'package:damta/presentation/schedule/view_model/schedule_view_model.dart';
import 'package:damta/presentation/time_table/view_model/time_table_view_model.dart';
import 'package:damta/presentation/ui_provider/users_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_provider.g.dart';

/// 현재 사용자의 학사일정 Provider.
@riverpod
Future<ScheduleState> scheduleForCurrentUser(Ref ref) async {
  final user = await ref.watch(userProvider.future);
  return ref.watch(
    scheduleViewModelProvider(
      officeCode: user.officeCode!,
      schoolCode: user.schoolCode!,
    ).future,
  );
}

/// 현재 사용자의 급식 Provider.
@riverpod
Future<MealState> mealForCurrentUser(Ref ref) async {
  final user = await ref.watch(userProvider.future);
  return ref.watch(
    mealViewModelProvider(
      officeCode: user.officeCode!,
      schoolCode: user.schoolCode!,
    ).future,
  );
}

/// 현재 사용자의 시간표 Provider.
@riverpod
Future<TimeTableState> timetableForCurrentUser(Ref ref) async {
  final user = await ref.watch(userProvider.future);
  return ref.watch(
    timeTableViewModelProvider(
      officeCode: user.officeCode!,
      schoolCode: user.schoolCode!,
    ).future,
  );
}

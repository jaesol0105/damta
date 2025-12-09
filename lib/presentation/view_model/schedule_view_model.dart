import 'package:damta/core/di/provider.dart';
import 'package:damta/domain/entity/schedule_entity.dart';
import 'package:damta/presentation/core/util/schedule_filter_util.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'schedule_view_model.freezed.dart';
part 'schedule_view_model.g.dart';

@freezed
abstract class ScheduleState with _$ScheduleState {
  const ScheduleState._(); // getter 사용하려면 필요

  const factory ScheduleState({
    required int selectedMonth,
    required int selectedYear,
    required List<ScheduleEntity> allSchedules,
  }) = _ScheduleState;

  /// 선택된 월의 학사일정만 필터링
  List<ScheduleEntity> get schedulesForSelectedMonth {
    return allSchedules
        .where(
          (schedule) => schedule.date.year == selectedYear && schedule.date.month == selectedMonth,
        )
        .toList();
  }

  /// 선택된 월의 학사일정을 날짜별로 그룹핑 (주말 제외, 7일 이상 반복 일정 제외)
  Map<DateTime, List<ScheduleEntity>> get groupedSchedulesByDateExcludingWeekends {
    return ScheduleFilterUtil.groupSchedulesExcludingWeekendsAndRepeated(
      schedulesForSelectedMonth,
      allSchedulesForRepeatedDetection: allSchedules, // 전체 연도 기준으로 필터링
      minRepeatedDays: 7,
    );
  }

  /// 해당 월에 학사일정이 있는지 여부
  bool hasScheduleForMonth(int year, int month) {
    return allSchedules.any(
      (schedule) => schedule.date.year == year && schedule.date.month == month,
    );
  }

  /// MonthSelector에 표시할 목록
  /// 현재년도 1 ~ 12월
  List<DateTime> get displayableMonths {
    final now = DateTime.now();
    final months = <DateTime>[];
    for (int i = 1; i <= 12; i++) {
      final month = DateTime(now.year, i);
      months.add(month);
    }
    return months;
  }
}

@riverpod
class ScheduleViewModel extends _$ScheduleViewModel {
  @override
  Future<ScheduleState> build({required String officeCode, required String schoolCode}) async {
    return _fetchSchedules(officeCode, schoolCode);
  }

  /// 학사일정 가져오기
  Future<ScheduleState> _fetchSchedules(String officeCode, String schoolCode) async {
    final repo = await ref.read(scheduleRepositoryProvider.future);

    // 올해 1월 1일부터 12월 31일까지
    final now = DateTime.now();
    final fromDate = DateTime(now.year, 1, 1);
    final toDate = DateTime(now.year, 12, 31, 23, 59, 59);

    final schedules = await repo.getSchedules(
      officeCode: officeCode,
      schoolCode: schoolCode,
      fromDate: fromDate,
      toDate: toDate,
    );

    return ScheduleState(selectedMonth: now.month, selectedYear: now.year, allSchedules: schedules);
  }

  /// 학사일정 정보 리로드
  Future<void> reload() async {
    // 바로 로딩 상태로 만들어서 Shimmer 보이도록
    state = const AsyncValue.loading();
    // 실패하면 AsyncError, 성공하면 AsyncData로 자동 전환
    state = await AsyncValue.guard(() => _fetchSchedules(officeCode, schoolCode));
  }

  /// 월 선택
  void selectMonth(int year, int month) {
    final current = state.value;
    if (current == null) return;
    state = AsyncData(current.copyWith(selectedYear: year, selectedMonth: month));
  }
}

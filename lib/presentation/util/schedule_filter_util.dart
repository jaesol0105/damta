import 'package:damta/domain/entity/schedule_entity.dart';

/// 학사일정 필터링 유틸.
/// 방학처럼 주말을 포함해서 7일 이상 연속되는 일정을 필터링.
/// 시험기간처럼 주중에만 있는 일정은 끊겨서 필터링 되지않음.
/// 30일 동안 방학일정 다 출력되는게 너무 지저분해서 정리.
class ScheduleFilterUtil {
  /// minDays일 이상 반복되는 일정 집합 반환
  static Set<String> findRepeatedSchedule(List<ScheduleEntity> schedules, {int minDays = 7}) {
    // Set을 써서 학사일정명 별로 날짜 그룹핑
    final Map<String, List<DateTime>> eventDates = {};
    for (final schedule in schedules) {
      // 키가 없을경우 '키-값'을 넣어주는 문법, 그 뒤에 add
      eventDates.putIfAbsent(schedule.eventName, () => []).add(schedule.date);
    }

    // 각 일정이 연속적인지 확인
    final repeated = <String>{};
    for (final entry in eventDates.entries) {
      final dates = entry.value..sort();
      // 최소 일수 미만이면 스킵
      if (dates.length < minDays) continue;

      // 연속성 체크 (하루 간격으로 이어지는지 확인)
      int consecutiveDays = 1;
      for (int i = 1; i < dates.length; i++) {
        if (dates[i].difference(dates[i - 1]).inDays == 1) {
          consecutiveDays++;
          if (consecutiveDays >= minDays) {
            repeated.add(entry.key);
            break; // 이미 반복으로 추가했으니까 종료
          }
        } else {
          consecutiveDays = 1; // 연속성 끊기면 리셋
        }
      }
    }
    return repeated;
  }

  /// 학사일정을 필터링 (주말 제외, 7일 이상 반복 일정 제외)
  static Map<DateTime, List<ScheduleEntity>> groupSchedulesExcludingWeekendsAndRepeated(
    List<ScheduleEntity> schedules, {
    List<ScheduleEntity>? allSchedulesForRepeatedDetection,
    int minRepeatedDays = 7,
  }) {
    // 7일 이상 반복되는 이벤트 찾기 (필터링은 전체 데이터 기준으로)
    final schedulesForDetection = allSchedulesForRepeatedDetection ?? schedules;
    final repeatedEvents = findRepeatedSchedule(schedulesForDetection, minDays: minRepeatedDays);

    // 필터링 및 그룹핑
    // 월별 데이터 출력용 : 필터링은 schedules(월별)에만 적용
    final Map<DateTime, List<ScheduleEntity>> grouped = {};
    for (final schedule in schedules) {
      // 반복 이벤트 제외
      if (repeatedEvents.contains(schedule.eventName)) {
        continue;
      }
      final date = DateTime(schedule.date.year, schedule.date.month, schedule.date.day);
      // 주말 제외
      if (date.weekday == DateTime.saturday || date.weekday == DateTime.sunday) {
        continue;
      }
      grouped.putIfAbsent(date, () => []).add(schedule);
    }

    // 날짜 순으로 정렬
    final sortedKeys = grouped.keys.toList()..sort();
    final Map<DateTime, List<ScheduleEntity>> sortedGrouped = {};
    for (final key in sortedKeys) {
      sortedGrouped[key] = grouped[key]!;
    }

    return sortedGrouped; // 날짜를 key로 하는 일정 목록 Map 반환
  }
}

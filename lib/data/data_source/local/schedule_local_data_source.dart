import 'package:damta/domain/entity/schedule_entity.dart';

abstract class ScheduleLocalDataSource {
  /// 로컬 캐시에서 학사일정 정보 가져오기
  Future<List<ScheduleEntity>> getSchedules({
    required String schoolCode,
    required DateTime fromDate,
    required DateTime toDate,
  });

  /// 학사일정 정보 로컬 캐시에 저장
  Future<void> saveSchedules({required String schoolCode, required List<ScheduleEntity> schedules});
}

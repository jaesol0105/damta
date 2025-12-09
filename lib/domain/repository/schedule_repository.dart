import 'package:damta/domain/entity/schedule_entity.dart';

abstract class ScheduleRepository {
  Future<List<ScheduleEntity>> getSchedules({
    required String officeCode,
    required String schoolCode,
    required DateTime fromDate,
    required DateTime toDate,
  });
}

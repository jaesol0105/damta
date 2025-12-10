import 'package:damta/domain/entity/time_table_entity.dart';

abstract interface class TimeTableRepository {
  Future<List<TimeTableEntity>> getTimeTables({
    required String officeCode,
    required String schoolCode,
    required DateTime fromDate,
    required DateTime toDate,
    required int grade,
    required int classes,
  });
}

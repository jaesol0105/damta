import 'package:damta/domain/entity/time_table_entity.dart';

abstract interface class TimeTableLocalDataSource {
  Future<List<TimeTableEntity>> getTimeTables({
    required String schoolCode,
    required DateTime fromDate,
    required DateTime toDate,
    required String grade,
    required String classes,
  });

  Future<void> saveTimeTables({
    required String schoolCode,
    required List<TimeTableEntity> tables,
  });
}

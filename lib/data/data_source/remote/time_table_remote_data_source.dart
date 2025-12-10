import 'package:damta/data/dto/neis_time_table_dto.dart';

abstract interface class TimeTableRemoteDataSource {
  Future<List<NeisTimeTableDto>> getTimeTables({
    required String officeCode,
    required String schoolCode,
    required DateTime fromDate,
    required DateTime toDate,
    required String grade,
    required String classes,
  });
}

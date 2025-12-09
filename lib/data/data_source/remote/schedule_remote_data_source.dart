import 'package:damta/data/dto/neis_schedule_dto.dart';

abstract class ScheduleRemoteDataSource {
  Future<List<NeisScheduleDTO>> getSchedules({
    required String officeCode,
    required String schoolCode,
    required DateTime fromDate,
    required DateTime toDate,
  });
}

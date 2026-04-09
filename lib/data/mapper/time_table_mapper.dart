import 'package:damta/data/dto/neis_time_table_dto.dart';
import 'package:damta/domain/entity/time_table_entity.dart';

class TimeTableMapper {
  static List<TimeTableEntity> toDomainList(List<NeisTimeTableDto> dtoList) {
    return dtoList.map((dto) => toDomain(dto)).toList();
  }

  static TimeTableEntity toDomain(NeisTimeTableDto dto) {
    // 날짜 파싱 (yyyyMMdd -> DateTime)
    final year = int.parse(dto.date.substring(0, 4));
    final month = int.parse(dto.date.substring(4, 6));
    final day = int.parse(dto.date.substring(6, 8));
    final date = DateTime(year, month, day);

    return TimeTableEntity(
      date: date,
      grade: int.parse(dto.grade),
      classes: int.parse(dto.classes),
      period: int.parse(dto.period),
      subject: dto.subject,
    );
  }
}

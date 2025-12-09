import 'package:damta/data/dto/neis_schedule_dto.dart';
import 'package:damta/domain/entity/schedule_entity.dart';

class ScheduleMapper {
  static List<ScheduleEntity> toDomainList(List<NeisScheduleDTO> dtoList) {
    return dtoList.map((dto) => toDomain(dto)).toList();
  }

  static ScheduleEntity toDomain(NeisScheduleDTO dto) {
    // 날짜 파싱 (yyyyMMdd -> DateTime)
    final dateStr = dto.eventDate;
    final date = DateTime.parse(
      '${dateStr.substring(0, 4)}-${dateStr.substring(4, 6)}-${dateStr.substring(6, 8)}',
    );

    // 이벤트명 trim
    final eventName = dto.eventName.trim();

    // 학년 정보 변환
    final grades = <int>[];
    if (dto.oneGradeEventYn == 'Y') grades.add(1);
    if (dto.twGradeEventYn == 'Y') grades.add(2);
    if (dto.threeGradeEventYn == 'Y') grades.add(3);
    if (dto.frGradeEventYn == 'Y') grades.add(4);
    if (dto.fivGradeEventYn == 'Y') grades.add(5);
    if (dto.sixGradeEventYn == 'Y') grades.add(6);

    return ScheduleEntity(date: date, eventName: eventName, grades: grades);
  }
}

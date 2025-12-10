import 'package:freezed_annotation/freezed_annotation.dart';

part 'time_table_entity.freezed.dart';

@freezed
abstract class TimeTableEntity with _$TimeTableEntity {
  const factory TimeTableEntity({
    required DateTime date, // 시간표일자
    required int grade, // 학년
    required int classes, // 학급명(반)
    required int period, // 교시
    required String subject, // 수업내용
  }) = _TimeTableEntity;
}

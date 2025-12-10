import 'package:freezed_annotation/freezed_annotation.dart';

part 'neis_time_table_dto.freezed.dart';
part 'neis_time_table_dto.g.dart';

@freezed
abstract class NeisTimeTableDto with _$NeisTimeTableDto {
  const factory NeisTimeTableDto({
    @JsonKey(name: 'ALL_TI_YMD') required String date, // 시간표일자
    @JsonKey(name: 'GRADE') required String grade, // 학년
    @JsonKey(name: 'CLASS_NM') required String classes, // 학급명(반)
    @JsonKey(name: 'PERIO') required String period, // 교시
    @JsonKey(name: 'ITRT_CNTNT') required String subject, // 수업내용
  }) = _NeisTimeTableDto;

  factory NeisTimeTableDto.fromJson(Map<String, dynamic> json) =>
      _$NeisTimeTableDtoFromJson(json);
}

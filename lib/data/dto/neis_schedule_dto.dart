import 'package:freezed_annotation/freezed_annotation.dart';

part 'neis_schedule_dto.freezed.dart';
part 'neis_schedule_dto.g.dart';

@freezed
abstract class NeisScheduleDTO with _$NeisScheduleDTO {
  const factory NeisScheduleDTO({
    @JsonKey(name: 'AA_YMD') required String eventDate, // 날짜 "20251207" 형태
    @JsonKey(name: 'EVENT_NM') required String eventName, // 일정명
    @JsonKey(name: 'ONE_GRADE_EVENT_YN') String? oneGradeEventYn, // 1학년 (Y/N)
    @JsonKey(name: 'TW_GRADE_EVENT_YN') String? twGradeEventYn, // 2학년
    @JsonKey(name: 'THREE_GRADE_EVENT_YN') String? threeGradeEventYn, // 3학년
    @JsonKey(name: 'FR_GRADE_EVENT_YN') String? frGradeEventYn, // 4학년
    @JsonKey(name: 'FIV_GRADE_EVENT_YN') String? fivGradeEventYn, // 5학년
    @JsonKey(name: 'SIX_GRADE_EVENT_YN') String? sixGradeEventYn, // 6학년
  }) = _NeisScheduleDTO;

  factory NeisScheduleDTO.fromJson(Map<String, dynamic> json) => _$NeisScheduleDTOFromJson(json);
}

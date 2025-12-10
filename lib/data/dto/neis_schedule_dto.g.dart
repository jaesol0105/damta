// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'neis_schedule_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_NeisScheduleDTO _$NeisScheduleDTOFromJson(Map<String, dynamic> json) =>
    _NeisScheduleDTO(
      eventDate: json['AA_YMD'] as String,
      eventName: json['EVENT_NM'] as String,
      oneGradeEventYn: json['ONE_GRADE_EVENT_YN'] as String?,
      twGradeEventYn: json['TW_GRADE_EVENT_YN'] as String?,
      threeGradeEventYn: json['THREE_GRADE_EVENT_YN'] as String?,
      frGradeEventYn: json['FR_GRADE_EVENT_YN'] as String?,
      fivGradeEventYn: json['FIV_GRADE_EVENT_YN'] as String?,
      sixGradeEventYn: json['SIX_GRADE_EVENT_YN'] as String?,
    );

Map<String, dynamic> _$NeisScheduleDTOToJson(_NeisScheduleDTO instance) =>
    <String, dynamic>{
      'AA_YMD': instance.eventDate,
      'EVENT_NM': instance.eventName,
      'ONE_GRADE_EVENT_YN': instance.oneGradeEventYn,
      'TW_GRADE_EVENT_YN': instance.twGradeEventYn,
      'THREE_GRADE_EVENT_YN': instance.threeGradeEventYn,
      'FR_GRADE_EVENT_YN': instance.frGradeEventYn,
      'FIV_GRADE_EVENT_YN': instance.fivGradeEventYn,
      'SIX_GRADE_EVENT_YN': instance.sixGradeEventYn,
    };

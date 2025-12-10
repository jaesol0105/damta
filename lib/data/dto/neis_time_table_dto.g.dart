// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'neis_time_table_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_NeisTimeTableDto _$NeisTimeTableDtoFromJson(Map<String, dynamic> json) =>
    _NeisTimeTableDto(
      date: json['ALL_TI_YMD'] as String,
      grade: json['GRADE'] as String,
      classes: json['CLASS_NM'] as String,
      period: json['PERIO'] as String,
      subject: json['ITRT_CNTNT'] as String,
    );

Map<String, dynamic> _$NeisTimeTableDtoToJson(_NeisTimeTableDto instance) =>
    <String, dynamic>{
      'ALL_TI_YMD': instance.date,
      'GRADE': instance.grade,
      'CLASS_NM': instance.classes,
      'PERIO': instance.period,
      'ITRT_CNTNT': instance.subject,
    };

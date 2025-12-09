// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'neis_meal_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_NeisMealDTO _$NeisMealDTOFromJson(Map<String, dynamic> json) => _NeisMealDTO(
  schoolName: json['SCHUL_NM'] as String,
  mealTypeCode: json['MMEAL_SC_CODE'] as String,
  dateYmd: json['MLSV_YMD'] as String,
  dishNm: json['DDISH_NM'] as String,
  calInfo: json['CAL_INFO'] as String?,
);

Map<String, dynamic> _$NeisMealDTOToJson(_NeisMealDTO instance) =>
    <String, dynamic>{
      'SCHUL_NM': instance.schoolName,
      'MMEAL_SC_CODE': instance.mealTypeCode,
      'MLSV_YMD': instance.dateYmd,
      'DDISH_NM': instance.dishNm,
      'CAL_INFO': instance.calInfo,
    };

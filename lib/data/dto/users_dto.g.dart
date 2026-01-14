// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'users_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UsersDto _$UsersDtoFromJson(Map<String, dynamic> json) => _UsersDto(
  uId: json['uId'] as String?,
  officeCode: json['officeCode'] as String,
  schoolCode: json['schoolCode'] as String,
  schoolName: json['schoolName'] as String,
);

Map<String, dynamic> _$UsersDtoToJson(_UsersDto instance) => <String, dynamic>{
  'uId': instance.uId,
  'officeCode': instance.officeCode,
  'schoolCode': instance.schoolCode,
  'schoolName': instance.schoolName,
};

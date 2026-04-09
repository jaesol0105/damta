// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CommentDto _$CommentDtoFromJson(Map<String, dynamic> json) => _CommentDto(
  cId: json['c_id'] as String?,
  uId: json['u_id'] as String,
  pId: json['p_id'] as String,
  cContent: json['c_content'] as String,
  cWriter: json['c_writer'] as String,
  cCreatedAt: TimestampConverter.toDateTime(json['c_created_at']),
);

Map<String, dynamic> _$CommentDtoToJson(_CommentDto instance) =>
    <String, dynamic>{
      'c_id': instance.cId,
      'u_id': instance.uId,
      'p_id': instance.pId,
      'c_content': instance.cContent,
      'c_writer': instance.cWriter,
      'c_created_at': TimestampConverter.toTimestamp(instance.cCreatedAt),
    };

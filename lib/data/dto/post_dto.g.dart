// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PostDto _$PostDtoFromJson(Map<String, dynamic> json) => _PostDto(
  pId: json['p_id'] as String?,
  uId: json['u_id'] as String,
  pTitle: json['p_title'] as String,
  pContent: json['p_content'] as String,
  pWriter: json['p_writer'] as String,
  pCreatedAt: TimestampConverter.toDateTime(json['p_created_at']),
  pImageUrl: json['p_image_url'] as String?,
  viewCount: (json['view_count'] as num?)?.toInt(),
  commentCount: (json['comment_count'] as num?)?.toInt(),
  reactions: (json['reactions'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as String),
  ),
);

Map<String, dynamic> _$PostDtoToJson(_PostDto instance) => <String, dynamic>{
  'p_id': instance.pId,
  'u_id': instance.uId,
  'p_title': instance.pTitle,
  'p_content': instance.pContent,
  'p_writer': instance.pWriter,
  'p_created_at': TimestampConverter.toTimestamp(instance.pCreatedAt),
  'p_image_url': instance.pImageUrl,
  'view_count': instance.viewCount,
  'comment_count': instance.commentCount,
  'reactions': instance.reactions,
};

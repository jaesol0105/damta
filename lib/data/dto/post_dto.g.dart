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
  pCreatedAt: DateTime.parse(json['p_created_at'] as String),
  pImageUrl: json['p_image_url'] as String?,
  emojis: (json['emojis'] as List<dynamic>?)?.map((e) => e as String).toList(),
  uIdForView: (json['u_id_for_view'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toSet(),
);

Map<String, dynamic> _$PostDtoToJson(_PostDto instance) => <String, dynamic>{
  'p_id': instance.pId,
  'u_id': instance.uId,
  'p_title': instance.pTitle,
  'p_content': instance.pContent,
  'p_writer': instance.pWriter,
  'p_created_at': instance.pCreatedAt.toIso8601String(),
  'p_image_url': instance.pImageUrl,
  'emojis': instance.emojis,
  'u_id_for_view': instance.uIdForView?.toList(),
};

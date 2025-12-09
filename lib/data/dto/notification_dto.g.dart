// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_NotificationDto _$NotificationDtoFromJson(Map<String, dynamic> json) =>
    _NotificationDto(
      nId: json['nId'] as String?,
      uId: json['uId'] as String,
      pId: json['pId'] as String,
      pTitle: json['pTitle'] as String,
      createdAt: _convertToDateTime(json['createdAt'] as String),
      isComment: json['isComment'] as bool,
      content: json['content'] as String? ?? '',
      isNew: json['isNew'] as bool,
      isRead: json['isRead'] as bool,
    );

Map<String, dynamic> _$NotificationDtoToJson(_NotificationDto instance) =>
    <String, dynamic>{
      'nId': instance.nId,
      'uId': instance.uId,
      'pId': instance.pId,
      'pTitle': instance.pTitle,
      'createdAt': _convertFromDateTime(instance.createdAt),
      'isComment': instance.isComment,
      'content': instance.content,
      'isNew': instance.isNew,
      'isRead': instance.isRead,
    };

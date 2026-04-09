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
      nCreatedAt: TimestampConverter.toDateTime(json['nCreatedAt']),
      isComment: json['isComment'] as bool,
      content: json['content'] as String,
      isNew: json['isNew'] as bool,
      isRead: json['isRead'] as bool,
    );

Map<String, dynamic> _$NotificationDtoToJson(_NotificationDto instance) =>
    <String, dynamic>{
      'nId': instance.nId,
      'uId': instance.uId,
      'pId': instance.pId,
      'pTitle': instance.pTitle,
      'nCreatedAt': TimestampConverter.toTimestamp(instance.nCreatedAt),
      'isComment': instance.isComment,
      'content': instance.content,
      'isNew': instance.isNew,
      'isRead': instance.isRead,
    };

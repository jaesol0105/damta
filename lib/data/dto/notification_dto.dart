import 'package:freezed_annotation/freezed_annotation.dart';

part 'notification_dto.freezed.dart';
part 'notification_dto.g.dart';

@freezed
abstract class NotificationDto with _$NotificationDto {
  const factory NotificationDto({
    String? nId,
    required String uId,
    required String pId,
    required String pTitle,
    @JsonKey(fromJson: _convertToDateTime, toJson: _convertFromDateTime)
    required DateTime createdAt,
    required bool isComment,
    required String content,
    required bool isNew,
    required bool isRead,
  }) = _NotificationDto;

  factory NotificationDto.fromJson(Map<String, Object?> json) =>
      _$NotificationDtoFromJson(json);
}

// DateTime 변환 함수
DateTime _convertToDateTime(String timeString) => DateTime.parse(timeString);
String _convertFromDateTime(DateTime time) => time.toIso8601String();

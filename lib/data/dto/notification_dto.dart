import 'package:damta/data/util/timestamp_converter.dart';
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
    @JsonKey(
      fromJson: TimestampConverter.toDateTime,
      toJson: TimestampConverter.toTimestamp,
    )
    DateTime? nCreatedAt,
    required bool isComment,
    required String content,
    required bool isNew,
    required bool isRead,
  }) = _NotificationDto;

  factory NotificationDto.fromJson(Map<String, Object?> json) =>
      _$NotificationDtoFromJson(json);
}

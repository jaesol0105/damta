import 'package:damta/data/util/Timestamp_converter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'post_dto.freezed.dart';
part 'post_dto.g.dart';

@freezed
abstract class PostDto with _$PostDto {
  const factory PostDto({
    @JsonKey(name: "p_id") required String? pId,
    @JsonKey(name: "u_id") required String uId,
    @JsonKey(name: "p_title") required String pTitle,
    @JsonKey(name: "p_content") required String pContent,
    @JsonKey(name: "p_writer") required String pWriter,
    @JsonKey(
      name: "p_created_at",
      fromJson: TimestampConverter.toDateTime,
      toJson: TimestampConverter.toTimestamp,
    )
    required DateTime pCreatedAt,
    @JsonKey(name: "p_image_url") String? pImageUrl,
    required List<String>? emojis,
    @JsonKey(name: "u_id_for_view") Set<String>? uIdForView,
  }) = _PostDto;

  factory PostDto.fromJson(Map<String, dynamic> json) =>
      _$PostDtoFromJson(json);
}

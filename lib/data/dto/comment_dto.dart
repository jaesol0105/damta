import 'package:freezed_annotation/freezed_annotation.dart';

part 'comment_dto.freezed.dart';
part 'comment_dto.g.dart';

@freezed
abstract class CommentDto with _$CommentDto {
  const factory CommentDto({
    @JsonKey(name: "c_id") String? cId,
    @JsonKey(name: "u_id") required String uId,
    @JsonKey(name: "p_id") required String pId,
    @JsonKey(name: "c_content") required String cContent,
    @JsonKey(name: "c_writer") required String cWriter,
    @JsonKey(name: "c_created_at") required DateTime cCreatedAt,
  }) = _CommentDto;

  factory CommentDto.fromJson(Map<String, dynamic> json) =>
      _$CommentDtoFromJson(json);
}

import 'package:freezed_annotation/freezed_annotation.dart';

part 'post_entity.freezed.dart';

@freezed
abstract class PostEntity with _$PostEntity {
  const factory PostEntity({
    String? pId,
    required String uId,
    required String pTitle,
    required String pContent,
    required String pWriter,
    required DateTime pCreatedAt,
    String? pImageUrl,
    List<String>? emojis,
    Set<String>? uIdForView,
  }) = _PostEntity;
}

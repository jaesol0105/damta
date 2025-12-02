import 'package:damta/domain/entity/comment_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'post_entity.freezed.dart';

@freezed
abstract class PostEntity with _$PostEntity {
  const factory PostEntity({
    String? pId,
    required String pTitle,
    required String pContent,
    required String pWriter,
    required DateTime pCreatedAt,
    List<String>? emojis,
    int? view,
    List<CommentEntity>? comments,
  }) = _PostEntity;
}

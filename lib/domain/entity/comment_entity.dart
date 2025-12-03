import 'package:freezed_annotation/freezed_annotation.dart';

part 'comment_entity.freezed.dart';

@freezed
abstract class CommentEntity with _$CommentEntity {
  const factory CommentEntity({
    String? cId,
    required String cContent,
    required String cWriter,
    required DateTime cCreatedAt,
    required String pId
  }) = _CommentEntity;
}

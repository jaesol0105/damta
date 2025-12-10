import 'package:damta/domain/entity/comment_entity.dart';

abstract interface class CommentRepository {
  Future<List<CommentEntity>> getAllComments();
  Future<void> addComment(CommentEntity commentEntity);
  Future<void> updateComment(CommentEntity commentEntity);
  Future<void> deleteComment(String cId);
}

import 'package:damta/data/dto/comment_dto.dart';

abstract interface class CommentDataSource {
  Future<List<CommentDto>> getAllComments();
  Future<void> addComment(CommentDto commentDto);
  Future<void> updateComment(CommentDto commentDto);
  Future<void> deleteComment(String cId);
}

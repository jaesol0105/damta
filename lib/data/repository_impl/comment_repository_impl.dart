import 'package:damta/data/data_source/remote/comment_data_source.dart';
import 'package:damta/data/mapper/comment_mapper.dart';
import 'package:damta/domain/entity/comment_entity.dart';
import 'package:damta/domain/repository/comment_repository.dart';

class CommentRepositoryImpl implements CommentRepository {
  const CommentRepositoryImpl(this.commentDataSource);
  final CommentDataSource commentDataSource;

  @override
  Future<void> addComment(CommentEntity commentEntity) {
    final commentDto = commentEntityToCommentDto(commentEntity);
    return commentDataSource.addComment(commentDto);
  }

  @override
  Future<void> deleteComment(String cId, String pId) {
    return commentDataSource.deleteComment(cId, pId);
  }

  @override
  Future<List<CommentEntity>> getCommentsByPostId(String pId) async {
    final dtos = await commentDataSource.getCommentsByPostId(pId);
    return dtos.map(commentDtoToCommentEntity).toList();
  }

  @override
  Future<void> updateComment(CommentEntity commentEntity) {
    final commentDto = commentEntityToCommentDto(commentEntity);
    return commentDataSource.updateComment(commentDto);
  }
}

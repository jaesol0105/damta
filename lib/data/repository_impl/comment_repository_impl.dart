// Dto - Entity
import 'package:damta/data/data_source/comment_data_source.dart';
import 'package:damta/data/mapper/comment_mapper.dart';
import 'package:damta/domain/entity/comment_entity.dart';
import 'package:damta/domain/repository/comment_repository.dart';

class CommentRepositoryImpl implements CommentRepository {
  const CommentRepositoryImpl(this.commentDataSource); // 의존성 주입
  final CommentDataSource commentDataSource;

  @override
  Future<void> addComment(CommentEntity commentEntity) {
    final commentDto = commentEntityToCommentDto(commentEntity);
    return commentDataSource.addComment(commentDto);
  }

  @override
  Future<void> deleteComment(String cId) {
    return commentDataSource.deleteComment(cId);
  }

  @override
  Future<List<CommentEntity>> getAllComments() async {
    final dtos = await commentDataSource.getAllComments();
    return dtos.map(commentDtoToCommentEntity).toList();
  }

  @override
  Future<void> updateComment(CommentEntity commentEntity) {
    final commentDto = commentEntityToCommentDto(commentEntity);
    return commentDataSource.updateComment(commentDto);
  }
}

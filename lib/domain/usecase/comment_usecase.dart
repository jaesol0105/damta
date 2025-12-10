import 'package:damta/domain/entity/comment_entity.dart';
import 'package:damta/domain/repository/comment_repository.dart';

class CommentUsecase {
  const CommentUsecase(this.commentRepository);
  final CommentRepository commentRepository;

  Future<List<CommentEntity>> getAllComments() {
    return commentRepository.getAllComments();
  }

  Future<void> updateComment(CommentEntity commentEntity) async {
    await commentRepository.updateComment(commentEntity);
  }

  Future<void> addComment(CommentEntity commentEntity) async {
    await commentRepository.addComment(commentEntity);
  }

  Future<void> deleteComment(String cId) async {
    await commentRepository.deleteComment(cId);
  }
}

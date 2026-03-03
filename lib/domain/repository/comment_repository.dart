import 'package:damta/domain/entity/comment_entity.dart';

abstract interface class CommentRepository {
  /// 특정 게시글의 댓글만 조회
  Future<List<CommentEntity>> getCommentsByPostId(String pId);

  /// 댓글 추가
  Future<void> addComment(CommentEntity commentEntity);

  /// 댓글 수정
  Future<void> updateComment(CommentEntity commentEntity);

  /// 댓글 삭제
  Future<void> deleteComment(String cId, String pId);
}

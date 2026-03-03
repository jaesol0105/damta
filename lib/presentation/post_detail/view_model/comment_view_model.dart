import 'package:damta/core/di/provider.dart';
import 'package:damta/domain/entity/comment_entity.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'comment_view_model.g.dart';

@riverpod
class CommentViewModel extends _$CommentViewModel {
  @override
  List<CommentEntity> build() {
    return [];
  }

  /// 특정 게시글의 댓글만 불러옴
  Future<void> getComments(String pId) async {
    final commentUsecase = ref.read(commentUsecaseProvider);
    final comments = await commentUsecase.getCommentsByPostId(pId);
    state = comments;
  }

  /// 댓글 수정
  Future<void> updateComment(CommentEntity commentEntity) async {
    final commentUsecase = ref.read(commentUsecaseProvider);
    await commentUsecase.updateComment(commentEntity);
    if (commentEntity.pId.isNotEmpty) {
      await getComments(commentEntity.pId);
    }
  }

  // 댓글 추가
  Future<void> addComment(CommentEntity commentEntity) async {
    final commentUsecase = ref.read(commentUsecaseProvider);
    await commentUsecase.addComment(commentEntity);
    await getComments(commentEntity.pId);
  }

  // 댓글 삭제
  Future<void> deleteComment(String cId, String pId) async {
    final commentUsecase = ref.read(commentUsecaseProvider);
    await commentUsecase.deleteComment(cId, pId);
    await getComments(pId);
  }
}

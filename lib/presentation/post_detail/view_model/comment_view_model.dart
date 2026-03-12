import 'package:damta/core/di/provider.dart';
import 'package:damta/domain/entity/comment_entity.dart';
import 'package:damta/presentation/ui_provider/users_provider.dart';
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
    final blockUsecase = ref.read(blockUsecaseProvider);
    final comments = await commentUsecase.getCommentsByPostId(pId);
    final currentUid = ref.read(currentUIdProvider);
    if (currentUid != null) {
      // 숨김 댓글 제외
      final hiddenIds = await blockUsecase.getHiddenTargetIds(currentUid);
      state = comments.where((c) => !hiddenIds.contains(c.cId)).toList();
    } else {
      state = comments;
    }
  }

  /// 댓글 숨기기
  Future<void> hideComment(String cId, String hiderUid) async {
    // 낙관적 업데이트
    state = state.where((c) => c.cId != cId).toList();
    await ref.read(blockUsecaseProvider).hideTarget(hiderUid, cId, 'comment');
  }

  /// 댓글 추가
  Future<void> addComment(CommentEntity commentEntity) async {
    final commentUsecase = ref.read(commentUsecaseProvider);
    await commentUsecase.addComment(commentEntity);
    await getComments(commentEntity.pId);
  }

  /// 댓글 수정
  Future<void> updateComment(CommentEntity commentEntity) async {
    final commentUsecase = ref.read(commentUsecaseProvider);
    await commentUsecase.updateComment(commentEntity);
    if (commentEntity.pId.isNotEmpty) {
      await getComments(commentEntity.pId);
    }
  }

  /// 댓글 삭제
  Future<void> deleteComment(String cId, String pId) async {
    // 낙관적 업데이트
    final prevState = state;
    state = state.where((c) => c.cId != cId).toList();

    try {
      final commentUsecase = ref.read(commentUsecaseProvider);
      await commentUsecase.deleteComment(cId, pId);
      // 데이터 fetch
      await getComments(pId);
    } catch (e) {
      // 실패시 prevState로 fallback
      if (ref.mounted) state = prevState;
      rethrow;
    }
  }
}

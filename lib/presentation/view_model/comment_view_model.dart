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

  Future<void> getComments() async {
    final commentUsecase = ref.read(commentUsecaseProvider);
    final comments = await commentUsecase.getAllComments();
    state = comments;
  }

  Future<void> updateComment(CommentEntity commentEntity) async {
    final commentUsecase = ref.read(commentUsecaseProvider);
    await commentUsecase.updateComment(commentEntity);
    await getComments();
  }

  Future<void> addComment(CommentEntity commentEntity) async {
    final commentUsecase = ref.read(commentUsecaseProvider);
    await commentUsecase.addComment(commentEntity);
    await getComments();
  }

  Future<void> deleteComment(String cId) async {
    final commentUsecase = ref.read(commentUsecaseProvider);
    await commentUsecase.deleteComment(cId);
    await getComments();
  }
}

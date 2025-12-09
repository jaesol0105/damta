// import 'package:damta/core/di/post_provider.dart';
import 'package:damta/core/di/post_provider.dart';
import 'package:damta/domain/entity/post_entity.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'post_view_model.g.dart';

@riverpod
class PostViewModel extends _$PostViewModel {
  @override
  List<PostEntity> build() {
    return [];
  }

  Future<void> loadPosts() async {
    final postUsecase = ref.read(postUsecaseProvider);
    final posts = await postUsecase.getAllPosts();
    state = posts;
  }
}

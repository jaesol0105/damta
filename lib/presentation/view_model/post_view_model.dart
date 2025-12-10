import 'package:damta/core/di/provider.dart';
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
    // 시간순으로 정렬 (최신순)
    posts.sort((a, b) => b.pCreatedAt.compareTo(a.pCreatedAt));
    state = posts;
  }

  Future<void> addPost(PostEntity postEntity) async {
    final postUsecase = ref.read(postUsecaseProvider);
    await postUsecase.addPost(postEntity);
    await loadPosts();
  }

  Future<void> updatePost(PostEntity postEntity) async {
    final postUsecase = ref.read(postUsecaseProvider);
    await postUsecase.updatePost(postEntity);
    await loadPosts();
  }

  Future<void> deletePost(String pId) async {
    final postUsecase = ref.read(postUsecaseProvider);
    await postUsecase.deletePost(pId);
    await loadPosts();
  }
}

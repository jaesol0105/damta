import 'package:damta/core/di/provider.dart';
import 'package:damta/domain/entity/post_entity.dart';
import 'package:damta/presentation/ui_provider/users_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'post_view_model.g.dart';

@riverpod
class PostViewModel extends _$PostViewModel {
  @override
  List<PostEntity> build() {
    // Provider 첫 생성 시 자동으로 게시글 로드
    Future.microtask(loadPosts);
    return [];
  }

  Future<void> loadPosts() async {
    final postUsecase = ref.read(postUsecaseProvider);
    // 현재 사용자의 schoolCode를 가져와 학교별 글만 조회
    final user = await ref.read(userProvider.future);
    final posts = await postUsecase.getAllPosts(schoolCode: user.schoolCode);
    // 시간순으로 정렬 (최신순)
    posts.sort((a, b) => b.pCreatedAt.compareTo(a.pCreatedAt));
    state = posts;
  }

  Future<void> addPost(PostEntity postEntity) async {
    final postUsecase = ref.read(postUsecaseProvider);
    final user = await ref.read(userProvider.future);
    await postUsecase.addPost(postEntity, schoolCode: user.schoolCode);
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

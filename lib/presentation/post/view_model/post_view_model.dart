import 'dart:developer';

import 'package:damta/core/di/provider.dart';
import 'package:damta/domain/entity/post_entity.dart';
import 'package:damta/presentation/ui_provider/users_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'post_view_model.g.dart';

@riverpod
class PostViewModel extends _$PostViewModel {
  @override
  List<PostEntity> build() {
    Future.microtask(getPosts);
    return [];
  }

  /// 게시글 목록 fetch
  Future<void> getPosts() async {
    final postUsecase = ref.read(postUsecaseProvider);
    final user = await ref.read(userProvider.future);
    final posts = await postUsecase.getPosts(schoolCode: user.schoolCode);
    if (ref.mounted) state = posts;
  }

  /// 게시글 추가
  Future<void> addPost(PostEntity postEntity) async {
    final postUsecase = ref.read(postUsecaseProvider);
    final user = await ref.read(userProvider.future);
    await postUsecase.addPost(postEntity, schoolCode: user.schoolCode);
    await getPosts();
  }

  /// 게시글 내용 수정
  Future<void> updatePostContent(PostEntity postEntity) async {
    final postUsecase = ref.read(postUsecaseProvider);
    await postUsecase.updatePostContent(postEntity);
    await getPosts();
  }

  /// 게시글 삭제
  Future<void> deletePost(String pId) async {
    final postUsecase = ref.read(postUsecaseProvider);
    await postUsecase.deletePost(pId);
    await getPosts();
  }

  /// 조회수 증가
  Future<void> incrementViewCount(String pId) async {
    final postUsecase = ref.read(postUsecaseProvider);
    await postUsecase.incrementViewCount(pId);
  }

  /// 이모지 반응 추가/변경
  Future<void> addReaction(String pId, String userId, String emoji) async {
    final postUsecase = ref.read(postUsecaseProvider);
    await postUsecase.addReaction(pId, userId, emoji);
    final updatedPost = await postUsecase.getPost(pId);
    if (updatedPost != null && ref.mounted) {
      state = state.map((p) => p.pId == pId ? updatedPost : p).toList();
    }
  }
}

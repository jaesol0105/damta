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

  /// 이모지 반응 추가
  Future<void> addReaction(String pId, String userId, String emoji) async {
    final prevState = state;
    // 낙관적 업데이트 먼저 적용 (UI 딜레이 해결)
    final idx = state.indexWhere((p) => p.pId == pId);
    if (idx != -1) {
      final list = [...state];
      final reactions = Map<String, String>.from(list[idx].reactions ?? {});
      reactions['${userId}_$emoji'] = DateTime.now().millisecondsSinceEpoch
          .toString();
      list[idx] = list[idx].copyWith(reactions: reactions);
      state = list;
    }
    try {
      final postUsecase = ref.read(postUsecaseProvider);
      await postUsecase.addReaction(pId, userId, emoji);
      // 반응 추가 후 서버 데이터 동기화
      final updatedPost = await postUsecase.getPost(pId);
      if (updatedPost != null && ref.mounted) {
        final i = state.indexWhere((p) => p.pId == pId);
        if (i != -1) {
          final synced = [...state];
          synced[i] = updatedPost;
          state = synced;
        }
      }
    } catch (e) {
      // 실패시 prevState로 fallback
      if (ref.mounted) state = prevState;
      rethrow;
    }
  }

  /// 이모지 반응 취소
  Future<void> removeReaction(String pId, String userId, String emoji) async {
    final prevState = state;
    final idx = state.indexWhere((p) => p.pId == pId);
    if (idx != -1) {
      final list = [...state];
      final reactions = Map<String, String>.from(list[idx].reactions ?? {});
      reactions.remove('${userId}_$emoji');
      list[idx] = list[idx].copyWith(reactions: reactions);
      state = list;
    }
    try {
      await ref.read(postUsecaseProvider).removeReaction(pId, userId, emoji);
    } catch (e) {
      if (ref.mounted) state = prevState;
      rethrow;
    }
  }
}

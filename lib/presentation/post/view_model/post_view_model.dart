import 'package:damta/core/di/provider.dart';
import 'package:damta/domain/entity/post_entity.dart';
import 'package:damta/presentation/ui_provider/users_provider.dart';
import 'package:flutter/scheduler.dart';
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
    final user = await ref.read(userProvider.future);
    final currentUid = ref.read(currentUIdProvider);
    final posts = await ref
        .read(postUsecaseProvider)
        .getPosts(schoolCode: user.schoolCode);

    if (!ref.mounted) return;

    // 숨김 게시글 제외
    if (currentUid != null) {
      final blockUsecase = ref.read(blockUsecaseProvider);
      final hiddenIds = await blockUsecase.getHiddenTargetIds(currentUid);
      final blockedUserIds = await blockUsecase.getBlockedUserIds(currentUid);
      if (ref.mounted) {
        state = posts
            .where(
              (p) =>
                  !hiddenIds.contains(p.pId) && !blockedUserIds.contains(p.uId),
            )
            .toList();
      }
    } else {
      state = posts;
    }
  }

  /// 게시글 숨기기
  Future<void> hidePost(String pId, String hiderUid) async {
    // 낙관적 업데이트
    state = state.where((p) => p.pId != pId).toList();
    await ref.read(blockUsecaseProvider).hideTarget(hiderUid, pId, 'post');
  }

  /// 게시글 추가
  Future<void> addPost(PostEntity postEntity) async {
    final user = await ref.read(userProvider.future);
    final added = await ref
        .read(postUsecaseProvider)
        .addPost(postEntity, schoolCode: user.schoolCode);
    // 서버 응답 후 업데이트
    if (ref.mounted) state = [added, ...state];
  }

  /// 게시글 내용 수정
  Future<void> updatePostContent(PostEntity postEntity) async {
    final prevState = state;
    // 낙관적 업데이트
    _updateInState(postEntity);
    try {
      await ref.read(postUsecaseProvider).updatePostContent(postEntity);
    } catch (e) {
      // fallback
      if (ref.mounted) state = prevState;
      rethrow;
    }
  }

  /// 게시글 삭제
  Future<void> deletePost(String pId) async {
    final prevState = state;
    // 낙관적 업데이트
    state = state.where((p) => p.pId != pId).toList();
    try {
      await ref.read(postUsecaseProvider).deletePost(pId);
    } catch (e) {
      // fallback
      if (ref.mounted) state = prevState;
      rethrow;
    }
  }

  /// 조회수 증가
  Future<void> incrementViewCount(String pId) async {
    final postUsecase = ref.read(postUsecaseProvider);
    await postUsecase.incrementViewCount(pId);
    // useEffect에서 호출될 때 Riverpod과 빌드 사이클 충돌 이슈, 빌드 완료 후 state 수정되도록 함
    SchedulerBinding.instance.addPostFrameCallback((_) {
      // pop으로 인해 provider dispose 되었을경우 실행하지 않도록 함
      if (!ref.mounted) return;
      final post = _findPost(pId);
      if (post != null) {
        _updateInState(post.copyWith(viewCount: (post.viewCount ?? 0) + 1));
      }
    });
    await ref.read(postUsecaseProvider).incrementViewCount(pId);
  }

  /// 이모지 반응 추가
  Future<void> addReaction(String pId, String userId, String emoji) async {
    final prevState = state;
    final post = _findPost(pId);
    if (post != null) {
      final reactions = Map<String, String>.from(post.reactions ?? {})
        ..['${userId}_$emoji'] = DateTime.now().millisecondsSinceEpoch
            .toString();
      // 낙관적 업데이트 먼저 적용
      _updateInState(post.copyWith(reactions: reactions));
    }
    try {
      final postUsecase = ref.read(postUsecaseProvider);
      await postUsecase.addReaction(pId, userId, emoji);
      // 반응 추가 후 서버 데이터 동기화
      final updatedPost = await postUsecase.getPost(pId);
      if (updatedPost != null && ref.mounted) _updateInState(updatedPost);
    } catch (e) {
      // 실패시 prevState로 fallback
      if (ref.mounted) state = prevState;
      rethrow;
    }
  }

  /// 이모지 반응 취소
  Future<void> removeReaction(String pId, String userId, String emoji) async {
    final prevState = state;
    final post = _findPost(pId);
    if (post != null) {
      final reactions = Map<String, String>.from(post.reactions ?? {})
        ..remove('${userId}_$emoji');
      // 낙관적 업데이트 먼저 적용
      _updateInState(post.copyWith(reactions: reactions));
    }
    try {
      await ref.read(postUsecaseProvider).removeReaction(pId, userId, emoji);
    } catch (e) {
      // 실패시 prevState로 fallback
      if (ref.mounted) state = prevState;
      rethrow;
    }
  }

  /// 사용자 차단 후 UI 갱신
  /// comment에서 사용자 차단 후 글 갱신을 위해 사용
  void removeUserFromState(String targetUid) {
    state = state.where((c) => c.uId != targetUid).toList();
  }

  /// 사용자 차단
  Future<void> blockUser(String targetUid, String hiderUid) async {
    // 낙관적 업데이트
    state = state.where((p) => p.uId != targetUid).toList();
    await ref
        .read(blockUsecaseProvider)
        .hideTarget(hiderUid, targetUid, 'user');
  }

  /// 게시글 찾기
  PostEntity? _findPost(String pId) =>
      state.where((p) => p.pId == pId).firstOrNull;

  /// 낙관적 업데이트
  void _updateInState(PostEntity post) {
    final idx = state.indexWhere((p) => p.pId == post.pId);
    if (idx == -1) return;
    final list = [...state];
    list[idx] = post;
    state = list;
  }
}

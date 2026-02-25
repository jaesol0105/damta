import 'package:damta/core/di/provider.dart';
import 'package:damta/domain/repository/auth_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_view_model.g.dart';

// 로그인,로그아웃,회원탈퇴 Action 전용 ViewModel
@Riverpod(keepAlive: true)
class AuthViewModel extends _$AuthViewModel {
  late final AuthRepository _repo = ref.read(authRepositoryProvider);

  @override
  AsyncValue<void> build() {
    return const AsyncData(null);
  }

  bool get isLoading => state.isLoading;

  // 공통 실행 래퍼
  Future<void> _execute(Future<void> Function() action) async {
    if (state.isLoading) return; // 중복 클릭 방지
    state = const AsyncLoading();
    if (!ref.mounted) return;
    state = await AsyncValue.guard(action);
  }

  Future<void> signInGoogle() async {
    await _execute(() async {
      await _repo.signInGoogle();
    });
  }

  Future<void> signInApple() async {
    await _execute(() async {
      await _repo.signInApple();
    });
  }

  Future<void> signInKakao() async {
    await _execute(() async {
      await _repo.signInKakao();
    });
  }

  Future<void> signInNaver() async {
    await _execute(() async {
      await _repo.signInNaver();
    });
  }

  Future<void> signOut({VoidCallback? onError}) async {
    await _execute(() async {
      try {
        await _repo.signOut();
      } catch (e) {
        if (onError != null) onError();
      }
    });
  }

  Future<void> deleteAccount({VoidCallback? onError}) async {
    await _execute(() async {
      try {
        await _repo.deleteAccount();
      } catch (e) {
        if (onError != null) onError();
      }
    });
  }
}

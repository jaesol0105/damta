import 'package:damta/core/di/provider.dart';
import 'package:damta/domain/repository/memo_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final memoViewModelProvider =
    AsyncNotifierProvider<MemoViewModel, String>(MemoViewModel.new);

class MemoViewModel extends AsyncNotifier<String> {
  MemoRepository get _repo => ref.read(memoRepositoryProvider);

  @override
  Future<String> build() => _repo.getMemo();

  Future<void> save(String content) async {
    await _repo.saveMemo(content);
    state = AsyncData(content);
  }
}

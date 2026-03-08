import 'package:damta/core/di/provider.dart';
import 'package:damta/domain/repository/memo_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'memo_view_model.g.dart';

@riverpod
class MemoViewModel extends _$MemoViewModel {
  MemoRepository get _repo => ref.read(memoRepositoryProvider);

  @override
  Future<String> build() => _repo.getMemo();

  Future<void> save(String content) async {
    await _repo.saveMemo(content);
    state = AsyncData(content);
  }
}

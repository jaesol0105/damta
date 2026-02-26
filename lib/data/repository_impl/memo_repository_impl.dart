import 'package:damta/data/data_source/local/memo_local_data_source.dart';
import 'package:damta/domain/repository/memo_repository.dart';

class MemoRepositoryImpl implements MemoRepository {
  const MemoRepositoryImpl(this._dataSource);

  final MemoLocalDataSource _dataSource;

  @override
  Future<String> getMemo() => _dataSource.getMemo();

  @override
  Future<void> saveMemo(String content) => _dataSource.saveMemo(content);
}

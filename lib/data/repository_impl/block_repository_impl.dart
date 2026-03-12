import 'package:damta/data/data_source/remote/block_data_source.dart';
import 'package:damta/domain/repository/block_repository.dart';

class BlockRepositoryImpl implements BlockRepository {
  const BlockRepositoryImpl(this._dataSource);
  final BlockDataSource _dataSource;

  @override
  Future<void> hideTarget(
    String hiderUid,
    String targetId,
    String targetType,
  ) => _dataSource.hideTarget(hiderUid, targetId, targetType);

  @override
  Future<List<String>> getHiddenTargetIds(String hiderUid) =>
      _dataSource.getHiddenTargetIds(hiderUid);

  @override
  Future<bool> isHidden(String hiderUid, String targetId) =>
      _dataSource.isHidden(hiderUid, targetId);
}

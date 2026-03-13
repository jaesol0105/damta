import 'package:damta/domain/repository/block_repository.dart';

class BlockUsecase {
  const BlockUsecase(this._blockRepository);
  final BlockRepository _blockRepository;

  Future<void> hideTarget(
    String hiderUid,
    String targetId,
    String targetType,
  ) async {
    final already = await _blockRepository.isHidden(hiderUid, targetId);
    if (already) {
      if (targetType == 'user') {
        throw Exception('이미 차단한 사용자입니다.');
      } else {
        throw Exception('이미 숨긴 항목입니다.');
      }
    }
    await _blockRepository.hideTarget(hiderUid, targetId, targetType);
  }

  Future<List<String>> getHiddenTargetIds(String hiderUid) =>
      _blockRepository.getHiddenTargetIds(hiderUid);

  Future<List<String>> getBlockedUserIds(String hiderUid) =>
      _blockRepository.getBlockedUserIds(hiderUid);
}

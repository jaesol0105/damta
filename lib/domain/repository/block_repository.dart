abstract interface class BlockRepository {
  /// 사용자가 특정 게시글/댓글을 숨김 처리
  Future<void> hideTarget(String hiderUid, String targetId, String targetType);

  /// 사용자가 숨김 처리한 게시글/댓글 id 조회
  Future<List<String>> getHiddenTargetIds(String hiderUid);

  /// 차단한 사용자 목록 조회
  Future<List<String>> getBlockedUserIds(String hiderUid);

  /// 게시글/댓글이 숨김 처리 되었는지 확인
  Future<bool> isHidden(String hiderUid, String targetId);
}

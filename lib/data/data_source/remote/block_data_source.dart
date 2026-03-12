import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:damta/core/logger/log.dart';

abstract interface class BlockDataSource {
  /// 사용자가 특정 게시글/댓글을 숨김 처리
  Future<void> hideTarget(String hiderUid, String targetId, String targetType);

  /// 사용자가 숨김 처리한 게시글/댓글 id 조회
  Future<List<String>> getHiddenTargetIds(String hiderUid);

  /// 게시글/댓글이 숨김 처리 되었는지 확인
  Future<bool> isHidden(String hiderUid, String targetId);
}

class BlockDataSourceImpl implements BlockDataSource {
  BlockDataSourceImpl(this._firestore);
  final FirebaseFirestore _firestore;
  static const _collection = 'hidden_item';

  @override
  Future<void> hideTarget(
    String hiderUid,
    String targetId,
    String targetType,
  ) async {
    try {
      await _firestore.collection(_collection).add({
        'hider_uid': hiderUid,
        'target_id': targetId,
        'target_type': targetType,
        'created_at': FieldValue.serverTimestamp(),
      });
    } on FirebaseException catch (e, s) {
      Log.e('hideTarget 실패: ${e.message}', error: e, stackTrace: s);
      rethrow;
    } catch (e, s) {
      Log.e('알 수 없는 hideTarget 실패: $e', error: e, stackTrace: s);
      rethrow;
    }
  }

  @override
  Future<List<String>> getHiddenTargetIds(String hiderUid) async {
    final snapshot = await _firestore
        .collection(_collection)
        .where('hider_uid', isEqualTo: hiderUid)
        .get();
    return snapshot.docs
        .map((doc) => doc.data()['target_id'] as String)
        .toList();
  }

  @override
  Future<bool> isHidden(String hiderUid, String targetId) async {
    final snapshot = await _firestore
        .collection(_collection)
        .where('hider_uid', isEqualTo: hiderUid)
        .where('target_id', isEqualTo: targetId)
        .limit(1)
        .get();
    return snapshot.docs.isNotEmpty;
  }
}

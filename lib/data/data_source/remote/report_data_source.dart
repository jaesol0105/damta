import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:damta/core/logger/log.dart';
import 'package:damta/domain/entity/report_entity.dart';

abstract interface class ReportDataSource {
  /// 중복 체크 확인
  Future<bool> hasAlreadyReported(String reporterUid, String targetId);

  /// 신고 등록
  Future<void> addReport(ReportEntity reportEntity);
}

class ReportDataSourceImpl implements ReportDataSource {
  ReportDataSourceImpl(this._firestore);
  final FirebaseFirestore _firestore;

  @override
  Future<bool> hasAlreadyReported(String reporterUid, String targetId) async {
    final snapshot = await _firestore
        .collection('report')
        .where('reporter_uid', isEqualTo: reporterUid)
        .where('target_id', isEqualTo: targetId)
        .limit(1)
        .get();
    return snapshot.docs.isNotEmpty;
  }

  @override
  Future<void> addReport(ReportEntity reportEntity) async {
    try {
      await _firestore.collection('report').add({
        'reporter_uid': reportEntity.reporterUid,
        'target_type': reportEntity.targetType.value,
        'target_id': reportEntity.targetId,
        'target_uid': reportEntity.targetUid,
        'reason': reportEntity.reason.name,
        'school_code': reportEntity.schoolCode,
        'r_created_at': FieldValue.serverTimestamp(),
        'status': 'pending',
      });
    } on FirebaseException catch (e, s) {
      Log.e('Firebase addReport 실패: ${e.message}', error: e, stackTrace: s);
      rethrow;
    } catch (e, s) {
      Log.e('알 수 없는 addReport 실패: $e', error: e, stackTrace: s);
      rethrow;
    }
  }
}

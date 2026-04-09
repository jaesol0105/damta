import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:damta/core/logger/log.dart';
import 'package:damta/domain/entity/report_entity.dart';
import 'package:damta/domain/enum/report_target_type_enum.dart';

abstract interface class ReportDataSource {
  /// 신고 중복 체크 확인
  Future<bool> hasAlreadyReported(String reporterUid, String targetId);

  /// 신고 등록 + 3회 누적 숨김 처리
  Future<void> addReport(ReportEntity reportEntity);
}

class ReportDataSourceImpl implements ReportDataSource {
  ReportDataSourceImpl(this._firestore);
  final FirebaseFirestore _firestore;
  static const int _hiddenThreshold = 3;

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
      // 신고 대상 컬렉션 (게시글/댓글)
      final targetCollection = reportEntity.targetType == ReportTargetType.post
          ? 'post'
          : 'comment';

      // 신고 대상 게시글/댓글의 참조
      final targetRef = _firestore
          .collection(targetCollection)
          .doc(reportEntity.targetId);

      // 트랙잭션 시작
      await _firestore.runTransaction((transaction) async {
        // 신고 대상 doc의 신고 누적횟수 조회 후 증가
        final targetDoc = await transaction.get(targetRef);
        final currentCount = (targetDoc.data()?['report_count'] as int?) ?? 0;
        final newCount = currentCount + 1;

        // 신고 문서 생성
        final reportRef = _firestore.collection('report').doc();
        transaction.set(reportRef, {
          'reporter_uid': reportEntity.reporterUid,
          'target_type': reportEntity.targetType.value,
          'target_id': reportEntity.targetId,
          'target_uid': reportEntity.targetUid,
          'reason': reportEntity.reason.name,
          'school_code': reportEntity.schoolCode,
          'r_created_at': FieldValue.serverTimestamp(),
          'status': 'pending',
        });

        // report_count 증가
        final Map<String, dynamic> targetUpdate = {'report_count': newCount};

        // 3회 이상 시 is_hidden 설정
        // TODO: 여유가 되면 서버 함수로 이전
        if (newCount >= _hiddenThreshold) {
          targetUpdate['is_hidden'] = true;
        }

        // 신고 대상 문서 업데이트
        if (targetDoc.exists) {
          transaction.update(targetRef, targetUpdate);
        }
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

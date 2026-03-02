import 'package:damta/domain/entity/report_entity.dart';
import 'package:damta/domain/repository/report_repository.dart';

class ReportUsecase {
  const ReportUsecase(this._reportRepository);
  final ReportRepository _reportRepository;

  /// 신고 제출
  /// - 자기 게시글/댓글 신고 시 예외
  /// - 중복 신고 시 예외
  Future<void> submitReport(ReportEntity reportEntity) async {
    if (reportEntity.reporterUid == reportEntity.targetUid) {
      throw Exception('본인의 게시글/댓글은 신고할 수 없습니다.');
    }

    final alreadyReported = await _reportRepository.hasAlreadyReported(
      reportEntity.reporterUid,
      reportEntity.targetId,
    );
    if (alreadyReported) {
      throw Exception('이미 신고한 게시글/댓글입니다.');
    }

    await _reportRepository.addReport(reportEntity);
  }
}

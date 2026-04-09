import 'package:damta/domain/entity/report_entity.dart';
import 'package:damta/domain/repository/report_repository.dart';

class ReportUsecase {
  const ReportUsecase(this._reportRepository);
  final ReportRepository _reportRepository;

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

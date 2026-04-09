import 'package:damta/domain/entity/report_entity.dart';

abstract interface class ReportRepository {
  Future<bool> hasAlreadyReported(String reporterUid, String targetId);
  Future<void> addReport(ReportEntity reportEntity);
}

import 'package:damta/data/data_source/remote/report_data_source.dart';
import 'package:damta/domain/entity/report_entity.dart';
import 'package:damta/domain/repository/report_repository.dart';

class ReportRepositoryImpl implements ReportRepository {
  const ReportRepositoryImpl(this._dataSource);
  final ReportDataSource _dataSource;

  @override
  Future<bool> hasAlreadyReported(String reporterUid, String targetId) {
    return _dataSource.hasAlreadyReported(reporterUid, targetId);
  }

  @override
  Future<void> addReport(ReportEntity reportEntity) {
    return _dataSource.addReport(reportEntity);
  }
}

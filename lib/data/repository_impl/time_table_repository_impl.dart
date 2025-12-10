import 'dart:developer';
import 'package:damta/data/data_source/local/time_table_local_data_source.dart';
import 'package:damta/data/data_source/remote/time_table_remote_data_source.dart';
import 'package:damta/data/mapper/time_table_mapper.dart';
import 'package:damta/domain/entity/time_table_entity.dart';
import 'package:damta/domain/repository/time_table_repository.dart';

class TimeTableRepositoryImpl implements TimeTableRepository {
  TimeTableRepositoryImpl(this._remoteDataSource, this._localDataSource);

  final TimeTableRemoteDataSource _remoteDataSource;
  final TimeTableLocalDataSource _localDataSource;

  // from 날짜부터 to 날짜까지의 시간표 정보 가져오기
  @override
  Future<List<TimeTableEntity>> getTimeTables({
    required String officeCode,
    required String schoolCode,
    required DateTime fromDate,
    required DateTime toDate,
    required int grade,
    required int classes,
  }) async {
    try {
      // 로컬 캐시에서 먼저 조회
      final cachedSchedules = await _localDataSource.getTimeTables(
        schoolCode: schoolCode,
        fromDate: fromDate,
        toDate: toDate,
        grade: grade.toString(),
        classes: classes.toString(),
      );
      if (cachedSchedules.isNotEmpty) {
        return cachedSchedules;
      }

      // 캐시가 없으면 API 호출
      final dtoList = await _remoteDataSource.getTimeTables(
        officeCode: officeCode,
        schoolCode: schoolCode,
        fromDate: fromDate,
        toDate: toDate,
        grade: grade.toString(),
        classes: classes.toString(),
      );
      final entities = TimeTableMapper.toDomainList(dtoList);

      // API 응답을 로컬 캐시에 저장
      if (entities.isNotEmpty) {
        await _localDataSource.saveTimeTables(
          schoolCode: schoolCode,
          tables: entities,
        );
      }
      return entities;
    } catch (e, s) {
      log('Repository getSchedules 실패: $e', error: e, stackTrace: s);
      rethrow;
    }
  }
}

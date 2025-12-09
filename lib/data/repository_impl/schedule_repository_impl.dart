import 'dart:developer';

import 'package:damta/data/data_source/local/schedule_local_data_source.dart';
import 'package:damta/data/data_source/remote/schedule_remote_data_source.dart';
import 'package:damta/data/mapper/schedule_mapper.dart';
import 'package:damta/domain/entity/schedule_entity.dart';
import 'package:damta/domain/repository/schedule_repository.dart';

class ScheduleRepositoryImpl implements ScheduleRepository {
  ScheduleRepositoryImpl(this._remoteDataSource, this._localDataSource);

  final ScheduleRemoteDataSource _remoteDataSource;
  final ScheduleLocalDataSource _localDataSource;

  @override
  Future<List<ScheduleEntity>> getSchedules({
    required String officeCode,
    required String schoolCode,
    required DateTime fromDate,
    required DateTime toDate,
  }) async {
    try {
      // 로컬 캐시에서 먼저 조회
      final cachedSchedules = await _localDataSource.getSchedules(
        schoolCode: schoolCode,
        fromDate: fromDate,
        toDate: toDate,
      );
      if (cachedSchedules.isNotEmpty) {
        return cachedSchedules;
      }

      // 캐시가 없으면 API 호출
      final dtoList = await _remoteDataSource.getSchedules(
        officeCode: officeCode,
        schoolCode: schoolCode,
        fromDate: fromDate,
        toDate: toDate,
      );
      final entities = ScheduleMapper.toDomainList(dtoList);

      // API 응답을 로컬 캐시에 저장
      if (entities.isNotEmpty) {
        await _localDataSource.saveSchedules(schoolCode: schoolCode, schedules: entities);
      }
      return entities;
    } catch (e, s) {
      log('Repository getSchedules 실패: $e', error: e, stackTrace: s);
      rethrow;
    }
  }
}

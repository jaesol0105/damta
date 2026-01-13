import 'dart:developer';
import 'package:damta/data/util/extension/date_time_extension.dart';
import 'package:damta/data/database/database_helper.dart';
import 'package:damta/data/dto/local_cache_dto/schedule_cache_dto.dart';
import 'package:damta/domain/entity/schedule_entity.dart';
import 'package:sqflite/sqflite.dart';

abstract class ScheduleLocalDataSource {
  /// 로컬 캐시에서 학사일정 정보 가져오기
  Future<List<ScheduleEntity>> getSchedules({
    required String schoolCode,
    required DateTime fromDate,
    required DateTime toDate,
  });

  /// 학사일정 정보 로컬 캐시에 저장
  Future<void> saveSchedules({
    required String schoolCode,
    required List<ScheduleEntity> schedules,
  });
}

class ScheduleLocalDataSourceImpl implements ScheduleLocalDataSource {
  ScheduleLocalDataSourceImpl({required this.database});

  final Database database;
  String get _tableName => DatabaseHelper.scheduleCacheTable; // 테이블명

  /// 로컬 저장소에 캐싱 된 학사일정 정보 불러오기
  @override
  Future<List<ScheduleEntity>> getSchedules({
    required String schoolCode,
    required DateTime fromDate,
    required DateTime toDate,
  }) async {
    try {
      // 로컬 캐시 조회
      final List<Map<String, dynamic>> maps = await database.query(
        _tableName,
        where: 'school_code = ? AND date >= ? AND date <= ?',
        whereArgs: [schoolCode, fromDate.dbDate(), toDate.dbDate()],
        orderBy: 'date ASC',
      );

      if (maps.isEmpty) {
        print('🥕로컬 캐시에 데이터 없음');
        return [];
      }

      final cacheList = maps
          .map((map) => ScheduleCacheDTO.fromMap(map))
          .toList();

      return cacheList.map((cache) => cache.toDomain()).toList();
    } catch (e, s) {
      log('로컬 캐시 조회 실패 : $e', error: e, stackTrace: s);
      return []; // Repository에서 네트워크 요청
    }
  }

  /// 로컬 저장소에 캐시 저장
  @override
  Future<void> saveSchedules({
    required String schoolCode,
    required List<ScheduleEntity> schedules,
  }) async {
    if (schedules.isEmpty) return;

    try {
      await database.transaction((txn) async {
        for (final schedule in schedules) {
          final cacheModel = ScheduleCacheDTO.fromDomain(
            entity: schedule,
            schoolCode: schoolCode,
          );
          await txn.insert(
            _tableName,
            cacheModel.toMap(),
            conflictAlgorithm: ConflictAlgorithm.replace,
          );
        }
      });
      print('🥕${schedules.length}개 캐시 저장 완료 : $schoolCode');
    } catch (e, s) {
      log('🥕캐시 저장 실패 : $e', error: e, stackTrace: s);
    }
  }
}

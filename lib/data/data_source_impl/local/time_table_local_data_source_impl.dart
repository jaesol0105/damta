import 'dart:developer';
import 'package:damta/data/data_source/local/time_table_local_data_source.dart';
import 'package:damta/data/util/extension/date_time_extension.dart';
import 'package:damta/data/database/database_helper.dart';
import 'package:damta/data/dto/local_cache_dto/time_table_cache_model.dart';
import 'package:damta/domain/entity/time_table_entity.dart';
import 'package:sqflite/sqflite.dart';

class TimeTableLocalDataSourceImpl implements TimeTableLocalDataSource {
  TimeTableLocalDataSourceImpl({required this.database});
  final Database database;

  String get _tableName => DatabaseHelper.timeTableCacheTable; // 테이블명

  // 로컬 저장소에 캐싱 된 시간표 정보 불러오기
  @override
  Future<List<TimeTableEntity>> getTimeTables({
    required String schoolCode,
    required DateTime fromDate,
    required DateTime toDate,
    required String grade,
    required String classes,
  }) async {
    try {
      // 로컬 캐시 조회
      final List<Map<String, dynamic>> maps = await database.query(
        _tableName,
        where: 'school_code = ? AND date >= ? AND date <= ? AND grade = ? AND classes = ?',
        whereArgs: [schoolCode, fromDate.dbDate(), toDate.dbDate(), grade, classes],
        orderBy: 'date ASC',
      );

      if (maps.isEmpty) {
        print('🥕로컬 캐시에 데이터 없음');
        return [];
      }

      final cacheModels = maps.map((map) => TimeTableCacheModel.fromMap(map)).toList();
      return cacheModels.map((cache) => cache.toDomain()).toList();
    } catch (e, s) {
      log('로컬 캐시 조회 실패 : $e', error: e, stackTrace: s);
      return []; // Repository에서 네트워크 요청
    }
  }

  /// 로컬 저장소에 캐시 저장
  @override
  Future<void> saveTimeTables({
    required String schoolCode,
    required List<TimeTableEntity> tables,
  }) async {
    final db = await database;
    final batch = db.batch();

    for (final t in tables) {
      batch.insert('time_table_cache', {
        'school_code': schoolCode,
        'date': t.date.dbDate(),
        'grade': t.grade,
        'classes': t.classes,
        'period': t.period,
        'subject': t.subject,
        'cached_at': DateTime.now().millisecondsSinceEpoch,
      }, conflictAlgorithm: ConflictAlgorithm.replace);
    }

    await batch.commit(noResult: true);
    print('🥕캐시 저장 완료');
  }
}

import 'dart:developer';

import 'package:damta/data/data_source/local/meal_local_data_source.dart';
import 'package:damta/data/database/database_helper.dart';
import 'package:damta/data/model/meal_cache_model.dart';
import 'package:damta/domain/entity/meal_entity.dart';
import 'package:sqflite/sqflite.dart';

class MealLocalDataSourceImpl implements MealLocalDataSource {
  MealLocalDataSourceImpl({required this.database});

  final Database database;
  String get _tableName => DatabaseHelper.mealCacheTable; // 테이블명

  /// 로컬 저장소에 캐싱 된 급식 정보 불러오기
  @override
  Future<List<MealEntity>> getMeals({
    required String schoolCode,
    required DateTime from,
    required DateTime to,
  }) async {
    try {
      final fromDate = _formatDate(from);
      final toDate = _formatDate(to);

      // 로컬 캐시 조회
      final List<Map<String, dynamic>> maps = await database.query(
        _tableName,
        where: 'school_code = ? AND date >= ? AND date <= ?',
        whereArgs: [schoolCode, fromDate, toDate],
        orderBy: 'date ASC, meal_type ASC',
      );
      if (maps.isEmpty) {
        log('🥕로컬 캐시에 데이터 없음 : $schoolCode ($fromDate ~ $toDate)');
        return [];
      }
      final cacheModels = maps.map((map) => MealCacheModel.fromMap(map)).toList();

      // 만료된 캐시 필터링 (자정 기준, 하루 1회는 새로 API 호출)
      final today = _getDateOnly(DateTime.now());
      final cachedDate = _getDateOnly(
        DateTime.fromMillisecondsSinceEpoch(cacheModels.first.cachedAt),
      );
      if (!cachedDate.isAtSameMomentAs(today)) {
        await clearExpiredCache(); // 만료된 캐시 DB에서 삭제
        return [];
      }

      log('🥕로컬 캐시에서 ${cacheModels.length}개 급식 정보 로드');
      return cacheModels.map((cache) => cache.toDomain()).toList();
    } catch (e, s) {
      log('🥕로컬 캐시 조회 실패 : $e', error: e, stackTrace: s);
      return [];
    }
  }

  /// 로컬 저장소에 캐시 저장
  @override
  Future<void> saveMeals({required String schoolCode, required List<MealEntity> meals}) async {
    try {
      await database.transaction((txn) async {
        for (final meal in meals) {
          final cacheModel = MealCacheModel.fromDomain(entity: meal, schoolCode: schoolCode);
          await txn.insert(
            _tableName,
            cacheModel.toMap(),
            conflictAlgorithm: ConflictAlgorithm.replace,
          );
        }
      });
      print('🥕${meals.length}개 캐시 저장 완료 : $schoolCode');
    } catch (e, s) {
      log('🥕캐시 저장 실패 : $e', error: e, stackTrace: s);
    }
  }

  /// 만료된 캐시 삭제하기
  @override
  Future<void> clearExpiredCache() async {
    try {
      // 오늘 자정(00:00:00) 시간 구하기
      final today = _getDateOnly(DateTime.now());
      final todayMidnight = today.millisecondsSinceEpoch;
      // 전날 캐시 삭제
      final count = await database.delete(
        _tableName,
        where: 'cached_at < ?',
        whereArgs: [todayMidnight],
      );
    } catch (e, s) {
      log('🥕만료된 캐시 삭제 실패 : $e', error: e, stackTrace: s);
    }
  }

  @override
  Future<void> clearCache({required String schoolCode}) async {}

  /// 현재 날짜 00시
  DateTime _getDateOnly(DateTime dateTime) {
    return DateTime(dateTime.year, dateTime.month, dateTime.day);
  }

  /// DB 날짜 포맷
  String _formatDate(DateTime date) {
    return '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';
  }
}

import 'dart:developer';

import 'package:damta/core/extension/date_time_extension.dart';
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
    required DateTime fromDate,
    required DateTime toDate,
  }) async {
    try {
      // 로컬 캐시 조회
      final List<Map<String, dynamic>> maps = await database.query(
        _tableName,
        where: 'school_code = ? AND date >= ? AND date <= ?',
        whereArgs: [schoolCode, fromDate.dbDate(), toDate.dbDate()],
        orderBy: 'date ASC, meal_type ASC',
      );

      if (maps.isEmpty) {
        print('🥕로컬 캐시에 데이터 없음');
        return [];
      }

      final cacheModels = maps.map((map) => MealCacheModel.fromMap(map)).toList();

      // 만료된 캐시 필터링 (자정 기준, 하루 1회는 새로 API 호출)
      final today = DateTime.now().dateOnly();
      final cachedDate = DateTime.fromMillisecondsSinceEpoch(cacheModels.first.cachedAt).dateOnly();
      if (!cachedDate.isAtSameMomentAs(today)) {
        await clearExpiredCache(); // 만료된 캐시 DB에서 삭제
        return [];
      }

      print('🥕로컬 캐시에서 ${cacheModels.length}개 급식 정보 로드');
      return cacheModels.map((cache) => cache.toDomain()).toList();
    } catch (e, s) {
      log('로컬 캐시 조회 실패 : $e', error: e, stackTrace: s);
      return []; // Repository에서 네트워크 요청
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
      log('캐시 저장 실패 : $e', error: e, stackTrace: s);
    }
  }

  /// 만료된 캐시 삭제하기
  @override
  Future<void> clearExpiredCache() async {
    try {
      // 오늘날짜 기준 자정 00시
      final todayMidnight = DateTime.now().dateOnly().millisecondsSinceEpoch;
      // 전날 캐시 삭제
      await database.delete(_tableName, where: 'cached_at < ?', whereArgs: [todayMidnight]);
    } catch (e, s) {
      log('만료된 캐시 삭제 실패 : $e', error: e, stackTrace: s);
    }
  }
}

import 'package:damta/domain/entity/meal_entity.dart';

abstract class MealLocalDataSource {
  /// 로컬 캐시에서 급식 정보 가져오기
  Future<List<MealEntity>> getMeals({
    required String schoolCode,
    required DateTime from,
    required DateTime to,
  });

  /// 급식 정보 로컬 캐시에 저장
  Future<void> saveMeals({required String schoolCode, required List<MealEntity> meals});

  /// 캐시 삭제
  Future<void> clearCache({required String schoolCode});

  /// 만료된 캐시 정리
  Future<void> clearExpiredCache();
}

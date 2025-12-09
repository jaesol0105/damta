import 'package:damta/domain/entity/meal_entity.dart';

abstract class MealRepository {
  /// from 날짜부터 to 날짜까지의 급식 정보 가져오기
  Future<List<MealEntity>> getMeals({
    required String officeCode,
    required String schoolCode,
    required DateTime fromDate,
    required DateTime toDate,
  });
}

import 'package:damta/data/dto/neis_meal_dto.dart';

abstract class MealRemoteDataSource {
  /// NEIS API : from 날짜부터 to 날짜까지의 급식 정보 가져오기
  Future<List<NeisMealDTO>> getMeals({
    required String officeCode,
    required String schoolCode,
    required DateTime fromDate,
    required DateTime toDate,
  });
}

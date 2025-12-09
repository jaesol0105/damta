import 'package:damta/domain/enums/meal_type_enum.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'meal_entity.freezed.dart';

@freezed
abstract class MealEntity with _$MealEntity {
  const factory MealEntity({
    required DateTime date, // 날짜
    required MealType type, // 아침점심저녁 구분
    required List<String> dishes, // 급식메뉴 명
    String? kcal, // 칼로리
  }) = _MealEntity;
}

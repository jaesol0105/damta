import 'dart:convert';
import 'package:damta/data/util/extension/date_time_extension.dart';
import 'package:damta/domain/entity/meal_entity.dart';
import 'package:damta/domain/enum/meal_type_enum.dart';

class MealCacheDTO {
  final int? id;
  final String schoolCode;
  final String date; // yyyy-MM-dd 형식
  final String mealType; // breakfast, lunch, dinner
  final String dishesJson; // List<String>을 JSON으로 저장
  final String? kcal; // 칼로리
  final int cachedAt; // Unix timestamp (밀리초)
  /// SQLite에 저장되는 급식 캐시 모델
  MealCacheDTO({
    this.id,
    required this.schoolCode,
    required this.date,
    required this.mealType,
    required this.dishesJson,
    this.kcal,
    required this.cachedAt,
  });

  /// MealCacheDTO를 DB Map으로 변환
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'school_code': schoolCode,
      'date': date,
      'meal_type': mealType,
      'dishes_json': dishesJson,
      'kcal': kcal,
      'cached_at': cachedAt,
    };
  }

  /// DB Map을 MealCacheDTO로 변환
  factory MealCacheDTO.fromMap(Map<String, dynamic> map) {
    return MealCacheDTO(
      id: map['id'] as int?,
      schoolCode: map['school_code'] as String,
      date: map['date'] as String,
      mealType: map['meal_type'] as String,
      dishesJson: map['dishes_json'] as String,
      kcal: map['kcal'] as String?,
      cachedAt: map['cached_at'] as int,
    );
  }

  /// MealCacheDTO를 MealEntity로 변환
  MealEntity toDomain() {
    return MealEntity(
      date: DateTime.parse(date),
      type: MealType.values.firstWhere((e) => e.name == mealType),
      dishes: (jsonDecode(dishesJson) as List).cast<String>(),
      kcal: kcal,
    );
  }

  /// MealEntity를 MealCacheDTO로 변환
  factory MealCacheDTO.fromDomain({
    required MealEntity entity,
    required String schoolCode,
  }) {
    return MealCacheDTO(
      schoolCode: schoolCode,
      date: entity.date.dbDate(),
      mealType: entity.type.name,
      dishesJson: jsonEncode(entity.dishes),
      kcal: entity.kcal,
      cachedAt: DateTime.now().millisecondsSinceEpoch,
    );
  }
}

import 'dart:convert';
import 'package:damta/domain/entity/meal_entity.dart';
import 'package:damta/domain/enums/meal_type_enum.dart';

class MealCacheModel {
  final int? id;
  final String schoolCode;
  final String date; // yyyy-MM-dd 형식
  final String mealType; // breakfast, lunch, dinner
  final String dishesJson; // List<String>을 JSON으로 저장
  final String? kcal;
  final int cachedAt; // Unix timestamp (밀리초)
  /// SQLite에 저장되는 급식 캐시 모델
  MealCacheModel({
    this.id,
    required this.schoolCode,
    required this.date,
    required this.mealType,
    required this.dishesJson,
    this.kcal,
    required this.cachedAt,
  });

  /// MealCacheModel을 Map으로 변환
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

  /// Map을 MealCacheModel으로 변환
  factory MealCacheModel.fromMap(Map<String, dynamic> map) {
    return MealCacheModel(
      id: map['id'] as int?,
      schoolCode: map['school_code'] as String,
      date: map['date'] as String,
      mealType: map['meal_type'] as String,
      dishesJson: map['dishes_json'] as String,
      kcal: map['kcal'] as String?,
      cachedAt: map['cached_at'] as int,
    );
  }

  /// MealEntity를 MealCacheModel로 변환
  factory MealCacheModel.fromDomain({required MealEntity entity, required String schoolCode}) {
    return MealCacheModel(
      schoolCode: schoolCode,
      date: _formatDate(entity.date),
      mealType: entity.type.name,
      dishesJson: jsonEncode(entity.dishes),
      kcal: entity.kcal,
      cachedAt: DateTime.now().millisecondsSinceEpoch,
    );
  }

  /// MealCacheModel을 MealEntity로 변환
  MealEntity toDomain() {
    return MealEntity(
      date: DateTime.parse(date),
      type: MealType.values.firstWhere((e) => e.name == mealType),
      dishes: (jsonDecode(dishesJson) as List).cast<String>(),
      kcal: kcal,
    );
  }

  static String _formatDate(DateTime date) {
    return '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';
  }
}

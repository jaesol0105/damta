enum MealType { breakfast, lunch, dinner }

extension MealTypeLabel on MealType {
  String get label {
    switch (this) {
      case MealType.breakfast:
        return '조식';
      case MealType.lunch:
        return '중식';
      case MealType.dinner:
        return '석식';
    }
  }
}

abstract class AppConstants {
  // SharedPreferences keys
  static const String homeModulesKey = 'home_modules';
  static const String timetableSelectedClassKey = 'timetable_selected_class';

  // 급식 시간 분류 기준
  static const int breakfastCutOff = 9 * 60 + 30; // 09:30
  static const int lunchCutOff = 14 * 60; // 14:00
}

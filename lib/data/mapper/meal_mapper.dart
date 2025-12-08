import 'package:damta/domain/enums/meal_type_enum.dart';
import 'package:damta/data/dto/neis_meal_dto.dart';
import 'package:damta/domain/entity/meal_entity.dart';

class MealMapper {
  static MealEntity toDomain(NeisMealDTO dto) {
    // 날짜 파싱 (yyyyMMdd -> DateTime)
    final date = DateTime.parse(
      '${dto.dateYmd.substring(0, 4)}-'
      '${dto.dateYmd.substring(4, 6)}-'
      '${dto.dateYmd.substring(6, 8)}',
    );

    // 아침/점심/저녁 파싱
    final type = () {
      switch (dto.mealTypeCode.trim()) {
        case '1':
          return MealType.breakfast;
        case '2':
          return MealType.lunch;
        case '3':
          return MealType.dinner;
        default:
          return MealType.lunch;
      }
    }();

    // 메뉴명 파싱
    // 학교마다 알레르기 표기 방법이 달랐음, 알레르기표기라벨 없이 오는 학교도 있음, 괄호로 오는 학교도 있음.
    final dishes = dto.dishNm
        .split('<br/>')
        // 알레르기표기라벨 @ 뒷부분 날리기 (@1.2.3. 형식)
        .map((e) => e.split('@').first)
        // 알레르기표기라벨 (1.2.3.) 형식 제거
        .map((e) => e.replaceAll(RegExp(r'\s*\(\s*\d+(\.\d+)*\s*\)\s*$'), ''))
        // 알레르기표기라벨 1.2.3. 형식 제거
        .map((e) => e.replaceAll(RegExp(r'\d+(\.\d+)*\.'), ''))
        .map((e) => e.trim())
        .where((e) => e.isNotEmpty)
        .toList();

    // 칼로리는 숫자에 Kcal 붙은 형태 그대로 사용
    final kcal = dto.calInfo ?? "";

    return MealEntity(date: date, type: type, dishes: dishes, kcal: kcal);
  }
}

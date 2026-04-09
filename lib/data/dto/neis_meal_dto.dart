import 'package:freezed_annotation/freezed_annotation.dart';

part 'neis_meal_dto.freezed.dart';
part 'neis_meal_dto.g.dart';

@freezed
abstract class NeisMealDTO with _$NeisMealDTO {
  const factory NeisMealDTO({
    @JsonKey(name: 'SCHUL_NM') required String schoolName, // 학교명
    @JsonKey(name: 'MMEAL_SC_CODE') required String mealTypeCode, // 1/2/3 (아침/점심/저녁)
    @JsonKey(name: 'MLSV_YMD') required String dateYmd, // 날짜 "20251207" 형태
    @JsonKey(name: 'DDISH_NM') required String dishNm, // 메뉴명 문자열, "<br/>"이랑 알레르기 정보 필터링 필요
    @JsonKey(name: 'CAL_INFO') String? calInfo, // 칼로리 "827.9 Kcal" 형태
  }) = _NeisMealDTO;

  factory NeisMealDTO.fromJson(Map<String, dynamic> json) => _$NeisMealDTOFromJson(json);
}

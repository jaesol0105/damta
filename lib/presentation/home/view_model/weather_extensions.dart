import 'package:damta/domain/entity/weather_entity.dart';

extension WeatherEntityPresentation on WeatherEntity {
  static const _weekdayNames = [
    '월요일',
    '화요일',
    '수요일',
    '목요일',
    '금요일',
    '토요일',
    '일요일',
  ];

  /// 날짜 요일 문자열
  String get formattedDate =>
      '${time.year}. ${time.month}. ${time.day} ${_weekdayNames[time.weekday - 1]}';

  /// 기온, 강수 확률 기반 날씨 코멘트
  String get weatherComment {
    if (precipitation >= 50) return '비 오는\n날씨야\n우산 챙겨!';
    if (temperature < -5) return '밖에 10분이상\n있으면\n어는 날씨야';
    if (temperature < 0) return '오늘\n정말 추워';
    if (temperature < 8) return '오늘 꽤\n쌀쌀한 날씨야';
    if (temperature < 15) return '오늘\n선선한 날씨야';
    if (temperature < 22) return '오늘 날씨\n좋은데?';
    if (temperature < 28) return '따뜻한\n날씨야';
    if (temperature < 30) return '더운 날씨야\n조심해';
    return '밖에 10분이상\n있으면\n녹는 날씨야';
  }

  /// 날씨 조건별 이미지 에셋
  String get weatherImagePath {
    if (precipitation >= 50) return 'assets/images/chick_rain.png';
    if (temperature < 8) return 'assets/images/chick_cold.png';
    if (temperature >= 28) return 'assets/images/chick_hot.png';
    return 'assets/images/chick_normal.png';
  }
}

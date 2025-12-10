import 'package:intl/intl.dart';

extension DateFormatExtensions on DateTime {
  /// DB 저장용: yyyy-MM-dd
  String dbDate() {
    return '$year-${month.toString().padLeft(2, '0')}-${day.toString().padLeft(2, '0')}';
  }

  /// NEIS API 요청용: yyyyMMdd
  String neisDate() => DateFormat('yyyyMMdd').format(this);

  /// 급식 캐시 초기화용: 현재 날짜기준 자정 반환
  DateTime dateOnly() => DateTime(year, month, day);
}

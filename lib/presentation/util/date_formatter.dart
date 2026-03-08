import 'package:intl/intl.dart';

class DateFormatter {
  static final _formatter = DateFormat('yy/MM/dd HH:mm');
  static String format(DateTime date) => _formatter.format(date);
}

extension DateTimeExt on DateTime {
  bool isSameDay(DateTime other) =>
      year == other.year && month == other.month && day == other.day;

  bool isSameMonth(DateTime other) =>
      year == other.year && month == other.month;
}

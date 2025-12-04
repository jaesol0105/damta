import 'package:intl/intl.dart';

class DateFormatter {
  static final _formatter = DateFormat('yy/MM/dd HH:mm');

  static String format(DateTime date) => _formatter.format(date);
}

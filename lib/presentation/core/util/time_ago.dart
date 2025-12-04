import 'package:damta/presentation/core/util/date_formatter.dart';

String timeAgo(DateTime date) {
  final Duration diff = DateTime.now().difference(date);
  if (diff.inSeconds < 60) {
    return '방금 전';
  } else if (diff.inMinutes < 60) {
    return '${diff.inMinutes}분 전';
  } else if (diff.inHours < 24) {
    return '${diff.inHours}시간 전';
  } else if (diff.inDays < 7) {
    return '${diff.inDays}일 전';
  } else {
    return DateFormatter.format(date);
  }
}

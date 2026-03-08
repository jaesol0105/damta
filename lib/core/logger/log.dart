import 'package:flutter/foundation.dart';

class Log {
  static void d(String message) {
    if (!kDebugMode) return;
    debugPrint(message);
  }

  static void e(String message, {Object? error, StackTrace? stackTrace}) {
    if (!kDebugMode) return;
    final location = _caller();

    debugPrint('❌ [$location] $message');
    if (error != null) {
      debugPrint('error: $error');
    }
    if (stackTrace != null) {
      debugPrint('stackTrace: $stackTrace');
    }
  }

  static String _caller() {
    final traceLines = StackTrace.current.toString().split('\n');

    for (final line in traceLines) {
      if (line.contains('Log.d') ||
          line.contains('Log.e') ||
          line.contains('_caller')) {
        continue;
      }

      final match = RegExp(r'(/[^ ]+):(\d+):(\d+)').firstMatch(line);
      if (match != null) {
        final fullPath = match.group(1)!;
        final fileName = fullPath.split('/').last;
        final lineNumber = match.group(2)!;
        return '$fileName:$lineNumber';
      }
    }

    return 'unknown';
  }
}

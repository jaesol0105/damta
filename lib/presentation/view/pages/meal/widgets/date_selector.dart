import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class DateSelector extends HookWidget {
  const DateSelector({
    super.key,
    required this.selectedDate,
    required this.onDateSelected,
    required this.mealDates,
  });

  final DateTime selectedDate;
  final Function(DateTime) onDateSelected;
  final Set<DateTime> mealDates;

  /// 오늘 기준 한달 치 날짜 생성 (급식이 있는 날만)
  List<DateTime> _generateDates() {
    final today = DateTime.now();
    final dates = <DateTime>[];
    for (int i = 0; i < 30; i++) {
      final d = DateTime(today.year, today.month, today.day + i);

      if (_hasMeal(d)) {
        dates.add(d);
      }
    }
    return dates;
  }

  /// 해당 날짜에 급식이 있는지 여부
  bool _hasMeal(DateTime date) {
    return mealDates.any((m) => m.year == date.year && m.month == date.month && m.day == date.day);
  }

  /// 요일 매퍼
  String _getWeekdayName(DateTime date) {
    const weekdays = ['월', '화', '수', '목', '금', '토', '일'];
    return weekdays[date.weekday - 1];
  }

  @override
  Widget build(BuildContext context) {
    final scrollController = useScrollController();
    final dates = useMemoized(() => _generateDates());

    return SizedBox(
      height: 80,
      child: ListView.builder(
        controller: scrollController,
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        itemCount: dates.length,
        itemBuilder: (context, index) {
          if (index > 0 && index < dates.length) {
            final prevDate = dates[index - 1];
            final currentDate = dates[index];
            // 월 바뀔때 구분
            if (prevDate.month != currentDate.month) {
              return Row(children: [_monthSeparator(currentDate), _dateItem(currentDate)]);
            }
          }
          // 현재 월 구분
          if (index == 0) {
            return Row(children: [_monthSeparator(dates[0]), _dateItem(dates[0])]);
          }
          return _dateItem(dates[index]);
        },
      ),
    );
  }

  /// 월 표시 위젯
  Widget _monthSeparator(DateTime date) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Text(
        '${date.month}월',
        style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.grey[700]),
      ),
    );
  }

  /// 날짜 탭 위젯
  Widget _dateItem(DateTime date) {
    final isSelected =
        selectedDate.year == date.year &&
        selectedDate.month == date.month &&
        selectedDate.day == date.day;

    return GestureDetector(
      onTap: () => onDateSelected(date),
      child: Container(
        width: 56,
        margin: const EdgeInsets.symmetric(horizontal: 4),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFFA7D7FE) : Colors.white,
          shape: BoxShape.circle,
          border: Border.all(
            color: isSelected ? const Color(0xFFA7D7FE) : Colors.grey[300]!,
            width: 1,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 2),
            Text(
              date.day.toString(),
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w500,
                height: 0.8, // 텍스트간 간격 줄이기
                color: isSelected ? Colors.white : Colors.grey[700],
              ),
            ),
            Text(
              _getWeekdayName(date),
              style: TextStyle(fontSize: 12, color: isSelected ? Colors.white : Colors.grey[600]),
            ),
          ],
        ),
      ),
    );
  }
}

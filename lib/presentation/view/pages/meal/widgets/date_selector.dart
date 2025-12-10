import 'package:damta/core/theme/app_theme.dart';
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
  final List<DateTime> mealDates;

  /// 요일 매퍼
  String _getWeekdayName(DateTime date) {
    const weekdays = ['월', '화', '수', '목', '금', '토', '일'];
    return weekdays[date.weekday - 1];
  }

  @override
  Widget build(BuildContext context) {
    final scrollController = useScrollController();
    final dates = mealDates;

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
            // 월(month) 바뀔때 구분 라벨
            if (prevDate.month != currentDate.month) {
              return Row(
                children: [_monthSeparator(context, currentDate), _dateItem(context, currentDate)],
              );
            }
          }
          // 현재 월(month) 구분 라벨
          if (index == 0) {
            return Row(
              children: [_monthSeparator(context, dates[0]), _dateItem(context, dates[0])],
            );
          }
          return _dateItem(context, dates[index]);
        },
      ),
    );
  }

  /// 월(month) 표시 라벨 위젯
  Widget _monthSeparator(BuildContext context, DateTime date) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Text(
        '${date.month}월',
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: vrc(context).contentText,
        ),
      ),
    );
  }

  /// 날짜 탭 위젯
  Widget _dateItem(BuildContext context, DateTime date) {
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
          color: isSelected ? fxc(context).brandColor : vrc(context).surface,
          shape: BoxShape.circle,
          border: Border.all(
            color: isSelected ? fxc(context).brandColor! : vrc(context).border!,
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
                color: isSelected ? Colors.white : vrc(context).contentText,
              ),
            ),
            Text(
              _getWeekdayName(date),
              style: TextStyle(
                fontSize: 12,
                color: isSelected ? Colors.white : vrc(context).detailText,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

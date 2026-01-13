import 'package:damta/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class MonthSelector extends HookWidget {
  const MonthSelector({
    super.key,
    required this.availableMonths,
    required this.selectedYear,
    required this.selectedMonth,
    required this.onMonthSelected,
  });

  final List<DateTime> availableMonths;
  final int selectedYear;
  final int selectedMonth;
  final Function(int year, int month) onMonthSelected;

  @override
  Widget build(BuildContext context) {
    if (availableMonths.isEmpty) {
      return const SizedBox.shrink();
    }

    final scrollController = useScrollController();

    // 빌드 후 현재 선택된 달 위치로 스크롤
    useEffect(() {
      // 선택된 달의 index 찾기
      final index = availableMonths.indexWhere(
        (m) => m.year == selectedYear && m.month == selectedMonth,
      );
      if (index == -1) return null;

      WidgetsBinding.instance.addPostFrameCallback((_) async {
        const itemWidth = 56.0; // 아이템 width
        const separatorWidth = 8.0; // margin 간격
        final targetOffset = index * (itemWidth + separatorWidth);
        // 자연스럽게 이동하고 싶으면 animateTo, 바로 가려면 jumpTo
        // scrollController.jumpTo(targetOffset);
        scrollController.animateTo(
          targetOffset,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      });
      return null;
    }, [availableMonths, selectedYear, selectedMonth]);

    return SizedBox(
      height: 80,
      child: ListView.builder(
        controller: scrollController,
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        itemCount: availableMonths.length,
        itemBuilder: (context, index) {
          final month = availableMonths[index];
          return _monthItem(context, month);
        },
      ),
    );
  }

  Widget _monthItem(BuildContext context, DateTime month) {
    final isSelected = month.year == selectedYear && month.month == selectedMonth;

    return GestureDetector(
      onTap: () => onMonthSelected(month.year, month.month),
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
            SizedBox(height: 1),
            Text(
              '${month.month}월',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: isSelected ? Colors.white : vrc(context).contentText,
              ),
            ),
            SizedBox(height: 1),
          ],
        ),
      ),
    );
  }
}

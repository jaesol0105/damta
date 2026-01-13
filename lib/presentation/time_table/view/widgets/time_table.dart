import 'package:damta/presentation/time_table/view_model/time_table_view_model.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:damta/core/theme/app_theme.dart';

class TimeTable extends ConsumerWidget {
  final String officeCode;
  final String schoolCode;

  const TimeTable({
    super.key,
    required this.officeCode,
    required this.schoolCode,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncState = ref.watch(
      timeTableViewModelProvider(
        officeCode: officeCode,
        schoolCode: schoolCode,
      ),
    );

    return asyncState.when(
      data: (state) {
        final monday = state.currentMonday;
        final weekdays = List.generate(5, (i) => monday.add(Duration(days: i)));
        final labels = ["월", "화", "수", "목", "금"];
        final periods = [1, 2, 3, 4, 5, 6, 7];

        return LayoutBuilder(
          builder: (context, c) {
            final dayWidth = (c.maxWidth - 50) / 5;

            return Column(
              children: [
                // 요일 헤더
                Row(
                  children: [
                    const SizedBox(width: 50),
                    for (int i = 0; i < 5; i++)
                      SizedBox(
                        width: dayWidth,
                        height: 40,
                        child: Center(
                          child: Text(
                            labels[i],
                            style: TextStyle(color: darkgrey),
                          ),
                        ),
                      ),
                  ],
                ),

                // 교시 + 수업 내용
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // 교시 열
                    Column(
                      children: periods
                          .map(
                            (p) => Container(
                              width: 50,
                              height: 70,
                              alignment: Alignment.center,
                              child: Text("$p교시"),
                            ),
                          )
                          .toList(),
                    ),

                    // 각 요일 열
                    for (int i = 0; i < 5; i++)
                      Column(
                        children: periods.map((period) {
                          final day = weekdays[i];
                          final items = state.filtered.where(
                            (e) =>
                                e.period == period &&
                                e.date.year == day.year &&
                                e.date.month == day.month &&
                                e.date.day == day.day,
                          );

                          if (items.isEmpty) {
                            return Container(
                              width: dayWidth,
                              height: 70,
                              decoration: BoxDecoration(
                                border: Border.all(color: grey),
                              ),
                            );
                          }

                          final subject = items.first.subject;

                          return Container(
                            width: dayWidth,
                            height: 70,
                            padding: const EdgeInsets.all(8),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: blue,
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Text(
                              subject,
                              style: const TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          );
                        }).toList(),
                      ),
                  ],
                ),
              ],
            );
          },
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, st) => Center(child: Text('오류: $e')),
    );
  }
}

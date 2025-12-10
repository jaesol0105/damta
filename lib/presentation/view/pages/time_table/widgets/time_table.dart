import 'package:damta/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:damta/presentation/view/pages/time_table/time_table_page.dart';

class TimeTable extends StatelessWidget {
  TimeTable({super.key});

  // TODO: 더미데이터 지우기
  final List<TableEntity> dummy = [
    TableEntity(
      year: 2024,
      semester: 1,
      grade: 2,
      classes: 3,
      weekday: 1, // 월요일
      period: 1,
      subject: "국어",
    ),
    TableEntity(
      year: 2024,
      semester: 1,
      grade: 2,
      classes: 3,
      weekday: 3, // 수요일
      period: 3,
      subject: "영어",
    ),
    TableEntity(
      year: 2024,
      semester: 1,
      grade: 2,
      classes: 3,
      weekday: 5, // 금요일
      period: 5,
      subject: "수학",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final days = ["월", "화", "수", "목", "금"];
    final periods = List.generate(7, (i) => i + 1); // 7교시까지

    // 요일 기반 매핑
    Map<int, List<TableEntity>> timetable = {for (int i = 1; i <= 5; i++) i: []};

    for (final e in dummy) {
      timetable[e.weekday]!.add(e);
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        final dayWidth = (constraints.maxWidth - 50) / 5;
        const double periodHeight = 70;

        return Column(
          children: [
            // 요일
            Row(
              children: [
                const SizedBox(width: 50),
                for (final d in days)
                  Container(
                    width: dayWidth,
                    height: 40,
                    alignment: Alignment.center,
                    child: Text(d, style: TextStyle(color: darkgrey)),
                  ),
              ],
            ),

            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 교시
                Column(
                  children: [
                    for (final p in periods)
                      Container(
                        width: 50,
                        height: periodHeight,
                        alignment: Alignment.center,
                        child: Text("$p교시", style: TextStyle(color: darkgrey)),
                      ),
                  ],
                ),

                // 과목
                for (int weekday = 1; weekday <= 5; weekday++)
                  Column(
                    children: [
                      for (final period in periods)
                        Container(
                          width: dayWidth,
                          height: periodHeight,
                          decoration: BoxDecoration(border: Border.all(color: grey)),
                          child: (() {
                            final events = timetable[weekday]!
                                .where((e) => e.period == period)
                                .toList();

                            if (events.isEmpty) return const SizedBox();

                            return Container(
                              alignment: Alignment.center,
                              margin: const EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                color: Colors.lightBlue.shade100,
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Text(
                                events.first.subject,
                                style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
                              ),
                            );
                          })(),
                        ),
                    ],
                  ),
              ],
            ),
          ],
        );
      },
    );
  }
}

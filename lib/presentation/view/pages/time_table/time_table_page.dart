import 'package:damta/core/theme/app_theme.dart';
import 'package:damta/presentation/view/pages/time_table/widgets/choose_class.dart';
import 'package:damta/presentation/view/pages/time_table/widgets/choose_semester.dart';

import 'package:damta/presentation/view/pages/time_table/widgets/time_table.dart';
import 'package:flutter/material.dart';

// Entity 로 빼기
class TableEntity {
  const TableEntity({
    required this.year,
    required this.semester,
    required this.grade,
    required this.classes,
    required this.weekday,
    required this.period,
    required this.subject,
  });

  final int year; // 학년도
  final int semester; // 학기
  final int grade; // 학년
  final int classes; // 반
  final int weekday; // 요일 (1=월, 2=화, 3=수, 4=목, 5=금)
  final int period; // 교시
  final String subject; // 과목
}

class TimeTablePage extends StatelessWidget {
  const TimeTablePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back, color: darkgrey),
        title: SizedBox(
          width: double.infinity,
          child: Text('도장중학교', style: TextStyle(fontSize: 18)),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: darkgrey),
              borderRadius: BorderRadius.circular(8),
            ),
            width: double.infinity,
            child: Column(
              children: [
                Container(
                  constraints: BoxConstraints(minHeight: 110),
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        children: [
                          Text("시간표", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                          Spacer(),
                          ChooseSemester(),
                        ],
                      ),
                      Row(children: [Spacer(), ChooseClass()]),
                    ],
                  ),
                ),
                Divider(color: darkgrey),
                TimeTable(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:damta/core/theme/app_theme.dart';
import 'package:damta/domain/entity/schedule_entity.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ScheduleCard extends StatelessWidget {
  const ScheduleCard({super.key, required this.date, required this.schedules});

  final DateTime date;
  final List<ScheduleEntity> schedules;

  String _getWeekdayName(DateTime date) {
    const weekdays = ['월', '화', '수', '목', '금', '토', '일'];
    return weekdays[date.weekday - 1];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),

      decoration: BoxDecoration(
        color: vrc(context).surface,
        border: Border.all(color: vrc(context).border!),
        borderRadius: BorderRadius.circular(16),
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                DateFormat('M/d').format(date),
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: vrc(context).labelText,
                ),
              ),
              const SizedBox(width: 4),
              Text(
                '(${_getWeekdayName(date)})',
                style: TextStyle(fontSize: 16, color: vrc(context).detailText),
              ),
            ],
          ),
          const SizedBox(height: 12),
          ...schedules.map(
            (schedule) => Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('• ', style: TextStyle(fontSize: 16, color: vrc(context).contentText)),
                  Expanded(
                    child: RichText(
                      text: TextSpan(
                        style: TextStyle(
                          fontSize: 16,
                          color: vrc(context).contentText,
                          height: 1.4,
                        ),
                        children: [
                          TextSpan(text: schedule.eventName),
                          if (schedule.gradeText != null)
                            TextSpan(
                              text: ' ${schedule.gradeText}',
                              style: TextStyle(fontSize: 14, color: vrc(context).detailText),
                            ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

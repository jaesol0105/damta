import 'package:damta/presentation/view_model/time_table_view_model.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ChooseWeek extends ConsumerWidget {
  final String officeCode;
  final String schoolCode;

  const ChooseWeek({
    super.key,
    required this.officeCode,
    required this.schoolCode,
  });

  String format(DateTime d) {
    final yy = (d.year % 100).toString().padLeft(2, '0');
    final mm = d.month.toString().padLeft(2, '0');
    final dd = d.day.toString().padLeft(2, '0');
    return "$yy.$mm.$dd";
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncState = ref.watch(
      timeTableViewModelProvider(
        officeCode: officeCode,
        schoolCode: schoolCode,
      ),
    );

    final state = asyncState.value;
    if (state == null) return const SizedBox();

    final monday = state.currentMonday;
    final friday = monday.add(const Duration(days: 4));

    return Row(
      children: [
        InkWell(
          onTap: () {
            ref
                .read(
                  timeTableViewModelProvider(
                    officeCode: officeCode,
                    schoolCode: schoolCode,
                  ).notifier,
                )
                .prevWeek(officeCode: officeCode, schoolCode: schoolCode);
          },
          child: const Text(" <  ", style: TextStyle(fontSize: 22)),
        ),
        SizedBox(
          width: 160,
          child: Text(
            "${format(monday)} ~ ${format(friday)}",
            style: const TextStyle(fontSize: 16),
            textAlign: TextAlign.center,
          ),
        ),
        InkWell(
          onTap: () {
            ref
                .read(
                  timeTableViewModelProvider(
                    officeCode: officeCode,
                    schoolCode: schoolCode,
                  ).notifier,
                )
                .nextWeek(officeCode: officeCode, schoolCode: schoolCode);
          },
          child: const Text("  > ", style: TextStyle(fontSize: 22)),
        ),
      ],
    );
  }
}

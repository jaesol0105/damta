import 'package:damta/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ChooseSemester extends HookConsumerWidget {
  const ChooseSemester({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final year = useState(DateTime.now().year);
    final semester = useState(1);

    void goPrev() {
      if (semester.value == 1) {
        year.value -= 1;
        semester.value = 2;
      } else {
        semester.value -= 1;
      }
    }

    void goNext() {
      if (semester.value == 2) {
        year.value += 1;
        semester.value = 1;
      } else {
        semester.value += 1;
      }
    }

    final label = "${year.value}학년도 ${semester.value}학기";

    return Row(
      children: [
        InkWell(
          onTap: goPrev,
          child: Text("< ", style: TextStyle(fontSize: 20, color: darkgrey)),
        ),
        SizedBox(
          width: 140,
          child: Text(label, style: TextStyle(fontSize: 16), textAlign: TextAlign.center),
        ),
        InkWell(
          onTap: goNext,
          child: Text(" >", style: TextStyle(fontSize: 20, color: darkgrey)),
        ),
      ],
    );
  }
}

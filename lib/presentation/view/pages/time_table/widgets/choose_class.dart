import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ChooseClass extends HookConsumerWidget {
  const ChooseClass({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedClass = useState("1-1");

    // 반 목록 생성
    List<DropdownMenuItem<String>> buildClassList() {
      List<String> list = [];
      for (int g = 1; g <= 3; g++) {
        for (int c = 1; c <= 10; c++) {
          list.add("$g-$c");
        }
      }
      return list
          .map((e) => DropdownMenuItem(value: e, child: Text(e)))
          .toList();
    }

    return SizedBox(
      width: 90,
      height: 30,
      child: InputDecorator(
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(left: 12),
          filled: true,
          fillColor: Colors.white,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Colors.grey),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Colors.grey),
          ),
        ),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            value: selectedClass.value,
            isExpanded: true,
            menuMaxHeight: 500,
            items: buildClassList(),
            onChanged: (value) {
              if (value == null) return;
              selectedClass.value = value;
            },
          ),
        ),
      ),
    );
  }
}

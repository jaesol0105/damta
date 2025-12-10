import 'package:damta/presentation/view_model/time_table_view_model.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ChooseClass extends ConsumerWidget {
  final String officeCode;
  final String schoolCode;

  const ChooseClass({
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
      // 데이터 있을 때
      data: (state) {
        return SizedBox(
          width: 90,
          height: 30,
          child: Container(
            padding: const EdgeInsets.only(left: 12),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(8),
            ),
            child: DropdownButton<String>(
              value: state.selectedClass,
              items: state.classList
                  .map(
                    (e) => DropdownMenuItem(
                      value: e,
                      child: Text(e, style: const TextStyle(fontSize: 14)),
                    ),
                  )
                  .toList(),
              onChanged: (v) {
                if (v != null) {
                  // notifier로 반 변경
                  ref
                      .read(
                        timeTableViewModelProvider(
                          officeCode: officeCode,
                          schoolCode: schoolCode,
                        ).notifier,
                      )
                      .changeClass(
                        v,
                        officeCode: officeCode,
                        schoolCode: schoolCode,
                      );
                }
              },
              isExpanded: true, // 텍스트가 잘리지 않도록
              underline: const SizedBox(), // 밑줄 제거
              icon: const Icon(Icons.arrow_drop_down), // 기본 드롭다운 아이콘
            ),
          ),
        );
      },
      // 로딩 상태
      loading: () => const SizedBox(
        width: 90,
        height: 30,
        child: Center(child: CircularProgressIndicator(strokeWidth: 2)),
      ),
      // 에러 상태
      error: (e, st) => SizedBox(
        width: 90,
        height: 30,
        child: Center(
          child: Text('에러', style: TextStyle(color: Colors.red, fontSize: 12)),
        ),
      ),
    );
  }
}

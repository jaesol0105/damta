import 'package:damta/core/theme/app_theme.dart';
import 'package:damta/presentation/time_table/view/widgets/choose_class.dart';
import 'package:damta/presentation/time_table/view/widgets/choose_week.dart';
import 'package:damta/presentation/time_table/view/widgets/time_table.dart';
import 'package:damta/presentation/time_table/view/widgets/time_table_shimmer.dart';
import 'package:damta/presentation/time_table/view_model/time_table_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class TimeTablePage extends ConsumerWidget {
  const TimeTablePage({super.key});

  // TODO : 더미데이터 지우기
  final officeCode = 'J10';
  final schoolCode = '7642041';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(
      timeTableViewModelProvider(
        officeCode: officeCode,
        schoolCode: schoolCode,
      ),
    );

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: darkgrey),
          onPressed: () => context.pop(),
        ),
      ),
      body: state.when(
        data: (timeTableState) =>
            _timeTableContent(context, ref, timeTableState),
        loading: () => const TimeTableShimmer(),
        error: (error, stackTrace) => _timeTableError(context, ref, error),
      ),
    );
  }

  Widget _timeTableContent(
    BuildContext context,
    WidgetRef ref,
    TimeTableState state,
  ) {
    return SingleChildScrollView(
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
                constraints: const BoxConstraints(minHeight: 110),
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      children: [
                        const Text(
                          "시간표",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        const Spacer(),
                        ChooseWeek(
                          officeCode: officeCode,
                          schoolCode: schoolCode,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Spacer(),
                        ChooseClass(
                          officeCode: officeCode,
                          schoolCode: schoolCode,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Divider(color: darkgrey),
              TimeTable(officeCode: officeCode, schoolCode: schoolCode),
            ],
          ),
        ),
      ),
    );
  }

  Widget _timeTableError(BuildContext context, WidgetRef ref, Object error) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.error_outline, size: 48, color: Colors.grey),
          const SizedBox(height: 16),
          const Text(
            '시간표를 불러오는데 실패했습니다',
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              ref
                  .read(
                    timeTableViewModelProvider(
                      officeCode: officeCode,
                      schoolCode: schoolCode,
                    ).notifier,
                  )
                  .loadTimeTables(
                    officeCode: officeCode,
                    schoolCode: schoolCode,
                  );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFA7D7FE),
              foregroundColor: Colors.white,
            ),
            child: const Text('다시 시도'),
          ),
        ],
      ),
    );
  }
}

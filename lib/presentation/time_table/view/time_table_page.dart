import 'package:damta/core/theme/app_theme.dart';
import 'package:damta/presentation/time_table/view/widgets/choose_class.dart';
import 'package:damta/presentation/time_table/view/widgets/choose_week.dart';
import 'package:damta/presentation/time_table/view/widgets/time_table.dart';
import 'package:damta/presentation/time_table/view/widgets/time_table_shimmer.dart';
import 'package:damta/presentation/time_table/view_model/time_table_view_model.dart';
import 'package:damta/presentation/ui_provider/users_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class TimeTablePage extends ConsumerWidget {
  const TimeTablePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // user 불러오기
    final userAsync = ref.watch(userProvider);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: darkgrey),
          onPressed: () => context.pop(),
        ),
      ),
      body: userAsync.when(
        loading: () => const TimeTableShimmer(),
        error: (e, _) => _timeTableError(context, ref, e),
        data: (user) {
          // user 에 저장된 officeCode, schoolCode 가져오기
          final officeCode = user.officeCode ?? 'J10';
          final schoolCode = user.schoolCode ?? '7642041';
          print('🩷 시간표 : $officeCode, $schoolCode, ${user.schoolName}');

          final state = ref.watch(
            timeTableViewModelProvider(
              officeCode: officeCode,
              schoolCode: schoolCode,
            ),
          );

          return state.when(
            loading: () => const TimeTableShimmer(),
            error: (e, _) => _timeTableError(context, ref, e),
            data: (timeTableState) => _timeTableContent(
              context,
              ref,
              timeTableState,
              officeCode,
              schoolCode,
            ),
          );
        },
      ),
    );
  }

  Widget _timeTableContent(
    BuildContext context,
    WidgetRef ref,
    TimeTableState state,
    String officeCode,
    String schoolCode,
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
              ref.invalidate(userProvider);
            },
            child: const Text('다시 시도'),
          ),
        ],
      ),
    );
  }
}

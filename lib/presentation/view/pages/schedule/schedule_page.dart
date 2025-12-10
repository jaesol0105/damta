import 'package:damta/core/theme/app_theme.dart';
import 'package:damta/presentation/view/pages/schedule/widgets/month_selector.dart';
import 'package:damta/presentation/view/pages/schedule/widgets/schedule_card.dart';
import 'package:damta/presentation/view/pages/schedule/widgets/schedule_shimmer.dart';
import 'package:damta/presentation/view_model/schedule_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class SchedulePage extends ConsumerWidget {
  const SchedulePage({super.key});

  final officeCode = 'P10';
  final schoolCode = '8321175';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scheduleState = ref.watch(
      scheduleViewModelProvider(officeCode: officeCode, schoolCode: schoolCode),
    );

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back), // 백 버튼
          onPressed: () => context.pop(),
        ),
      ),

      body: scheduleState.when(
        data: (state) => _scheduleContent(context, ref, state),
        loading: () => const ScheduleShimmer(),
        error: (error, stackTrace) => _scheduleError(context, ref),
      ),
    );
  }

  Widget _scheduleContent(BuildContext context, WidgetRef ref, ScheduleState state) {
    final groupedSchedules = state.groupedSchedulesByDateExcludingWeekends;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Text('학사 일정', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600)),
        ),
        const SizedBox(height: 18),
        MonthSelector(
          availableMonths: state.displayableMonths,
          selectedYear: state.selectedYear,
          selectedMonth: state.selectedMonth,
          onMonthSelected: (year, month) {
            ref
                .read(
                  scheduleViewModelProvider(
                    officeCode: officeCode,
                    schoolCode: schoolCode,
                  ).notifier,
                )
                .selectMonth(year, month);
          },
        ),
        const SizedBox(height: 20),
        groupedSchedules.isEmpty
            ? Expanded(
                child: Center(
                  child: Text(
                    '해당 월에 학사일정이 없습니다',
                    style: TextStyle(fontSize: 16, color: vrc(context).detailText),
                  ),
                ),
              )
            : Expanded(
                child: ListView.separated(
                  padding: const EdgeInsets.only(left: 16, right: 16, bottom: 60, top: 10),
                  itemCount: groupedSchedules.length,
                  separatorBuilder: (context, index) => const SizedBox(height: 20),
                  itemBuilder: (context, index) {
                    final date = groupedSchedules.keys.elementAt(index);
                    final schedules = groupedSchedules[date]!;
                    return ScheduleCard(date: date, schedules: schedules);
                  },
                ),
              ),
      ],
    );
  }

  Widget _scheduleError(BuildContext context, WidgetRef ref) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.error_outline, size: 48, color: vrc(context).errorText),
          const SizedBox(height: 16),
          Text('학사일정을 불러오는데 실패했습니다', style: TextStyle(fontSize: 16, color: vrc(context).errorText)),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              ref
                  .read(
                    scheduleViewModelProvider(
                      officeCode: officeCode,
                      schoolCode: schoolCode,
                    ).notifier,
                  )
                  .reload();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: fxc(context).brandColor,
              foregroundColor: Colors.white,
            ),
            child: const Text('다시 시도'),
          ),
        ],
      ),
    );
  }
}

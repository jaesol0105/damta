import 'package:damta/core/theme/app_theme.dart';
import 'package:damta/presentation/ui_provider/users_provider.dart';
import 'package:damta/presentation/schedule/view/widgets/month_selector.dart';
import 'package:damta/presentation/schedule/view/widgets/schedule_card.dart';
import 'package:damta/presentation/schedule/view/widgets/schedule_shimmer.dart';
import 'package:damta/presentation/schedule/view_model/schedule_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class SchedulePage extends ConsumerWidget {
  const SchedulePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // user 불러오기
    final userAsync = ref.watch(userProvider);

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
      ),
      body: userAsync.when(
        loading: () => const ScheduleShimmer(),
        error: (e, _) => Center(child: Text(e.toString())),
        data: (user) {
          // user 에 저장된 officeCode, schoolCode 가져오기
          final officeCode = user.officeCode ?? 'J10';
          final schoolCode = user.schoolCode ?? '7642041';
          print('🩷 학사 일정 : $officeCode, $schoolCode, ${user.schoolName}');

          final scheduleAsync = ref.watch(
            scheduleViewModelProvider(
              officeCode: officeCode,
              schoolCode: schoolCode,
            ),
          );

          return scheduleAsync.when(
            loading: () => const ScheduleShimmer(),
            error: (e, _) =>
                _scheduleError(context, ref, officeCode, schoolCode),
            data: (state) =>
                _scheduleContent(context, ref, state, officeCode, schoolCode),
          );
        },
      ),
    );
  }

  Widget _scheduleContent(
    BuildContext context,
    WidgetRef ref,
    ScheduleState state,
    String officeCode,
    String schoolCode,
  ) {
    final groupedSchedules = state.groupedSchedulesByDateExcludingWeekends;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            '학사 일정',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
          ),
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
                    style: TextStyle(
                      fontSize: 16,
                      color: vrc(context).detailText,
                    ),
                  ),
                ),
              )
            : Expanded(
                child: ListView.separated(
                  padding: const EdgeInsets.only(
                    left: 16,
                    right: 16,
                    bottom: 60,
                    top: 10,
                  ),
                  itemCount: groupedSchedules.length,
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 20),
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

  Widget _scheduleError(
    BuildContext context,
    WidgetRef ref,
    String officeCode,
    String schoolCode,
  ) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.error_outline, size: 48, color: vrc(context).errorText),
          const SizedBox(height: 16),
          Text(
            '학사일정을 불러오는데 실패했습니다',
            style: TextStyle(fontSize: 16, color: vrc(context).errorText),
          ),
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

import 'package:damta/core/theme/app_theme.dart';
import 'package:damta/presentation/home/view/widgets/modules/shared/mini_card.dart';
import 'package:damta/presentation/home/view/widgets/modules/shared/more_button.dart';
import 'package:damta/presentation/ui_provider/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class ScheduleModule extends ConsumerWidget {
  /// 학사일정 모듈
  const ScheduleModule({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scheduleAsync = ref.watch(scheduleForCurrentUserProvider);

    return MiniCard(
      icon: 'assets/icons/icon_schedule.png',
      bottomLabelColor: const Color(0xFF1A1A1A),
      title: '  학사일정',
      trailing: MoreButton(onTap: () => context.push('/schedule')),
      child: scheduleAsync.when(
        loading: () => const _ScheduleText(text: '로딩 중...'),
        error: (_, __) => const _ScheduleText(text: '불러오기 실패'),
        data: (state) {
          final lines = state.weekScheduleLines;
          return lines.isEmpty
              ? Text(
                  '이번주 학사일정이 없습니다',
                  style: TextStyle(
                    height: 1.25,
                    fontSize: 12.5,
                    fontWeight: FontWeight.w500,
                    color: vrc(context).detailText,
                  ),
                )
              : _ScheduleText(text: lines.join('\n'));
        },
      ),
    );
  }
}

class _ScheduleText extends StatelessWidget {
  const _ScheduleText({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 4),
      child: Text(
        text,
        style: TextStyle(
          height: 1.25,
          fontSize: 12.5,
          fontWeight: FontWeight.w500,
          color: vrc(context).labelText,
        ),
      ),
    );
  }
}

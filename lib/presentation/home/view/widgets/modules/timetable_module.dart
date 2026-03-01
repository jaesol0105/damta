import 'package:damta/core/theme/app_theme.dart';
import 'package:damta/presentation/home/view/widgets/shared/mini_card.dart';
import 'package:damta/presentation/home/view/widgets/shared/more_button.dart';
import 'package:damta/presentation/home/view_model/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class TimetableModule extends ConsumerWidget {
  /// 시간표 모듈
  const TimetableModule({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ttAsync = ref.watch(timetableForCurrentUserProvider);

    return ttAsync.when(
      loading: () =>
          _buildCard(context, child: const _TimetableText(items: ['로딩 중...'])),
      error: (_, __) =>
          _buildCard(context, child: const _TimetableText(items: ['불러오기 실패'])),
      data: (state) {
        final cols = state.todayColumns;

        Widget body;
        if (cols.col1.isEmpty && cols.col2.isEmpty) {
          body = Text(
            '시간표 정보가 없습니다',
            style: TextStyle(
              height: 1.25,
              fontSize: 12.5,
              fontWeight: FontWeight.w500,
              color: vrc(context).detailText,
            ),
          );
        } else if (cols.col1.isEmpty) {
          body = _TimetableText(items: cols.col2);
        } else if (cols.col2.isEmpty) {
          body = _TimetableText(items: cols.col1);
        } else {
          body = Padding(
            padding: const EdgeInsets.only(left: 4),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 두 줄로 출력
                _TimetableText(items: cols.col1),
                const SizedBox(width: 12),
                _TimetableText(items: cols.col2),
              ],
            ),
          );
        }

        return _buildCard(
          context,
          bottomLabel: state.selectedClass,
          child: body,
        );
      },
    );
  }

  Widget _buildCard(
    BuildContext context, {
    required Widget child,
    String? bottomLabel,
  }) {
    return Builder(
      builder: (ctx) => MiniCard(
        icon: 'assets/icons/icon_timetable.png',
        bottomLabelColor: const Color(0xFFFFA726),
        title: '시간표',
        trailing: MoreButton(onTap: () => ctx.push('/timetable')),
        bottomLabel: bottomLabel,
        child: child,
      ),
    );
  }
}

class _TimetableText extends StatelessWidget {
  const _TimetableText({required this.items});

  final List<String> items;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 0),
      child: Text(
        items.join('\n'),
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

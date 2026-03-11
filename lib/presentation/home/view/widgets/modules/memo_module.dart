import 'package:damta/core/theme/app_theme.dart';
import 'package:damta/presentation/home/view/widgets/modules/shared/mini_card.dart';
import 'package:damta/presentation/home/view/widgets/modules/shared/more_button.dart';
import 'package:damta/presentation/memo/view_model/memo_view_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MemoModule extends ConsumerWidget {
  /// 메모 모듈
  const MemoModule({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final memoAsync = ref.watch(memoViewModelProvider);

    return MiniCard(
      icon: 'assets/icons/icon_memo.png',
      title: ' 메모',
      trailing: MoreButton(onTap: () => context.push('/memo')),
      child: memoAsync.when(
        loading: () => const _MemoText(text: ''),
        error: (_, __) => const _MemoText(text: ''),
        data: (content) => _MemoText(text: content),
      ),
    );
  }
}

class _MemoText extends StatelessWidget {
  const _MemoText({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    if (text.isEmpty) {
      return Padding(
        padding: const EdgeInsets.only(left: 4),
        child: Text(
          '메모가 없습니다',
          style: TextStyle(
            height: 1.25,
            fontSize: 12.5,
            fontWeight: FontWeight.w500,
            color: vrc(context).detailText,
          ),
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.only(left: 4),
      child: Text(
        text,
        maxLines: 7,
        overflow: TextOverflow.ellipsis,
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

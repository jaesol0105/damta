import 'package:damta/core/theme/app_theme.dart';
import 'package:damta/core/util/string_util.dart';
import 'package:damta/domain/entity/post_entity.dart';
import 'package:damta/presentation/home/view/widgets/modules/shared/big_card.dart';
import 'package:damta/presentation/home/view/widgets/modules/shared/more_button.dart';
import 'package:damta/presentation/post/view_model/post_view_model.dart';
import 'package:damta/presentation/ui_provider/users_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class AnonBoardModule extends ConsumerWidget {
  /// 익명게시판 모듈
  const AnonBoardModule({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 학교명 줄이기
    final schoolShort = ref
        .watch(userProvider)
        .when(
          data: (user) => abbreviateSchoolName(user.schoolName!),
          loading: () => '',
          error: (_, __) => '',
        );

    // 게시글 3개
    final posts = ref.watch(postViewModelProvider).take(3).toList();

    return BigCard(
      icon: 'assets/icons/icon_anon_board.png',
      title: ' $schoolShort 익명 게시판',
      trailing: MoreButton(onTap: () => context.push('/post')),
      child: _AnonBoardBody(posts: posts),
    );
  }
}

class _AnonBoardBody extends StatelessWidget {
  /// 익명게시판 모듈 바디
  const _AnonBoardBody({required this.posts});

  final List<PostEntity> posts;

  @override
  Widget build(BuildContext context) {
    // 게시글 없음
    if (posts.isEmpty) {
      return Padding(
        padding: EdgeInsets.only(left: 4),
        child: Text(
          '게시글이 없습니다',
          style: TextStyle(
            fontSize: 12.5,
            fontWeight: FontWeight.w500,
            color: vrc(context).detailText,
          ),
        ),
      );
    }
    // 게시글 있음
    return Column(
      children: [
        for (int i = 0; i < posts.length; i++) ...[
          _BoardPill(
            text: posts[i].pTitle,
            onTap: () => context.push('/post/${posts[i].pId}'),
          ),
          if (i < posts.length - 1) const SizedBox(height: 8),
        ],
      ],
    );
  }
}

class _BoardPill extends StatelessWidget {
  /// 익명게시판 색채우기
  const _BoardPill({required this.text, required this.onTap});

  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        decoration: BoxDecoration(
          color: vrc(context).modulePostBg,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: vrc(context).moduleBorder!),
        ),
        child: Text(
          text,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontSize: 12.5,
            fontWeight: FontWeight.w700,
            color: vrc(context).labelText,
          ),
        ),
      ),
    );
  }
}

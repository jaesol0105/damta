import 'dart:io';

import 'package:damta/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

class EmojiReactionSection extends StatelessWidget {
  /// 이모지 반응 섹션 (슬랙처럼 그룹화 + 카운트 표시)
  const EmojiReactionSection({
    super.key,
    required this.reactions, // 본 게시글의 반응 목록
    required this.currentUId, // 현재 사용자 uid
    required this.onTapEmoji, // 개별 이모지 탭 콜백
    required this.onTogglePicker, // emoji_picker 콜백
  });

  final Map<String, String>? reactions;
  final String? currentUId;
  final void Function(String emoji, bool isHighlighted) onTapEmoji;
  final VoidCallback onTogglePicker;

  @override
  Widget build(BuildContext context) {
    // 이모지별 카운트 + 첫 반응 시각 집계
    // reactions (key: userId_emoji 형태, value: timestamp 형식)
    final grouped = <String, int>{};
    final firstTime = <String, int>{};
    for (final entry in reactions?.entries ?? <MapEntry<String, String>>[]) {
      final sep = entry.key.indexOf('_');
      if (sep < 0) continue;
      final emoji = entry.key.substring(sep + 1);
      final ts = int.tryParse(entry.value) ?? 0;
      grouped[emoji] = (grouped[emoji] ?? 0) + 1;
      if (!firstTime.containsKey(emoji) || ts < firstTime[emoji]!) {
        firstTime[emoji] = ts;
      }
    }

    // 첫 반응 시각 기준 오름차순 정렬
    final sortedEntries = grouped.entries.toList()
      ..sort(
        (a, b) => (firstTime[a.key] ?? 0).compareTo(firstTime[b.key] ?? 0),
      );

    // 현재 유저가 반응한 이모지 목록
    final myEmojis = (reactions ?? {}).entries
        .where((e) => currentUId != null && e.key.startsWith('${currentUId}_'))
        .map((e) => e.key.substring(e.key.indexOf('_') + 1))
        .toSet();

    return Wrap(
      spacing: 6,
      runSpacing: 6,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        // 이모지 추가 버튼
        InkWell(
          onTap: onTogglePicker,
          borderRadius: BorderRadius.circular(30),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: vrc(context).background,
              border: Border.all(color: vrc(context).border!, width: 1),
              borderRadius: BorderRadius.circular(30),
            ),
            child: HugeIcon(
              icon: HugeIcons.strokeRoundedHeartAdd,
              size: 24,
              color: vrc(context).detailText,
              strokeWidth: 2,
            ),
          ),
        ),
        // 그룹화된 이모지 버블
        ...sortedEntries.map((entry) {
          final isHighlighted = myEmojis.contains(entry.key);
          return _EmojiReactionBubble(
            emoji: entry.key,
            count: entry.value,
            isHighlighted: isHighlighted,
            onTap: () => onTapEmoji(entry.key, isHighlighted),
          );
        }),
      ],
    );
  }
}

class _EmojiReactionBubble extends StatelessWidget {
  /// 이모지 반응 버블
  const _EmojiReactionBubble({
    required this.emoji, // 이모지
    required this.count, // 개수
    required this.isHighlighted, // 하이라이트
    required this.onTap, // 탭 콜백
  });

  final String emoji;
  final int count;
  final bool isHighlighted;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(30),
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
        decoration: BoxDecoration(
          color: isHighlighted
              ? Theme.of(context).colorScheme.primary.withOpacity(0.12)
              : vrc(context).background,
          border: Border.all(color: vrc(context).border!, width: 1),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              emoji,
              style: TextStyle(
                fontSize: 18,
                fontFamily: Platform.isAndroid ? 'NotoColorEmoji' : null,
              ),
            ),
            if (count >= 1) ...[
              const SizedBox(width: 4),
              Text(
                '$count',
                style: TextStyle(
                  fontSize: 13,
                  color: isHighlighted
                      ? Theme.of(context).colorScheme.primary
                      : null,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

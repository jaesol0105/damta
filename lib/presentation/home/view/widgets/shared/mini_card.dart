import 'package:damta/presentation/home/view/widgets/shared/card_header.dart';
import 'package:damta/presentation/home/view/widgets/shared/card_shell.dart';
import 'package:flutter/material.dart';

class MiniCard extends StatelessWidget {
  /// 작은 모듈
  const MiniCard({
    super.key,
    required this.icon,
    required this.title,
    required this.child,
    this.bottomLabelColor = const Color(0xFF1A1A1A),
    this.trailing,
    this.bottomLabel,
  });

  final String icon;
  final Color bottomLabelColor;
  final String title;
  final Widget child;
  final Widget? trailing;
  final String? bottomLabel;

  @override
  Widget build(BuildContext context) {
    return CardShell(
      padding: const EdgeInsets.fromLTRB(14, 12, 14, 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
          // 헤더
          CardHeader(icon: icon, title: title, trailing: trailing),
          const SizedBox(height: 10),
          // 내용
          Expanded(
            child: FittedBox(
              fit: BoxFit.scaleDown,
              alignment: Alignment.topLeft,
              child: child,
            ),
          ),
          if (bottomLabel != null) ...[
            const SizedBox(height: 8),
            // 바텀 라벨
            // 학년-반, 급식 분류 등 표시용도
            Align(
              alignment: Alignment.bottomRight,
              child: Container(
                margin: EdgeInsets.only(bottom: 3),
                padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 3),
                decoration: BoxDecoration(
                  color: bottomLabelColor.withOpacity(0.08),
                  border: Border.all(
                    color: bottomLabelColor.withOpacity(0.2),
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  bottomLabel!,
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w600,
                    color: bottomLabelColor.withOpacity(0.75),
                    letterSpacing: -0.3,
                  ),
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}

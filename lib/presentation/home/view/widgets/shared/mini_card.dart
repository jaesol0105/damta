import 'package:damta/presentation/home/view/widgets/shared/card_header.dart';
import 'package:damta/presentation/home/view/widgets/shared/card_shell.dart';
import 'package:flutter/material.dart';

class MiniCard extends StatelessWidget {
  const MiniCard({
    super.key,
    required this.icon,
    required this.title,
    required this.child,
    this.iconColor = const Color(0xFF1A1A1A),
    this.trailing,
    this.bottomLabel,
  });

  final String icon;
  final Color iconColor;
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
          CardHeader(
            icon: icon,
            iconColor: iconColor,
            title: title,
            trailing: trailing,
          ),
          const SizedBox(height: 10),
          child,
          if (bottomLabel != null) ...[
            const SizedBox(height: 6),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                bottomLabel!,
                style: const TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFFB0B8C1),
                  letterSpacing: -0.5,
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}

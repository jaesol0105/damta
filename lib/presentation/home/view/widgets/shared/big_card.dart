import 'package:damta/presentation/home/view/widgets/shared/card_header.dart';
import 'package:damta/presentation/home/view/widgets/shared/card_shell.dart';
import 'package:flutter/material.dart';

class BigCard extends StatelessWidget {
  const BigCard({
    super.key,
    required this.icon,
    required this.title,
    required this.child,
    this.trailing,
  });

  final String icon;
  final String title;
  final Widget child;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return CardShell(
      padding: const EdgeInsets.fromLTRB(14, 12, 14, 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CardHeader(
            icon: icon,
            iconColor: const Color(0xFF1A1A1A),
            title: title,
            trailing: trailing,
          ),
          const SizedBox(height: 10),
          child,
        ],
      ),
    );
  }
}

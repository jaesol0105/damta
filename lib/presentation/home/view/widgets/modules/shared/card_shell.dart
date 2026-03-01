import 'package:damta/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

class CardShell extends StatelessWidget {
  /// 모듈 틀
  const CardShell({super.key, required this.child, required this.padding});

  final Widget child;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        color: vrc(context).surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: vrc(context).border!),
      ),
      child: child,
    );
  }
}

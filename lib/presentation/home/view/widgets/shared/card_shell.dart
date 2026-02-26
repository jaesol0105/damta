import 'package:damta/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

class CardShell extends StatelessWidget {
  const CardShell({super.key, required this.child, required this.padding});

  final Widget child;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      decoration: BoxDecoration(
        color: vrc(context).surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: vrc(context).border!),
        // boxShadow: const [
        //   BoxShadow(
        //     blurRadius: 10,
        //     offset: Offset(0, 6),
        //     color: Color(0x0A000000),
        //   ),
        // ],
      ),
      child: child,
    );
  }
}

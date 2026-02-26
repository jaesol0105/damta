import 'package:damta/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

class MoreButton extends StatelessWidget {
  const MoreButton({super.key, required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(10),
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 6),
        child: Transform.translate(
          offset: const Offset(0, 8),
          child: Row(
            children: [
              Text(
                '더보기',
                style: TextStyle(
                  fontSize: 12,
                  letterSpacing: -1,
                  fontWeight: FontWeight.w500,
                  color: vrc(context).contentText,
                ),
              ),
              Icon(
                Icons.chevron_right_rounded,
                size: 16,
                color: vrc(context).contentText,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

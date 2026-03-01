import 'package:flutter/material.dart';

class CardHeader extends StatelessWidget {
  /// 모듈용 헤더 (이미지 + 제목)
  const CardHeader({
    super.key,
    required this.icon,
    required this.title,
    this.trailing,
  });

  final String icon;
  final String title;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // 이미지
        Transform.translate(
          offset: const Offset(-1, 0),
          child: Image.asset(icon, height: 40, width: 40),
        ),
        const SizedBox(width: 6),
        // 제목
        Expanded(
          child: Transform.translate(
            offset: const Offset(-6, 6),
            child: FittedBox(
              fit: BoxFit.scaleDown,
              alignment: Alignment.centerLeft,
              child: Text(
                title,
                maxLines: 1,
                style: const TextStyle(
                  fontSize: 15,
                  letterSpacing: -1,
                  fontWeight: FontWeight.w800,
                  color: Color(0xFF1A1A1A),
                ),
              ),
            ),
          ),
        ),

        if (trailing != null) trailing!,
      ],
    );
  }
}

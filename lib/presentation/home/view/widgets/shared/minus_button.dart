import 'package:flutter/material.dart';

class MinusButton extends StatelessWidget {
  const MinusButton({super.key, required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 28,
        height: 28,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.85),
          shape: BoxShape.circle,
          border: Border.all(color: const Color(0xFFE5E5E5), width: 1),
          boxShadow: const [
            BoxShadow(
              blurRadius: 6,
              offset: Offset(0, 2),
              color: Color(0x22000000),
            ),
          ],
        ),
        child: const Center(
          child: Icon(Icons.close_rounded, size: 18, color: Color(0xFF555555)),
        ),
      ),
    );
  }
}

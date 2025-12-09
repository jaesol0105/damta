import 'package:damta/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

class MealCard extends StatelessWidget {
  const MealCard({
    super.key,
    required this.title,
    required this.emoji,
    required this.dishes,
    this.kcal,
  });

  final String title;
  final String emoji;
  final List<String> dishes;
  final String? kcal;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),

      decoration: BoxDecoration(
        color: vrc(context).surface,
        border: Border.all(
          color: vrc(context).border!, // 나중에 Theme에 위임
        ),
        borderRadius: BorderRadius.circular(16),
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(width: 8),
              Text(emoji, style: const TextStyle(fontSize: 18)),
            ],
          ),

          const SizedBox(height: 16),

          Text(
            dishes.join(', '),
            style: TextStyle(fontSize: 14, color: vrc(context).detailText, height: 1.5),
          ),

          if (kcal != null && kcal!.isNotEmpty) ...[
            const SizedBox(height: 16),
            Text(kcal!, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
          ],
        ],
      ),
    );
  }
}

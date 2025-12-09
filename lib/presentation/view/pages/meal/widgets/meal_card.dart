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
        color: Colors.white,
        border: Border.all(
          color: Colors.grey[300]!, // 나중에 Theme에 위임
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
            style: TextStyle(fontSize: 14, color: Colors.grey[600], height: 1.5),
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

import 'package:damta/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ScheduleShimmer extends StatelessWidget {
  const ScheduleShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 20),
        SizedBox(
          height: 80,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            itemCount: 7,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(right: 8),
                child: Shimmer.fromColors(
                  baseColor: vrc(context).border!,
                  highlightColor: vrc(context).border!,
                  child: Container(
                    width: 56,
                    decoration: BoxDecoration(color: Colors.white, shape: BoxShape.circle),
                  ),
                ),
              );
            },
          ),
        ),

        const SizedBox(height: 20),

        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            itemCount: 3,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: Shimmer.fromColors(
                  baseColor: vrc(context).border!,
                  highlightColor: vrc(context).border!,
                  child: Container(
                    height: 120,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

import 'package:damta/core/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class TimeTableShimmer extends StatelessWidget {
  const TimeTableShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: Container(
            width: double.infinity,
            height: 650,
            decoration: BoxDecoration(
              border: Border.all(color: darkgrey),
              borderRadius: BorderRadius.circular(8),
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}

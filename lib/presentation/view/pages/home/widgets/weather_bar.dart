import 'package:damta/core/app_theme.dart';
import 'package:damta/presentation/view_model/weather_view_model.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class WeatherBar extends ConsumerWidget {
  const WeatherBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final async = ref.watch(weatherViewModelProvider);

    String convertWeekday(int weekday) {
      if (weekday == 1) return "월";
      if (weekday == 2) return "화";
      if (weekday == 3) return "수";
      if (weekday == 4) return "목";
      if (weekday == 5) return "금";
      if (weekday == 6) return "토";
      if (weekday == 7) return "일";
      return "";
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      height: 40,
      width: double.infinity,
      color: blue,
      child: async.when(
        data: (w) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "${w.time.month}/${w.time.day} (${convertWeekday(w.time.weekday)})",
                style: const TextStyle(fontSize: 16),
              ),
              if (w.precipitation >= 50)
                const Text("우산 챙겨!", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              Text(
                "${w.temperature.round()}° ☔️ ${w.precipitation}%",
                style: const TextStyle(fontSize: 16),
              ),
            ],
          );
        },
        loading: () => Center(child: Text("날씨 불러오는 중..")),
        error: (e, st) => Center(child: Text("날씨를 불러올 수 없습니다")),
      ),
    );
  }
}

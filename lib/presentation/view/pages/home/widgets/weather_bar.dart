import 'package:damta/core/app_theme.dart';
import 'package:flutter/material.dart';

// Entity 로 빼기
class WeatherEntity {
  WeatherEntity({
    required this.time,
    required this.temperature,
    required this.rainPrecipitation,
    required this.isUmbrella,
  });

  final DateTime time; // 날짜
  final num temperature; // 온도
  final int rainPrecipitation; // 강수 확률
  final bool isUmbrella; // 우산 챙겨
}

class WeatherBar extends StatelessWidget {
  WeatherBar({super.key});

  // TODO : 더미데이터 지우기
  final time = DateTime.now();
  final temperature = 5;
  final rainPrecipitation = 60;
  final isUmbrella = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      height: 40,
      width: double.infinity,
      color: blue,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "${time.month}/${time.day}(${time.weekday})",
            style: TextStyle(fontSize: 14),
          ),
          isUmbrella
              ? Text(
                  "우산 챙겨!",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                )
              : SizedBox.shrink(),
          Text(
            "$temperature° ☔️ $rainPrecipitation%",
            style: TextStyle(fontSize: 14),
          ),
        ],
      ),
    );
  }
}

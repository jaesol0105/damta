import 'package:damta/core/theme/app_colors.dart';
import 'package:damta/presentation/home/view_model/weather_extensions.dart';
import 'package:damta/presentation/home/view_model/weather_view_model.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class WeatherModule extends ConsumerWidget {
  const WeatherModule({super.key});

  static const double _cardHeight = 78;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final weatherAsync = ref.watch(weatherViewModelProvider);

    return Container(
      height: _cardHeight,
      decoration: BoxDecoration(
        color: const Color(0xFFD8ECFF),
        borderRadius: BorderRadius.circular(16),
        // border: Border.all(color: const Color(0xFFCBE3FA)),
      ),
      child: weatherAsync.when(
        loading: () => const Center(
          child: SizedBox(
            width: 20,
            height: 20,
            child: CircularProgressIndicator(
              strokeWidth: 2,
              color: Color(0xFF5B7A99),
            ),
          ),
        ),
        error: (e, _) => const Center(
          child: Text(
            '날씨 정보를 불러올 수 없습니다',
            style: TextStyle(color: Color(0xFF5B7A99), fontSize: 12),
          ),
        ),
        data: (weather) => Stack(
          children: [
            // 오늘 날짜
            Positioned(
              top: 20,
              left: 16,
              child: Text(
                weather.formattedDate,
                style: const TextStyle(
                  fontSize: 12.5,
                  letterSpacing: -1,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF5B7A99),
                ),
              ),
            ),

            // 온도, 강수량
            Positioned(
              top: 38,
              left: 12,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    'assets/icons/icon_temperture.png',
                    height: 24,
                    width: 24,
                  ),
                  const SizedBox(width: 3),
                  Text(
                    '${weather.temperature.round()}°',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                      color: Color(0xFF1A1A1A),
                      letterSpacing: -1,
                      height: 1.2,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Image.asset(
                    'assets/icons/icon_umbrella.png',
                    height: 24,
                    width: 24,
                  ),
                  const SizedBox(width: 3),
                  Text(
                    '${weather.precipitation}%',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                      color: Color(0xFF1A1A1A),
                      letterSpacing: -1,
                      height: 1.2,
                    ),
                  ),
                ],
              ),
            ),

            // 날씨에 따른 코멘트
            Positioned(
              top: 22,
              right: 108,
              child: Text(
                weather.weatherComment,
                textAlign: TextAlign.right,
                style: const TextStyle(
                  fontFamily: "Komacon",
                  height: 1,
                  fontSize: 12,
                  letterSpacing: -0.3,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF5B7A99),
                ),
              ),
            ),

            // 코멘트 3줄 이상일 때 .. 붙이기
            if (weather.weatherComment.split('\n').length == 3)
              const Positioned(
                top: 46,
                right: 99,
                child: Text(
                  '..',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    fontFamily: "Komacon",
                    height: 1,
                    fontSize: 12,
                    letterSpacing: -0.3,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textNormal,
                  ),
                ),
              ),

            // 날씨에 따른 캐릭터 이미지
            Positioned(
              top: 0,
              right: 10,
              width: 92,
              height: 92,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(weather.weatherImagePath),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

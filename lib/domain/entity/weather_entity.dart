import 'package:freezed_annotation/freezed_annotation.dart';

part 'weather_entity.freezed.dart';

@freezed
abstract class WeatherEntity with _$WeatherEntity {
  const factory WeatherEntity({
    required DateTime time, // 날짜
    required num temperature, // 온도
    required int precipitation, // 강수 확률
  }) = _WeatherEntity;
}

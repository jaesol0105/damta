import 'package:freezed_annotation/freezed_annotation.dart';

part 'weather_dto.freezed.dart';
part 'weather_dto.g.dart';

@freezed
abstract class WeatherDto with _$WeatherDto {
  const factory WeatherDto({
    @JsonKey(name: 'time') required DateTime time,
    @JsonKey(name: 'temperature_2m') required num temperature,
    @JsonKey(name: 'precipitation_probability') required int precipitation,
  }) = _WeatherDto;

  factory WeatherDto.fromJson(Map<String, dynamic> json) =>
      _$WeatherDtoFromJson(json);
}

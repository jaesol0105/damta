// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_WeatherDto _$WeatherDtoFromJson(Map<String, dynamic> json) => _WeatherDto(
  time: DateTime.parse(json['time'] as String),
  temperature: json['temperature_2m'] as num,
  precipitation: (json['precipitation_probability'] as num).toInt(),
);

Map<String, dynamic> _$WeatherDtoToJson(_WeatherDto instance) =>
    <String, dynamic>{
      'time': instance.time.toIso8601String(),
      'temperature_2m': instance.temperature,
      'precipitation_probability': instance.precipitation,
    };

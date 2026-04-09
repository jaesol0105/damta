import 'package:damta/domain/entity/weather_entity.dart';

abstract interface class WeatherRepository {
  Future<WeatherEntity> getWeather({required double lat, required double lon});
}

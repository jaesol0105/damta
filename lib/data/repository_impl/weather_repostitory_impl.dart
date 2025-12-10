import 'package:damta/data/data_source/weather_data_source.dart';
import 'package:damta/data/dto/weather_dto.dart';
import 'package:damta/domain/entity/weather_entity.dart';

class WeatherRepositoryImpl {
  const WeatherRepositoryImpl(this.dataSource);

  final WeatherDataSource dataSource;

  Future<WeatherEntity> getWeather({
    required double lat,
    required double lon,
  }) async {
    final data = await dataSource.getWeather(lat: lat, lon: lon);

    // API 응답에서 current 추출
    final current = data['current'];
    if (current == null) {
      throw Exception("current 데이터가 없습니다");
    }

    // JSON > DTO
    final dto = WeatherDto.fromJson(current);

    // DTO > Entity
    final entity = WeatherEntity(
      time: dto.time,
      temperature: dto.temperature,
      precipitation: dto.precipitation,
    );

    return entity;
  }
}

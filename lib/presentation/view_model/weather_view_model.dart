import 'package:damta/core/di/weather_provider.dart';
import 'package:damta/data/repository_impl/weather_repostitory_impl.dart';
import 'package:damta/domain/entity/weather_entity.dart';
import 'package:geolocator/geolocator.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'weather_view_model.g.dart';

@riverpod
class WeatherViewModel extends _$WeatherViewModel {
  WeatherRepositoryImpl get repository => ref.watch(weatherRepositoryProvider);

  @override
  Future<WeatherEntity> build() async {
    return await getWeather();
  }

  // Geolocator 로 위치 정보 가져오기
  Future<Position?> getPosition() async {
    final permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      final permission2 = await Geolocator.requestPermission();
      if (permission2 == LocationPermission.denied ||
          permission2 == LocationPermission.deniedForever) {
        throw Exception("위치 권한 거부됨");
      }
    }

    return await Geolocator.getCurrentPosition(
      locationSettings: const LocationSettings(
        accuracy: LocationAccuracy.high,
        distanceFilter: 100,
      ),
    );
  }

  // 위치 기반 날씨 가져오기
  Future<WeatherEntity> getWeather() async {
    final position = await getPosition();
    if (position == null) throw Exception("위치 정보를 가져올 수 없습니다");

    return await repository.getWeather(
      lat: position.latitude,
      lon: position.longitude,
    );
  }
}

import 'package:damta/data/data_source/remote/weather_data_source.dart';
import 'package:dio/dio.dart';

class WeatherDataSourceImpl implements WeatherDataSource {
  WeatherDataSourceImpl(this.dio);

  final Dio dio;

  // Open-Meteo API 로 날씨 정보 가져오기
  @override
  Future<Map<String, dynamic>> getWeather({required double lat, required double lon}) async {
    final response = await dio.get(
      'https://api.open-meteo.com/v1/forecast',
      queryParameters: {
        'latitude': lat.toString(),
        'longitude': lon.toString(),
        'current': 'temperature_2m,precipitation_probability',
      },
    );
    // 요청 실패 시 예외 처리
    if (response.statusCode != 200) {
      throw Exception("API 요청 실패");
    }
    // 요청 성공 시
    return response.data;
  }
}

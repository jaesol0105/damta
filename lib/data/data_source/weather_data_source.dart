abstract interface class WeatherDataSource {
  Future<Map<String, dynamic>> getWeather({
    required double lat,
    required double lon,
  });
}

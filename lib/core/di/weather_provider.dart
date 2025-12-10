import 'package:damta/data/data_source_impl/weather_data_source_impl.dart';
import 'package:damta/data/repository_impl/weather_repostitory_impl.dart';
import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'weather_provider.g.dart';

@riverpod
Dio dio(Ref ref) => Dio();

@riverpod
WeatherDataSourceImpl weatherDataSource(Ref ref) {
  final dio = ref.watch(dioProvider);
  return WeatherDataSourceImpl(dio);
}

@riverpod
WeatherRepositoryImpl weatherRepository(Ref ref) {
  final dataSource = ref.watch(weatherDataSourceProvider);
  return WeatherRepositoryImpl(dataSource);
}

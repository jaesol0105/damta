import 'package:damta/data/data_source/local/meal_local_data_source.dart';
import 'package:damta/data/data_source/local/schedule_local_data_source.dart';
import 'package:damta/data/data_source/remote/meal_remote_data_source.dart';
import 'package:damta/data/data_source/remote/schedule_remote_data_source.dart';
import 'package:damta/data/data_source_impl/local/meal_local_data_source_impl.dart';
import 'package:damta/data/data_source_impl/local/schedule_local_data_source_impl.dart';
import 'package:damta/data/data_source_impl/remote/meal_reomte_data_source_impl.dart';
import 'package:damta/data/data_source_impl/remote/schedule_remote_data_source_impl.dart';
import 'package:damta/data/database/database_helper.dart';
import 'package:damta/data/repository_impl/meal_repository_impl.dart';
import 'package:damta/data/repository_impl/schedule_repository_impl.dart';
import 'package:damta/domain/repository/meal_repository.dart';
import 'package:damta/domain/repository/schedule_repository.dart';
import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sqflite/sqflite.dart';

part 'provider.g.dart';

@riverpod
Dio dio(Ref ref) {
  return Dio();
}

@Riverpod(keepAlive: true)
Future<Database> database(Ref ref) async {
  final helper = DatabaseHelper();
  return helper.database;
}

@riverpod
MealRemoteDataSource mealRemoteDataSource(Ref ref) {
  final dio = ref.watch(dioProvider);
  return MealRemoteDataSourceImpl(dio: dio);
}

@riverpod
ScheduleRemoteDataSource scheduleRemoteDataSource(Ref ref) {
  final dio = ref.watch(dioProvider);
  return ScheduleRemoteDataSourceImpl(dio);
}

@riverpod
Future<MealLocalDataSource> mealLocalDataSource(Ref ref) async {
  final db = await ref.watch(databaseProvider.future);
  return MealLocalDataSourceImpl(database: db);
}

@riverpod
Future<ScheduleLocalDataSource> scheduleLocalDataSource(Ref ref) async {
  final db = await ref.watch(databaseProvider.future);
  return ScheduleLocalDataSourceImpl(database: db);
}

@riverpod
Future<MealRepository> mealRepository(Ref ref) async {
  final remoteDataSource = ref.watch(mealRemoteDataSourceProvider);
  final localDataSource = await ref.watch(mealLocalDataSourceProvider.future);
  return MealRepositoryImpl(remoteDataSource: remoteDataSource, localDataSource: localDataSource);
}

@riverpod
Future<ScheduleRepository> scheduleRepository(Ref ref) async {
  final remoteDataSource = ref.watch(scheduleRemoteDataSourceProvider);
  final localDataSource = await ref.watch(scheduleLocalDataSourceProvider.future);
  return ScheduleRepositoryImpl(remoteDataSource, localDataSource);
}

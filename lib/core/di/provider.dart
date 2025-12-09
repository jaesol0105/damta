import 'package:damta/data/data_source/local/meal_local_data_source.dart';
import 'package:damta/data/data_source/remote/meal_remote_data_source.dart';
import 'package:damta/data/data_source_impl/local/meal_local_data_source_impl.dart';
import 'package:damta/data/data_source_impl/remote/meal_reomte_data_source_impl.dart';
import 'package:damta/data/database/database_helper.dart';
import 'package:damta/data/repository_impl/meal_repository_impl.dart';
import 'package:damta/domain/repository/meal_repository.dart';
import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sqflite/sqflite.dart';

part 'provider.g.dart';

@riverpod
Dio dio(Ref ref) {
  return Dio();
}

@riverpod
DatabaseHelper databaseHelper(Ref ref) {
  return DatabaseHelper();
}

@Riverpod(keepAlive: true)
Future<Database> database(Ref ref) async {
  final helper = ref.watch(databaseHelperProvider);
  return await helper.database;
}

@riverpod
MealRemoteDataSource mealRemoteDataSource(Ref ref) {
  final dio = ref.watch(dioProvider);
  return MealRemoteDataSourceImpl(dio: dio);
}

@Riverpod(keepAlive: true)
Future<MealLocalDataSource> mealLocalDataSource(Ref ref) async {
  final db = await ref.watch(databaseProvider.future);
  return MealLocalDataSourceImpl(database: db);
}

@Riverpod(keepAlive: true)
Future<MealRepository> mealRepository(Ref ref) async {
  final remoteDataSource = ref.watch(mealRemoteDataSourceProvider);
  final localDataSource = await ref.watch(mealLocalDataSourceProvider.future);
  return MealRepositoryImpl(remoteDataSource: remoteDataSource, localDataSource: localDataSource);
}

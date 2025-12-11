import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:damta/data/data_source/remote/comment_data_source.dart';
import 'package:damta/data/data_source/local/meal_local_data_source.dart';
import 'package:damta/data/data_source/local/schedule_local_data_source.dart';
import 'package:damta/data/data_source/local/time_table_local_data_source.dart';
import 'package:damta/data/data_source/remote/notification_data_source.dart';
import 'package:damta/data/data_source/remote/post_data_source.dart';
import 'package:damta/data/data_source/remote/meal_remote_data_source.dart';
import 'package:damta/data/data_source/remote/schedule_remote_data_source.dart';
import 'package:damta/data/data_source/remote/storage_data_source.dart';
import 'package:damta/data/data_source/remote/time_table_remote_data_source.dart';
import 'package:damta/data/data_source/remote/weather_data_source.dart';
import 'package:damta/data/data_source_impl/remote/comment_data_source_impl.dart';
import 'package:damta/data/data_source_impl/local/meal_local_data_source_impl.dart';
import 'package:damta/data/data_source_impl/local/schedule_local_data_source_impl.dart';
import 'package:damta/data/data_source_impl/local/time_table_local_data_source_impl.dart';
import 'package:damta/data/data_source_impl/remote/notification_data_source_impl.dart';
import 'package:damta/data/data_source_impl/remote/post_data_source_impl.dart';
import 'package:damta/data/data_source_impl/remote/meal_reomte_data_source_impl.dart';
import 'package:damta/data/data_source_impl/remote/schedule_remote_data_source_impl.dart';
import 'package:damta/data/data_source_impl/remote/storage_data_source_impl.dart';
import 'package:damta/data/data_source_impl/remote/time_table_remote_data_source_impl.dart';
import 'package:damta/data/data_source_impl/remote/weather_data_source_impl.dart';
import 'package:damta/data/database/database_helper.dart';
import 'package:damta/data/repository_impl/comment_repository_impl.dart';
import 'package:damta/data/repository_impl/meal_repository_impl.dart';
import 'package:damta/data/repository_impl/notification_repository_impl.dart';
import 'package:damta/data/repository_impl/post_repository_impl.dart';
import 'package:damta/data/repository_impl/schedule_repository_impl.dart';
import 'package:damta/data/repository_impl/storage_repository_impl.dart';
import 'package:damta/data/repository_impl/time_table_repository_impl.dart';
import 'package:damta/data/repository_impl/weather_repostitory_impl.dart';
import 'package:damta/domain/repository/comment_repository.dart';
import 'package:damta/domain/repository/meal_repository.dart';
import 'package:damta/domain/repository/notification_repository.dart';
import 'package:damta/domain/repository/post_repository.dart';
import 'package:damta/domain/repository/schedule_repository.dart';
import 'package:damta/domain/repository/storage_repository.dart';
import 'package:damta/domain/repository/time_table_repository.dart';
import 'package:damta/domain/repository/weather_repository.dart';
import 'package:damta/domain/usecase/comment_usecase.dart';
import 'package:damta/domain/usecase/post_usecase.dart';
import 'package:dio/dio.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sqflite/sqflite.dart';

part 'provider.g.dart';

@riverpod
Dio dio(Ref ref) => Dio();

@riverpod
FirebaseFirestore firestore(Ref ref) => FirebaseFirestore.instance;

@riverpod
FirebaseStorage firebaseStorage(Ref ref) => FirebaseStorage.instance;

@Riverpod(keepAlive: true)
Future<Database> database(Ref ref) async {
  final helper = DatabaseHelper();
  return helper.database;
}

// Remote DataSource

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
TimeTableRemoteDataSource timeTableRemoteDataSource(Ref ref) {
  final dio = ref.watch(dioProvider);
  return TimeTableRemoteDataSourceImpl(dio: dio);
}

@riverpod
WeatherDataSource weatherDataSource(Ref ref) {
  final dio = ref.watch(dioProvider);
  return WeatherDataSourceImpl(dio);
}

@riverpod
PostDataSource postDataSource(Ref ref) {
  final firestore = ref.watch(firestoreProvider);
  return PostDataSourceImpl(firestore);
}

@riverpod
CommentDataSource commentDataSource(Ref ref) {
  final firestore = ref.watch(firestoreProvider);
  return CommentDataSourceImpl(firestore);
}

@riverpod
StorageDataSource storageDataSource(Ref ref) {
  final storage = ref.watch(firebaseStorageProvider);
  return StorageDataSourceImpl(storage: storage);
}

@riverpod
NotificationDataSource notificationDataSource(Ref ref) {
  final firestore = ref.watch(firestoreProvider);
  return NotificationDataSourceImpl(firestore);
}

// Local DataSource

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
Future<TimeTableLocalDataSource> timeTableLocalDataSource(Ref ref) async {
  final db = await ref.watch(databaseProvider.future);
  return TimeTableLocalDataSourceImpl(database: db);
}

// Repository

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

@riverpod
Future<TimeTableRepository> timeTableRepository(Ref ref) async {
  final remoteDataSource = ref.watch(timeTableRemoteDataSourceProvider);
  final localDataSource = await ref.watch(timeTableLocalDataSourceProvider.future);
  return TimeTableRepositoryImpl(remoteDataSource, localDataSource);
}

@riverpod
WeatherRepository weatherRepository(Ref ref) {
  final dataSource = ref.watch(weatherDataSourceProvider);
  return WeatherRepositoryImpl(dataSource);
}

@riverpod
PostRepository postRepository(Ref ref) {
  final postDataSource = ref.watch(postDataSourceProvider);
  return PostRepositoryImpl(postDataSource);
}

@riverpod
CommentRepository commentRepository(Ref ref) {
  final commentDataSource = ref.watch(commentDataSourceProvider);
  return CommentRepositoryImpl(commentDataSource);
}

@riverpod
StorageRepository storageRepository(Ref ref) {
  return StorageRepositoryImpl(dataSource: ref.watch(storageDataSourceProvider));
}

@riverpod
NotificationRepository notificationRepository(Ref ref) {
  final dataSource = ref.watch(notificationDataSourceProvider);
  return NotificationRepositoryImpl(dataSource);
}

// Usecase

@riverpod
PostUsecase postUsecase(Ref ref) {
  final postRepository = ref.watch(postRepositoryProvider);
  return PostUsecase(postRepository);
}

@riverpod
CommentUsecase commentUsecase(Ref ref) {
  final commentRepository = ref.watch(commentRepositoryProvider);
  return CommentUsecase(commentRepository);
}

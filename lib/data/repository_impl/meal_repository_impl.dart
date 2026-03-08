import 'package:damta/core/logger/log.dart';
import 'package:damta/data/data_source/local/meal_local_data_source.dart';
import 'package:damta/data/data_source/remote/meal_remote_data_source.dart';
import 'package:damta/data/mapper/meal_mapper.dart';
import 'package:damta/domain/entity/meal_entity.dart';
import 'package:damta/domain/repository/meal_repository.dart';

class MealRepositoryImpl implements MealRepository {
  MealRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  final MealRemoteDataSource remoteDataSource;
  final MealLocalDataSource localDataSource;

  @override
  Future<List<MealEntity>> getMeals({
    required String officeCode,
    required String schoolCode,
    required DateTime fromDate,
    required DateTime toDate,
  }) async {
    try {
      // 로컬 캐시에서 먼저 조회
      final cachedMeals = await localDataSource.getMeals(
        schoolCode: schoolCode,
        fromDate: fromDate,
        toDate: toDate,
      );
      if (cachedMeals.isNotEmpty) {
        return cachedMeals;
      }

      // 캐시가 없으면 API 호출
      final dtoList = await remoteDataSource.getMeals(
        officeCode: officeCode,
        schoolCode: schoolCode,
        fromDate: fromDate,
        toDate: toDate,
      );
      final entities = MealMapper.toDomainList(dtoList);

      // API 응답을 로컬 캐시에 저장
      if (entities.isNotEmpty) {
        await localDataSource.saveMeals(
          schoolCode: schoolCode,
          meals: entities,
        );
      }
      return entities;
    } catch (e, s) {
      Log.e('Repository getMeals 실패: $e', error: e, stackTrace: s);
      rethrow;
    }
  }
}

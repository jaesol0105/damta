import 'package:damta/data/data_source/remote/users_data_source.dart';
import 'package:damta/data/mapper/users_mapper.dart';
import 'package:damta/domain/entity/users_entity.dart';
import 'package:damta/domain/repository/users_repository.dart';

class UsersRepositoryImpl implements UsersRepository {
  const UsersRepositoryImpl(this.dataSource);
  final UsersDataSource dataSource;

  @override // R
  Future<UsersEntity> getUser(String uId) async {
    final dto = await dataSource.getUser(uId);
    return toEntity(dto);
  }
}

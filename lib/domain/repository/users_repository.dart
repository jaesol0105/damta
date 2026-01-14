import 'package:damta/domain/entity/users_entity.dart';

abstract interface class UsersRepository {
  Future<UsersEntity> getUser(String uId);
}

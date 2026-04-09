import 'package:damta/domain/entity/users_entity.dart';

abstract interface class UsersRepository {
  Future<UsersEntity> getUser(String uId);

  Future<void> saveSchoolInfo({
    required String schoolName,
    required String officeCode,
    required String schoolCode,
  });
}

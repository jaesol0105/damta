import 'package:damta/domain/entity/users_entity.dart';

abstract class AuthRepository {
  Future<UsersEntity?> signInApple();
  Future<UsersEntity?> signInGoogle();
  Future<UsersEntity?> signInKakao();
  Future<UsersEntity?> signInNaver();

  Future<void> signOut();

  Future<void> deleteAccount();

  Stream<UsersEntity?> authStateChanges();
}

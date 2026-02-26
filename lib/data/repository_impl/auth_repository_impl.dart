import 'package:damta/domain/entity/users_entity.dart';
import 'package:damta/domain/repository/auth_repository.dart';
import 'package:damta/data/data_source/remote/auth_data_source.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthDataSource dataSource;

  AuthRepositoryImpl(this.dataSource);

  @override
  Future<UsersEntity?> signInApple() {
    return dataSource.signInWithApple();
  }

  @override
  Future<UsersEntity?> signInGoogle() {
    return dataSource.signInWithGoogle();
  }

  @override
  Future<UsersEntity?> signInKakao() {
    return dataSource.signInWithCustomProvider("Kakao");
  }

  @override
  Future<UsersEntity?> signInNaver() {
    return dataSource.signInWithCustomProvider("Naver");
  }

  @override
  Future<void> signOut() {
    return dataSource.signOut();
  }

  @override
  Future<void> deleteAccount() {
    return dataSource.deleteAccount();
  }

  @override
  Stream<UsersEntity?> authStateChanges() {
    return dataSource.authStateChanges();
  }
}

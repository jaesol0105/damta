import 'dart:async';
import 'package:damta/core/di/provider.dart';
import 'package:damta/domain/entity/users_entity.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'users_provider.g.dart';

// 사용자 정보 가져오기 Provider
@riverpod
Future<UsersEntity> user(Ref ref) {
  final uId = FirebaseAuth.instance.currentUser!.uid;
  return ref.read(usersRepositoryProvider).getUser(uId);
}

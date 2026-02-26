import 'dart:async';
import 'package:damta/core/di/provider.dart';
import 'package:damta/domain/entity/users_entity.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'users_provider.g.dart';

// 사용자 정보 가져오기 Provider
@riverpod
Future<UsersEntity> user(Ref ref) {
  final uid = FirebaseAuth.instance.currentUser!.uid;
  return ref.read(usersRepositoryProvider).getUser(uid);
}

// 인증 상태 Stream 전용 Provider
@riverpod
Stream<UsersEntity?> authState(Ref ref) {
  final repo = ref.watch(authRepositoryProvider);
  return repo.authStateChanges();
}

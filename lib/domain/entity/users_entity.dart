import 'package:freezed_annotation/freezed_annotation.dart';

part 'users_entity.freezed.dart';

@freezed
abstract class UsersEntity with _$UsersEntity {
  const factory UsersEntity({
    String? uId,
    required String officeCode,
    required String schoolCode,
    required String schoolName,
  }) = _UsersEntity;
}

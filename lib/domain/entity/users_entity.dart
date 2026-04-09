import 'package:freezed_annotation/freezed_annotation.dart';

part 'users_entity.freezed.dart';

@freezed
abstract class UsersEntity with _$UsersEntity {
  const factory UsersEntity({
    String? uId,
    String? email,
    String? officeCode,
    String? schoolCode,
    String? schoolName,
  }) = _UsersEntity;
}

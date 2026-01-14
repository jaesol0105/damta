import 'package:freezed_annotation/freezed_annotation.dart';

part 'users_dto.freezed.dart';
part 'users_dto.g.dart';

@freezed
abstract class UsersDto with _$UsersDto {
  const factory UsersDto({
    String? uId,
    required String officeCode,
    required String schoolCode,
    required String schoolName,
  }) = _UsersDto;

  factory UsersDto.fromJson(Map<String, Object?> json) =>
      _$UsersDtoFromJson(json);
}

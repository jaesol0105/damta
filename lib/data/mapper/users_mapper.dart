import 'package:damta/data/dto/users_dto.dart';
import 'package:damta/domain/entity/users_entity.dart';

/// DTO > Entity
UsersEntity toEntity(UsersDto dto) {
  return UsersEntity(
    uId: dto.uId,
    email: dto.email,
    officeCode: dto.officeCode,
    schoolCode: dto.schoolCode,
    schoolName: dto.schoolName,
  );
}

/// Entity > DTO
UsersDto toDto(UsersEntity entity) {
  return UsersDto(
    uId: entity.uId,
    email: entity.email,
    officeCode: entity.officeCode,
    schoolCode: entity.schoolCode,
    schoolName: entity.schoolName,
  );
}

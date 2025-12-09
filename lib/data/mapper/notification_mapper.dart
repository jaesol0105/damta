import 'package:damta/data/dto/notification_dto.dart';
import 'package:damta/domain/entity/notification_entity.dart';

// DTO > Entity
NotificationEntity dtoToEntity(NotificationDto dto) {
  return NotificationEntity(
    nId: dto.nId!,
    uId: dto.uId,
    pId: dto.pId,
    pTitle: dto.pTitle,
    createdAt: dto.createdAt,
    isComment: dto.isComment,
    content: dto.content,
    isNew: dto.isNew,
    isRead: dto.isRead,
  );
}

// Entity > DTO
NotificationDto entityToDto(NotificationEntity entity) {
  return NotificationDto(
    nId: entity.nId,
    uId: entity.uId,
    pId: entity.pId,
    pTitle: entity.pTitle,
    createdAt: entity.createdAt,
    isComment: entity.isComment,
    content: entity.content,
    isNew: entity.isNew,
    isRead: entity.isRead,
  );
}

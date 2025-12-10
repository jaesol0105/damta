import 'package:damta/data/dto/comment_dto.dart';
import 'package:damta/domain/entity/comment_entity.dart';

CommentEntity commentDtoToCommentEntity(CommentDto commentDto) {
  return CommentEntity(
    cId: commentDto.cId,
    uId: commentDto.uId,
    pId: commentDto.pId,
    cContent: commentDto.cContent,
    cWriter: commentDto.cWriter,
    cCreatedAt: commentDto.cCreatedAt,
  );
}

CommentDto commentEntityToCommentDto(CommentEntity commentEntity) {
  return CommentDto(
    cId: commentEntity.cId,
    uId: commentEntity.uId,
    pId: commentEntity.pId,
    cContent: commentEntity.cContent,
    cWriter: commentEntity.cWriter,
    cCreatedAt: commentEntity.cCreatedAt,
  );
}

// DTO > Entity
import 'package:damta/data/dto/post_dto.dart';
import 'package:damta/domain/entity/post_entity.dart';

PostEntity postDtoToPostEntity(PostDto postDto) {
  return PostEntity(
    uId: postDto.uId,
    pId: postDto.pId,
    pTitle: postDto.pTitle,
    pContent: postDto.pContent,
    pWriter: postDto.pWriter,
    pCreatedAt: postDto.pCreatedAt,
    pImageUrl: postDto.pImageUrl,
    emojis: postDto.emojis,
    view: postDto.view,
  );
}

// Entity > DTO
PostDto postEntityToPostDto(PostEntity postEntity) {
  return PostDto(
    pId: postEntity.pId,
    uId: postEntity.uId,
    pTitle: postEntity.pTitle,
    pContent: postEntity.pContent,
    pWriter: postEntity.pWriter,
    pCreatedAt: postEntity.pCreatedAt,
    emojis: postEntity.emojis,
    pImageUrl: postEntity.pImageUrl,
    view: postEntity.view,
  );
}

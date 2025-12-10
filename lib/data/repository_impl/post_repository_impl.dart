import 'package:damta/data/data_source/post_data_source.dart';
import 'package:damta/data/mapper/post_mapper.dart';
import 'package:damta/domain/entity/post_entity.dart';
import 'package:damta/domain/repository/post_repository.dart';

// Dto - Entity
class PostRepositoryImpl implements PostRepository {
  const PostRepositoryImpl(this.postDataSource); // 의존성 주입
  final PostDataSource postDataSource;

  @override
  Future<void> addPost(PostEntity postEntity) async {
    final postDto = postEntityToPostDto(postEntity);
    await postDataSource.addPost(postDto);
  }

  @override
  Future<void> deletePost(String pId) async {
    await postDataSource.deletePost(pId);
  }

  @override
  Future<List<PostEntity>> getAllPosts() async {
    final dtos = await postDataSource.getAllPosts();
    return dtos.map(postDtoToPostEntity).toList();
  }

  @override
  Future<void> updatePost(PostEntity postEntity) {
    final postDto = postEntityToPostDto(postEntity);
    return postDataSource.updatePost(postDto);
  }
}

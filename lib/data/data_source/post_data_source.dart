import 'package:damta/data/dto/post_dto.dart';

abstract interface class PostDataSource {
  Future<List<PostDto>> getAllPosts();
  Future<PostDto> getPost();
  Future<void> addPost(PostDto postDto);
  Future<void> updatePost(PostDto postDto);
  Future<void> deletePost(String pId);
}

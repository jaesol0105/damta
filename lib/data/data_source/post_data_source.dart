import 'package:damta/data/dto/post_dto.dart';

abstract interface class PostDataSource {
  Future<List<PostDto>> getAllPosts();
  Future<void> addPost(PostDto postDto);
  Future<void> updatePost(PostDto postDto);
  Future<void> deletePost(String pId);
}

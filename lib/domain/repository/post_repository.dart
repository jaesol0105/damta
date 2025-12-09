import 'package:damta/domain/entity/post_entity.dart';

abstract interface class PostRepository {
  Future<List<PostEntity>> getAllPosts();
  Future<PostEntity> getPost();
  Future<void> addPost(PostEntity postEntity);
  Future<void> updatePost(PostEntity postEntity);
  Future<void> deletePost(String pId);
}

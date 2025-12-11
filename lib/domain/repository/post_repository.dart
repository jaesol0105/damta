import 'package:damta/domain/entity/post_entity.dart';

abstract interface class PostRepository {
  /// post 목록 조회
  Future<List<PostEntity>> getAllPosts();

  /// post 추가
  Future<PostEntity> addPost(PostEntity entity);

  /// post 수정
  Future<void> updatePost(PostEntity entity);

  /// post 삭제
  Future<void> deletePost(String id);
}

import 'package:damta/data/dto/post_dto.dart';

abstract interface class PostDataSource {
  /// post 목록 조회
  Future<List<PostDto>> getAllPosts();

  /// post 추가
  Future<PostDto> addPost(PostDto post);

  /// post 수정
  Future<void> updatePost(PostDto post);

  /// post 삭제
  Future<void> deletePost(String id);
}

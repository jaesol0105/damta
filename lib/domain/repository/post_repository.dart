import 'package:damta/domain/entity/post_entity.dart';

abstract interface class PostRepository {
  /// 해당 학교의 post 목록 조회
  Future<List<PostEntity>> getAllPosts({String? schoolCode});

  /// 해당 학교에 post 추가
  Future<PostEntity> addPost(PostEntity entity, {String? schoolCode});

  /// post 수정
  Future<void> updatePost(PostEntity entity, {String? schoolCode});

  /// post 삭제
  Future<void> deletePost(String id);
}

import 'package:damta/domain/entity/post_entity.dart';

abstract interface class PostRepository {
  /// 해당 학교의 post 목록 조회
  Future<List<PostEntity>> getPosts({String? schoolCode});

  /// 특정 post 1개 조회
  Future<PostEntity?> getPost(String pId);

  /// 해당 학교에 post 추가
  Future<PostEntity> addPost(PostEntity entity, {String? schoolCode});

  /// post 내용 수정
  Future<void> updatePostContent(PostEntity entity);

  /// post 삭제
  Future<void> deletePost(String id);

  /// 조회수 증가
  Future<void> incrementViewCount(String pId);

  /// 이모지 반응 추가
  Future<void> addReaction(String pId, String userId, String emoji);

  /// 이모지 반응 취소
  Future<void> removeReaction(String pId, String userId, String emoji);
}

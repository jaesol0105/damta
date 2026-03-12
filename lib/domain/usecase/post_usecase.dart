import 'package:damta/core/util/content_filter.dart';
import 'package:damta/domain/entity/post_entity.dart';
import 'package:damta/domain/repository/post_repository.dart';

class PostUsecase {
  const PostUsecase(this.postRepository);
  final PostRepository postRepository;

  Future<List<PostEntity>> getPosts({String? schoolCode}) {
    return postRepository.getPosts(schoolCode: schoolCode);
  }

  Future<PostEntity?> getPost(String pId) {
    return postRepository.getPost(pId);
  }

  Future<PostEntity> addPost(
    PostEntity postEntity, {
    String? schoolCode,
  }) async {
    ContentFilter.validate(postEntity.pTitle);
    ContentFilter.validate(postEntity.pContent);
    return postRepository.addPost(postEntity, schoolCode: schoolCode);
  }

  Future<void> updatePostContent(PostEntity postEntity) async {
    ContentFilter.validate(postEntity.pTitle);
    ContentFilter.validate(postEntity.pContent);
    await postRepository.updatePostContent(postEntity);
  }

  Future<void> deletePost(String pId) async {
    await postRepository.deletePost(pId);
  }

  Future<void> incrementViewCount(String pId) {
    return postRepository.incrementViewCount(pId);
  }

  Future<void> addReaction(String pId, String userId, String emoji) {
    return postRepository.addReaction(pId, userId, emoji);
  }

  Future<void> removeReaction(String pId, String userId, String emoji) {
    return postRepository.removeReaction(pId, userId, emoji);
  }
}

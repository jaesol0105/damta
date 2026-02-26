import 'package:damta/domain/entity/post_entity.dart';
import 'package:damta/domain/repository/post_repository.dart';

class PostUsecase {
  const PostUsecase(this.postRepository); // 의존성 주입
  final PostRepository postRepository;

  Future<List<PostEntity>> getAllPosts({String? schoolCode}) async {
    return postRepository.getAllPosts(schoolCode: schoolCode);
  }

  Future<void> addPost(PostEntity postEntity, {String? schoolCode}) async {
    await postRepository.addPost(postEntity, schoolCode: schoolCode);
  }

  Future<void> updatePost(PostEntity postEntity, {String? schoolCode}) async {
    await postRepository.updatePost(postEntity, schoolCode: schoolCode);
  }

  Future<void> deletePost(String pId) async {
    await postRepository.deletePost(pId);
  }
}

import 'package:damta/domain/entity/post_entity.dart';
import 'package:damta/domain/repository/post_repository.dart';

class PostUsecase {
  const PostUsecase(this.postRepository); // 의존성 주입
  final PostRepository postRepository;

   // todo 리스트 처음 불러오기
  Future<List<PostEntity>> getAllPosts() async {
    return postRepository.getAllPosts();
  }

}

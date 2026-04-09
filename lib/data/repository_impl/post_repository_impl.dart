import 'package:damta/core/logger/log.dart';
import 'package:damta/data/data_source/remote/post_data_source.dart';
import 'package:damta/data/mapper/post_mapper.dart';
import 'package:damta/domain/entity/post_entity.dart';
import 'package:damta/domain/repository/post_repository.dart';

class PostRepositoryImpl implements PostRepository {
  const PostRepositoryImpl(this.postDataSource);
  final PostDataSource postDataSource;

  @override
  Future<List<PostEntity>> getPosts({String? schoolCode}) async {
    final dtos = await postDataSource.getPosts(schoolCode: schoolCode);
    return dtos.map(postDtoToPostEntity).toList();
  }

  @override
  Future<PostEntity?> getPost(String pId) async {
    final dto = await postDataSource.getPost(pId);
    if (dto == null) return null;
    return postDtoToPostEntity(dto);
  }

  @override
  Future<PostEntity> addPost(PostEntity entity, {String? schoolCode}) async {
    try {
      final dto = postEntityToPostDto(entity);
      final added = await postDataSource.addPost(dto, schoolCode: schoolCode);
      return postDtoToPostEntity(added);
    } catch (e, s) {
      Log.e('Repository addPost 실패: $e', error: e, stackTrace: s);
      rethrow;
    }
  }

  @override
  Future<void> updatePostContent(PostEntity entity) async {
    try {
      final dto = postEntityToPostDto(entity);
      await postDataSource.updatePostContent(dto);
    } catch (e, s) {
      Log.e('Repository updatePostContent 실패: $e', error: e, stackTrace: s);
      rethrow;
    }
  }

  @override
  Future<void> deletePost(String id) async {
    try {
      await postDataSource.deletePost(id);
    } catch (e, s) {
      Log.e('Repository deletePost 실패: $e', error: e, stackTrace: s);
      rethrow;
    }
  }

  @override
  Future<void> incrementViewCount(String pId) {
    return postDataSource.incrementViewCount(pId);
  }

  @override
  Future<void> addReaction(String pId, String userId, String emoji) {
    return postDataSource.addReaction(pId, userId, emoji);
  }

  @override
  Future<void> removeReaction(String pId, String userId, String emoji) {
    return postDataSource.removeReaction(pId, userId, emoji);
  }
}

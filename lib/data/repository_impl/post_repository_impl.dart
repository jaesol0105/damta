import 'dart:developer';

import 'package:damta/data/data_source/remote/post_data_source.dart';
import 'package:damta/data/mapper/post_mapper.dart';
import 'package:damta/domain/entity/post_entity.dart';
import 'package:damta/domain/repository/post_repository.dart';

class PostRepositoryImpl implements PostRepository {
  const PostRepositoryImpl(this.postDataSource);
  final PostDataSource postDataSource;

  @override
  Future<PostEntity> addPost(PostEntity entity) async {
    try {
      final dto = postEntityToPostDto(entity);
      final added = await postDataSource.addPost(dto);
      return postDtoToPostEntity(added);
      // 예외 전파
    } catch (e, s) {
      log('Repository addPost 실패: $e', error: e, stackTrace: s);
      rethrow;
    }
  }

  @override
  Future<void> updatePost(PostEntity entity) async {
    try {
      final dto = postEntityToPostDto(entity);
      await postDataSource.updatePost(dto);
      // 예외 전파
    } catch (e, s) {
      log('Repository updatePost 실패: $e', error: e, stackTrace: s);
      rethrow;
    }
  }

  @override
  Future<void> deletePost(String id) async {
    try {
      await postDataSource.deletePost(id);
      // 예외 전파
    } catch (e, s) {
      log('Repository deletePost 실패: $e', error: e, stackTrace: s);
      rethrow;
    }
  }

  @override
  Future<List<PostEntity>> getAllPosts() async {
    final dtos = await postDataSource.getAllPosts();
    return dtos.map(postDtoToPostEntity).toList();
  }
}

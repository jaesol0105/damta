import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:damta/core/util/nick_name_generator.dart';
import 'package:damta/data/data_source/remote/post_data_source.dart';
import 'package:damta/data/dto/post_dto.dart';

class PostDataSourceImpl implements PostDataSource {
  PostDataSourceImpl(this.firestore);
  final FirebaseFirestore firestore;

  @override
  Future<PostDto> addPost(PostDto post) async {
    try {
      final ref = await firestore.collection('post').add({
        ...post.toJson(),
        'p_created_at': FieldValue.serverTimestamp(), // 파이어베이스 서버 시간 사용
        'p_writer': NicknameGenerator.generate(),
      });
      return post.copyWith(pId: ref.id); // 문서 id, 낙관적 업데이트를 위해 포스트 객체 반환
      // 예외 전파
    } on FirebaseException catch (e, s) {
      log('Firebase addPost 실패: ${e.message}', error: e, stackTrace: s);
      rethrow;
    } catch (e, s) {
      log('알 수 없는 addPost 실패: $e', error: e, stackTrace: s);
      rethrow;
    }
  }

  @override
  Future<void> updatePost(PostDto post) async {
    try {
      print('😡호출');
      await firestore.collection('post').doc(post.pId).update(post.toJson());
      // 예외 전파
    } on FirebaseException catch (e, s) {
      log('Firebase updatePost 실패: ${e.message}', error: e, stackTrace: s);
      rethrow;
    } catch (e, s) {
      log('알 수 없는 updatePost 실패: $e', error: e, stackTrace: s);
      rethrow;
    }
  }

  @override
  Future<void> deletePost(String id) async {
    try {
      await firestore.collection('post').doc(id).delete();
      // 예외 전파
    } on FirebaseException catch (e, s) {
      log('Firebase deletePost 실패: ${e.message}', error: e, stackTrace: s);
      rethrow;
    } catch (e, s) {
      log('알 수 없는 deletePost 실패: $e', error: e, stackTrace: s);
      rethrow;
    }
  }

  @override
  Future<List<PostDto>> getAllPosts() async {
    final snapshot = await firestore.collection("post").get();
    return snapshot.docs.map((doc) {
      final data = doc.data();
      // Firestore 문서 ID를 p_id로 설정
      data['p_id'] = doc.id;
      // Firestore Timestamp를 DateTime으로 변환
      if (data['p_created_at'] is Timestamp) {
        data['p_created_at'] = (data['p_created_at'] as Timestamp).toDate().toIso8601String();
      }
      return PostDto.fromJson(data);
    }).toList();
  }
}

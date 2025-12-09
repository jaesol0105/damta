import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:damta/data/data_source/post_data_source.dart';
import 'package:damta/data/dto/post_dto.dart';

class PostDataSourceImpl implements PostDataSource {
  PostDataSourceImpl(this.firestore);
  final FirebaseFirestore firestore;

  @override
  Future<void> addPost(PostDto postDto) {
    // TODO: implement addPost
    throw UnimplementedError();
  }

  @override
  Future<void> deletePost(String pId) {
    // TODO: implement deletePost
    throw UnimplementedError();
  }

  @override
  Future<List<PostDto>> getAllPosts() async {
    final snapshot = await firestore.collection('post').get();
    return snapshot.docs.map((doc) {
      final data = doc.data();
      // Firestore Timestamp를 DateTime으로 변환
      if (data['p_created_at'] is Timestamp) {
        data['p_created_at'] = (data['p_created_at'] as Timestamp)
            .toDate()
            .toIso8601String();
      }
      return PostDto.fromJson(data);
    }).toList();
  }

  @override
  Future<void> updatePost(PostDto postDto) {
    // TODO: implement updatePost
    throw UnimplementedError();
  }
}

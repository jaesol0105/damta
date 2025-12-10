import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:damta/data/data_source/post_data_source.dart';
import 'package:damta/data/dto/post_dto.dart';

class PostDataSourceImpl implements PostDataSource {
  PostDataSourceImpl(this.firestore);
  final FirebaseFirestore firestore;

  @override
  Future<void> addPost(PostDto postDto) async {
    final json = postDto.toJson();
    // p_id는 Firestore 문서 ID로 사용되므로 JSON에서 제거
    final pId = json.remove('p_id') as String?;

    // DateTime을 ISO8601 문자열로 변환
    if (json['p_created_at'] is DateTime) {
      json['p_created_at'] = (json['p_created_at'] as DateTime)
          .toIso8601String();
    }

    if (pId != null && pId.isNotEmpty) {
      // pId가 있으면 해당 ID로 문서 생성
      await firestore.collection("post").doc(pId).set(json);
    } else {
      // pId가 없으면 Firestore가 자동으로 ID 생성
      await firestore.collection("post").add(json);
    }
  }

  @override
  Future<void> deletePost(String pId) async {
    await firestore.collection("post").doc(pId).delete();
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
        data['p_created_at'] = (data['p_created_at'] as Timestamp)
            .toDate()
            .toIso8601String();
      }
      return PostDto.fromJson(data);
    }).toList();
  }

  @override
  Future<void> updatePost(PostDto postDto) {
    if (postDto.pId == null) {
      throw ArgumentError('pId cannot be null for update');
    }

    final json = postDto.toJson();
    // 불변 필드 제거 (문서 ID, 생성 시간, 사용자 ID는 업데이트하지 않음)
    json.remove('p_id');
    json.remove('p_created_at');
    json.remove('u_id');

    return firestore.collection("post").doc(postDto.pId).update(json);
  }
}

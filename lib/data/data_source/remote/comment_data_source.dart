import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:damta/core/util/nick_name_generator.dart';
import 'package:damta/data/dto/comment_dto.dart';

abstract interface class CommentDataSource {
  Future<List<CommentDto>> getAllComments();
  Future<void> addComment(CommentDto commentDto);
  Future<void> updateComment(CommentDto commentDto);
  Future<void> deleteComment(String cId);
}

class CommentDataSourceImpl implements CommentDataSource {
  CommentDataSourceImpl(this.firestore);
  final FirebaseFirestore firestore;

  @override
  Future<void> addComment(CommentDto commentDto) async {
    final docRef = firestore.collection("comment").doc();
    final json = commentDto
        .copyWith(cId: docRef.id, cWriter: NicknameGenerator.generate())
        .toJson();
    await docRef.set(json);
  }

  @override
  Future<void> deleteComment(String cId) async {
    await firestore.collection("comment").doc(cId).delete();
  }

  @override
  Future<List<CommentDto>> getAllComments() async {
    final snapshot = await firestore.collection("comment").get();
    return snapshot.docs.map((doc) {
      final data = doc.data();
      // 문서 ID를 c_id로 추가
      data['c_id'] = doc.id;
      // Firestore Timestamp를 DateTime으로 변환
      if (data['c_created_at'] is Timestamp) {
        data['c_created_at'] = (data['c_created_at'] as Timestamp)
            .toDate()
            .toIso8601String();
      }
      return CommentDto.fromJson(data);
    }).toList();
  }

  @override
  Future<void> updateComment(CommentDto commentDto) async {
    if (commentDto.cId == null) {
      throw ArgumentError('cId cannot be null for update');
    }

    final json = commentDto.toJson();
    // 불변 필드 제거 (문서 ID, 생성 시간, 사용자 ID는 업데이트하지 않음)
    json.remove('c_id');
    json.remove('c_created_at');
    json.remove('u_id');

    return firestore.collection("comment").doc(commentDto.cId).update(json);
  }
}

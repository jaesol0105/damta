import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:damta/core/util/nick_name_generator.dart';
import 'package:damta/data/dto/comment_dto.dart';

abstract interface class CommentDataSource {
  /// 특정 게시글의 댓글 조회
  Future<List<CommentDto>> getCommentsByPostId(String pId);

  /// 댓글 추가
  Future<void> addComment(CommentDto commentDto);

  /// 댓글 수정
  Future<void> updateComment(CommentDto commentDto);

  /// 댓글 삭제
  Future<void> deleteComment(String cId, String pId);
}

class CommentDataSourceImpl implements CommentDataSource {
  CommentDataSourceImpl(this.firestore);
  final FirebaseFirestore firestore;

  /// Firestore document을 DTO로 변환
  CommentDto _parseDoc(QueryDocumentSnapshot<Map<String, dynamic>> doc) {
    final data = Map<String, dynamic>.from(doc.data());
    data['c_id'] = doc.id;
    return CommentDto.fromJson(data);
  }

  @override
  Future<List<CommentDto>> getCommentsByPostId(String pId) async {
    final snapshot = await firestore
        .collection('comment')
        .where('p_id', isEqualTo: pId)
        .orderBy('c_created_at')
        .get();
    return snapshot.docs.map(_parseDoc).toList();
  }

  @override
  Future<void> addComment(CommentDto commentDto) async {
    final docRef = firestore.collection('comment').doc();
    final json = commentDto
        .copyWith(cId: docRef.id, cWriter: NicknameGenerator.generate())
        .toJson();
    json['c_created_at'] = FieldValue.serverTimestamp();
    // post, comment 배치로 묶어서 실행. 쓰기 원자성 확보
    final batch = firestore.batch();
    batch.set(docRef, json);
    batch.update(firestore.collection('post').doc(commentDto.pId), {
      'comment_count': FieldValue.increment(1), // 원자적 증가
    });
    await batch.commit();
  }

  @override
  Future<void> deleteComment(String cId, String pId) async {
    final batch = firestore.batch();
    batch.delete(firestore.collection('comment').doc(cId));
    batch.update(firestore.collection('post').doc(pId), {
      'comment_count': FieldValue.increment(-1),
    });
    await batch.commit();
  }

  @override
  Future<void> updateComment(CommentDto commentDto) async {
    if (commentDto.cId == null) {
      throw ArgumentError('cId cannot be null for update');
    }
    final json = commentDto.toJson();
    json.remove('c_id');
    json.remove('c_created_at');
    json.remove('u_id');
    return firestore.collection('comment').doc(commentDto.cId).update(json);
  }
}

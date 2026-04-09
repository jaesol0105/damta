import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:damta/core/logger/log.dart';
import 'package:damta/core/util/nick_name_generator.dart';
import 'package:damta/data/dto/post_dto.dart';

abstract interface class PostDataSource {
  /// 해당 학교의 post 목록 조회
  Future<List<PostDto>> getPosts({String? schoolCode});

  /// 특정 post 1개 조회
  Future<PostDto?> getPost(String pId);

  /// 해당 학교에 post 추가
  Future<PostDto> addPost(PostDto post, {String? schoolCode});

  /// post 내용 수정
  Future<void> updatePostContent(PostDto post);

  /// post 삭제
  Future<void> deletePost(String id);

  /// 조회수 증가
  Future<void> incrementViewCount(String pId);

  /// 이모지 반응 추가
  Future<void> addReaction(String pId, String userId, String emoji);

  /// 이모지 반응 취소
  Future<void> removeReaction(String pId, String userId, String emoji);
}

class PostDataSourceImpl implements PostDataSource {
  PostDataSourceImpl(this.firestore);
  final FirebaseFirestore firestore;

  // Firestore 스냅샷을 PostDTO list로 변환
  List<PostDto> _parseDocs(
    List<QueryDocumentSnapshot<Map<String, dynamic>>> docs,
  ) {
    // 숨겨진 글 제외한 리스트 반환
    return docs.where((doc) => doc.data()['is_hidden'] != true).map((doc) {
      final data = Map<String, dynamic>.from(doc.data());
      data['p_id'] = doc.id;

      // DTO에 맞게 Map<String, String>으로 변환
      if (data['reactions'] is Map) {
        data['reactions'] = (data['reactions'] as Map<String, dynamic>).map(
          (k, v) => MapEntry(k, v.toString()),
        );
      }
      return PostDto.fromJson(data);
    }).toList();
  }

  // Firestore 스냅샷을 PostDTO로 변환
  PostDto? _parseDocSnapshot(DocumentSnapshot<Map<String, dynamic>> doc) {
    // 존재하지 않을 경우 null-safe 처리
    if (!doc.exists || doc.data() == null) return null;
    final data = Map<String, dynamic>.from(doc.data()!);
    data['p_id'] = doc.id;
    if (data['reactions'] is Map) {
      data['reactions'] = (data['reactions'] as Map<String, dynamic>).map(
        (k, v) => MapEntry(k, v.toString()),
      );
    }
    return PostDto.fromJson(data);
  }

  @override
  Future<List<PostDto>> getPosts({String? schoolCode}) async {
    Query<Map<String, dynamic>> query = firestore.collection('post');
    if (schoolCode != null) {
      query = query.where('school_code', isEqualTo: schoolCode);
    }
    final snapshot = await query
        .orderBy('p_created_at', descending: true)
        .get();
    return _parseDocs(snapshot.docs);
  }

  @override
  Future<PostDto?> getPost(String pId) async {
    final doc = await firestore.collection('post').doc(pId).get();
    return _parseDocSnapshot(doc);
  }

  @override
  Future<PostDto> addPost(PostDto post, {String? schoolCode}) async {
    try {
      final ref = await firestore.collection('post').add({
        'u_id': post.uId,
        'p_title': post.pTitle,
        'p_content': post.pContent,
        'p_image_url': post.pImageUrl ?? '',
        if (schoolCode != null) 'school_code': schoolCode,
        'p_created_at': FieldValue.serverTimestamp(),
        'p_writer': NicknameGenerator.generate(), // 랜덤 닉네임
        'view_count': 0,
        'comment_count': 0,
        'reactions': <String, String>{},
      });
      return post.copyWith(pId: ref.id);
    } on FirebaseException catch (e, s) {
      Log.e('Firebase addPost 실패: ${e.message}', error: e, stackTrace: s);
      rethrow;
    } catch (e, s) {
      Log.e('알 수 없는 addPost 실패: $e', error: e, stackTrace: s);
      rethrow;
    }
  }

  @override
  Future<void> updatePostContent(PostDto post) async {
    try {
      // 내용만 수정. 조회수,이모지 등 메타 데이터는 건드리지 않음
      await firestore.collection('post').doc(post.pId).update({
        'p_title': post.pTitle,
        'p_content': post.pContent,
        'p_image_url': post.pImageUrl ?? '',
      });
    } on FirebaseException catch (e, s) {
      Log.e(
        'Firebase updatePostContent 실패: ${e.message}',
        error: e,
        stackTrace: s,
      );
      rethrow;
    } catch (e, s) {
      Log.e('알 수 없는 updatePostContent 실패: $e', error: e, stackTrace: s);
      rethrow;
    }
  }

  @override
  Future<void> deletePost(String id) async {
    try {
      await firestore.collection('post').doc(id).delete();
    } on FirebaseException catch (e, s) {
      Log.e('Firebase deletePost 실패: ${e.message}', error: e, stackTrace: s);
      rethrow;
    } catch (e, s) {
      Log.e('알 수 없는 deletePost 실패: $e', error: e, stackTrace: s);
      rethrow;
    }
  }

  @override
  Future<void> incrementViewCount(String pId) async {
    try {
      await firestore.collection('post').doc(pId).update({
        'view_count': FieldValue.increment(1),
      });
    } on FirebaseException catch (e, s) {
      Log.e(
        'Firebase incrementViewCount 실패: ${e.message}',
        error: e,
        stackTrace: s,
      );
      rethrow;
    } catch (e, s) {
      Log.e('알 수 없는 incrementViewCount 실패: $e', error: e, stackTrace: s);
      rethrow;
    }
  }

  @override
  Future<void> addReaction(String pId, String userId, String emoji) async {
    try {
      // userId_emoji를 key로 사용해서 유저당 여러 반응 가능 & 같은 이모지 중복 방지
      // 키: userId_emoji, 값: 생성 시간 (정렬에 사용)
      await firestore.collection('post').doc(pId).update({
        'reactions.${userId}_$emoji': DateTime.now().millisecondsSinceEpoch
            .toString(),
      });
    } on FirebaseException catch (e, s) {
      Log.e('Firebase addReaction 실패: ${e.message}', error: e, stackTrace: s);
      rethrow;
    } catch (e, s) {
      Log.e('알 수 없는 addReaction 실패: $e', error: e, stackTrace: s);
      rethrow;
    }
  }

  @override
  Future<void> removeReaction(String pId, String userId, String emoji) async {
    try {
      await firestore.collection('post').doc(pId).update({
        'reactions.${userId}_$emoji': FieldValue.delete(),
      });
    } on FirebaseException catch (e, s) {
      Log.e(
        'Firebase removeReaction 실패: ${e.message}',
        error: e,
        stackTrace: s,
      );
      rethrow;
    } catch (e, s) {
      Log.e('알 수 없는 removeReaction 실패: $e', error: e, stackTrace: s);
      rethrow;
    }
  }
}

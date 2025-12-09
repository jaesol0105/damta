import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:damta/data/data_source/notification_data_source.dart';
import 'package:damta/data/dto/notification_dto.dart';

class NotificationDataSourceImpl implements NotificationDataSource {
  const NotificationDataSourceImpl(this.firestore);
  final FirebaseFirestore firestore;

  @override // R
  Future<List<NotificationDto>> getNotis(String uId) async {
    final snapshot = await firestore
        .collection('notification')
        .where('uId', isEqualTo: uId)
        .orderBy('createdAt', descending: true)
        .limit(15)
        .get();
    return snapshot.docs
        .map((doc) => NotificationDto.fromJson(doc.data()))
        .toList();
  }

  @override // R+
  Future<List<NotificationDto>> getMoreNotis(
    String uId,
    NotificationDto lastNoti,
  ) async {
    final snapshot = await firestore
        .collection('notification')
        .where('uId', isEqualTo: uId)
        .orderBy('createdAt', descending: true)
        .startAfter([lastNoti.createdAt])
        .limit(15)
        .get();
    return snapshot.docs
        .map((doc) => NotificationDto.fromJson(doc.data()))
        .toList();
  }

  @override // C
  Future<void> addNoti(NotificationDto noti) async {
    final coll = firestore.collection('notification');

    // 같은 postId의 알림 가져오기
    final snapshot = await coll
        .where('pId', isEqualTo: noti.pId)
        .where('isComment', isEqualTo: noti.isComment)
        .get();

    List<NotificationDto> existing = snapshot.docs
        .map((doc) => NotificationDto.fromJson(doc.data()))
        .toList();

    // 새로운 댓글/이모지 합치기
    List<NotificationDto> newItems = [...existing, noti];

    if (newItems.length >= 5) {
      // 5개 이상이면 합쳐서 하나로
      final merged = NotificationDto(
        nId: existing.isNotEmpty ? existing.first.nId : coll.doc().id,
        uId: noti.uId,
        pId: noti.pId,
        pTitle: noti.pTitle,
        createdAt: newItems.first.createdAt,
        isComment: noti.isComment,
        content: noti.isComment
            ? "${newItems.length}개의 새로운 댓글"
            : "${newItems.length}개의 새로운 반응",
        isNew: true,
        isRead: false,
      );

      // 기존 알림 삭제
      for (var e in existing) {
        await coll.doc(e.nId).delete();
      }

      // 합친 알림 저장
      await coll.doc(merged.nId).set(merged.toJson());
    } else {
      // 5개 미만이면 그냥 새로 추가
      final docRef = coll.doc();
      final newDto = noti.copyWith(nId: docRef.id);
      await docRef.set(newDto.toJson());
    }
  }

  @override // U
  Future<void> updateNotis(List<NotificationDto> notis) async {
    final batch = firestore.batch();
    for (var noti in notis) {
      final docRef = firestore.collection('notification').doc(noti.nId);
      final doc = await docRef.get();
      if (doc.exists) {
        batch.update(docRef, noti.toJson());
      }
    }
    await batch.commit();
  }

  @override // D
  Future<void> deleteNoti(String nId) async {
    await firestore.collection('notification').doc(nId).delete();
  }
}

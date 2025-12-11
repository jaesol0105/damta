import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:damta/data/data_source/remote/notification_data_source.dart';
import 'package:damta/data/dto/notification_dto.dart';

class NotificationDataSourceImpl implements NotificationDataSource {
  const NotificationDataSourceImpl(this.firestore);
  final FirebaseFirestore firestore;

  @override // R
  Future<List<NotificationDto>> getNotis(String uId) async {
    final snapshot = await firestore
        .collection('notification')
        .where('uId', isEqualTo: uId)
        .orderBy('nCreatedAt', descending: true)
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
        .orderBy('nCreatedAt', descending: true)
        .startAfter([lastNoti.nCreatedAt])
        .limit(15)
        .get();
    return snapshot.docs
        .map((doc) => NotificationDto.fromJson(doc.data()))
        .toList();
  }

  @override // C
  Future<NotificationDto> addNoti(NotificationDto noti) async {
    final ref = await firestore.collection('notification').add({
      ...noti.toJson(),
      'nId': '', // 임시
      'nCreatedAt': FieldValue.serverTimestamp(),
    });
    // 문서 생성 후 nId 업데이트
    await ref.update({'nId': ref.id});
    return noti.copyWith(nId: ref.id);
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

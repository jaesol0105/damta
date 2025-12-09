import 'package:cloud_functions/cloud_functions.dart';
import 'package:damta/domain/entity/notification_entity.dart';
import 'package:damta/domain/repository/notification_repository.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_riverpod/legacy.dart';

class NotificationViewModel extends StateNotifier<List<NotificationEntity>> {
  NotificationViewModel({required this.repo, required this.uId}) : super([]) {
    initFCM();
    getNotis();
  }

  final NotificationRepository repo;
  final String uId;

  // FCM 초기화
  Future<void> initFCM() async {
    FirebaseMessaging.onMessage.listen((message) async {
      final entity = convertMessageToEntity(message);
      await repo.addNoti(entity);
      state = await repo.getNotis(uId);
    });

    FirebaseMessaging.onMessageOpenedApp.listen((message) async {
      final pId = message.data['pId'];
      if (pId != null) {
        await markAsRead(pId);
      }
    });
  }

  NotificationEntity convertMessageToEntity(RemoteMessage msg) {
    return NotificationEntity(
      nId: '',
      uId: uId,
      pId: msg.data['pId'] ?? '',
      pTitle: msg.data['pTitle'] ?? '',
      createdAt: DateTime.now(),
      isComment: msg.data['isComment'] == 'true',
      content: msg.notification?.body ?? '',
      isNew: true,
      isRead: false,
    );
  }

  // 내 전체 알림 목록 가져오기
  Future<void> getNotis() async {
    state = await repo.getNotis(uId);
  }

  // 추가 알림 목록 가져오기
  Future<void> getMoreNotis() async {
    if (state.isEmpty) return;
    final lastNoti = state.last;
    final moreNotis = await repo.getMoreNotis(uId, lastNoti);
    state = [...state, ...moreNotis];
  }

  // 알림 추가 + FCM 발송
  Future<void> addNoti(NotificationEntity noti) async {
    await repo.addNoti(noti);

    await FirebaseFunctions.instanceFor(
      region: "asia-northeast3",
    ).httpsCallable("sendPushNotification").call({
      "uId": noti.uId,
      "pId": noti.pId,
      "pTitle": noti.pTitle,
      "content": noti.content,
      "isComment": noti.isComment,
    });

    state = await repo.getNotis(uId);
  }

  // 알림 삭제
  Future<void> deleteNotis(String pId) async {
    final toDelete = state.where((n) => n.pId == pId).toList();
    state = state.where((n) => n.pId != pId).toList();

    for (var n in toDelete) {
      await repo.deleteNoti(n.nId);
    }
  }

  // 특정 알림 읽음 처리
  Future<void> markAsRead(String pId) async {
    final updatedList = state.map((n) {
      if (n.pId == pId) {
        return n.copyWith(isRead: true, isNew: false);
      }
      return n;
    }).toList();
    await repo.updateNotis(updatedList);
    state = updatedList;
  }

  // 전체 알림 읽음 처리 + 새로고침 시 DB 반영 후 목록 재조회
  Future<void> markAsReadAll() async {
    if (state.isEmpty) return;
    final updatedList = state
        .map((n) => n.copyWith(isRead: true, isNew: false))
        .toList();
    await repo.updateNotis(updatedList);
    await getNotis();
  }
}

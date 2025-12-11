import 'package:cloud_functions/cloud_functions.dart';
import 'package:damta/core/di/provider.dart';
import 'package:damta/domain/entity/notification_entity.dart';
import 'package:damta/domain/repository/notification_repository.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'notification_view_model.g.dart';

@riverpod
class NotificationViewModel extends _$NotificationViewModel {
  late final NotificationRepository repo;
  late final String uId;

  @override
  FutureOr<List<NotificationEntity>> build({required String uId}) {
    repo = ref.watch(notificationRepositoryProvider);
    this.uId = uId;

    initFCM();
    return getNotis();
  }

  // FCM 초기화
  void initFCM() {
    FirebaseMessaging.onMessage.listen((message) async {
      final entity = convertMessageToEntity(message);
      await repo.addNoti(entity);
      state = AsyncValue.data(await repo.getNotis(uId));
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
      pTitle: msg.data['pTitle'] ?? msg.notification?.title ?? '',
      nCreatedAt: DateTime.now(),
      isComment: msg.data['isComment'] == 'true',
      content: msg.notification?.body ?? msg.data['content'] ?? '',
      isNew: true,
      isRead: false,
    );
  }

  // 내 전체 알림 목록 가져오기
  Future<List<NotificationEntity>> getNotis() async {
    final list = await repo.getNotis(uId);
    state = AsyncValue.data(list);
    return list;
  }

  // 추가 알림 목록 가져오기
  Future<void> getMoreNotis() async {
    if (state.value == null || state.value!.isEmpty) return;

    final lastNoti = state.value!.last;
    final moreNotis = await repo.getMoreNotis(uId, lastNoti);

    if (moreNotis.isEmpty) return;

    final existingNIds = state.value!.map((n) => n.nId).toSet();
    final filteredMoreNotis = moreNotis
        .where((n) => !existingNIds.contains(n.nId))
        .toList();

    if (filteredMoreNotis.isEmpty) return;

    state = AsyncValue.data([...state.value!, ...filteredMoreNotis]);
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

    state = AsyncValue.data(await repo.getNotis(uId));
  }

  // 알림 삭제
  Future<void> deleteNotis(String nId) async {
    if (state.value == null) return;

    state = AsyncValue.data(state.value!.where((n) => n.nId != nId).toList());
    await repo.deleteNoti(nId);
  }

  // 특정 알림 읽음 처리
  Future<void> markAsRead(String pId) async {
    if (state.value == null) return;

    final updatedList = state.value!.map((n) {
      if (n.pId == pId) return n.copyWith(isRead: true, isNew: false);
      return n;
    }).toList();

    await repo.updateNotis(updatedList);
    state = AsyncValue.data(updatedList);
  }

  // 전체 알림 읽음 처리
  Future<void> markAsReadAll() async {
    if (state.value == null || state.value!.isEmpty) return;

    final updatedList = state.value!
        .map((n) => n.copyWith(isRead: true, isNew: false))
        .toList();
    await repo.updateNotis(updatedList);
    state = AsyncValue.data(updatedList);
  }
}

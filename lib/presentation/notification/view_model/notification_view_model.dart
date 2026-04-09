import 'dart:async';
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

  // FCM listener 관리용 StreamSubscription
  StreamSubscription<RemoteMessage>? _fcmSub;
  StreamSubscription<RemoteMessage>? _openedSub;

  @override
  FutureOr<List<NotificationEntity>> build({required String uId}) {
    repo = ref.watch(notificationRepositoryProvider);
    this.uId = uId;

    initFCM();
    return getNotis();
  }

  // FCM 초기화 + 안전한 dispose 처리
  void initFCM() {
    // 기존 listener가 있다면 먼저 정리 (중복 방지)
    _fcmSub?.cancel();
    _openedSub?.cancel();

    // Foreground 메시지 수신 > 알림 목록 갱신
    _fcmSub = FirebaseMessaging.onMessage.listen((message) async {
      if (!ref.mounted) return;

      // Firestore 최신 상태로 갱신
      final latestNotis = await repo.getNotis(uId);

      if (!ref.mounted) return;
      state = AsyncValue.data(latestNotis);
    });

    // 알림 클릭 처리
    _openedSub = FirebaseMessaging.onMessageOpenedApp.listen((message) async {
      if (!ref.mounted) return;

      final pId = message.data['pId'];
      if (pId != null) {
        await markAsRead(pId);
      }
    });

    // Provider dispose 시 listener 해제
    ref.onDispose(() {
      _fcmSub?.cancel();
      _openedSub?.cancel();
    });
  }

  // 내 전체 알림 목록 가져오기
  Future<List<NotificationEntity>> getNotis() async {
    final list = await repo.getNotis(uId);

    if (!ref.mounted) return list;
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

    if (!ref.mounted) return;
    state = AsyncValue.data([...state.value!, ...filteredMoreNotis]);
  }

  // 알림 추가
  Future<void> addNoti(NotificationEntity noti) async {
    await repo.addNoti(noti);

    final list = await repo.getNotis(uId);

    if (!ref.mounted) return;
    state = AsyncValue.data(list);
  }

  // 알림 삭제
  Future<void> deleteNotis(String nId) async {
    if (state.value == null) return;

    final currentList = state.value!;

    // 삭제 대상 알림 찾기
    final target = currentList.firstWhere(
      (n) => n.nId == nId,
      orElse: () => throw Exception("알림 없음"),
    );

    // 읽지 않은 상태라면 > 읽음 처리 (배지)
    if (!target.isRead) {
      final updatedList = currentList.map((n) {
        if (n.nId == nId) {
          return n.copyWith(isRead: true, isNew: false);
        }
        return n;
      }).toList();
      await repo.updateNotis(updatedList);
    }

    // UI에서 즉시 제거
    state = AsyncValue.data(currentList.where((n) => n.nId != nId).toList());

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

    if (!ref.mounted) return;
    state = AsyncValue.data(updatedList);
  }

  // 전체 알림 읽음 처리
  Future<void> markAsReadAll() async {
    if (state.value == null || state.value!.isEmpty) return;

    final updatedList = state.value!
        .map((n) => n.copyWith(isRead: true, isNew: false))
        .toList();

    await repo.updateNotis(updatedList);

    if (!ref.mounted) return;
    state = AsyncValue.data(updatedList);
  }
}

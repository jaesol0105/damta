import 'package:damta/domain/entity/notification_entity.dart';

abstract interface class NotificationRepository {
  Future<List<NotificationEntity>> getNotis(String uId);

  Future<List<NotificationEntity>> getMoreNotis(
    String uId,
    NotificationEntity lastNoti,
  );

  Future<void> addNoti(NotificationEntity noti);

  Future<void> updateNotis(List<NotificationEntity> notis);

  Future<void> deleteNoti(String nId);
}

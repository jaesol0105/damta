import 'package:damta/data/dto/notification_dto.dart';

abstract interface class NotificationDataSource {
  Future<List<NotificationDto>> getNotis(String uId);
  Future<List<NotificationDto>> getMoreNotis(
    String uId,
    NotificationDto lastNoti,
  );
  Future<void> addNoti(NotificationDto noti);

  Future<void> updateNotis(List<NotificationDto> notis);

  Future<void> deleteNoti(String nId);
}

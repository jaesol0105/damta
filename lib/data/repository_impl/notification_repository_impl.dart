import 'package:damta/data/data_source/remote/notification_data_source.dart';
import 'package:damta/data/mapper/notification_mapper.dart';
import 'package:damta/domain/entity/notification_entity.dart';
import 'package:damta/domain/repository/notification_repository.dart';

class NotificationRepositoryImpl implements NotificationRepository {
  const NotificationRepositoryImpl(this.dataSource);
  final NotificationDataSource dataSource;

  @override
  Future<List<NotificationEntity>> getNotis(String uId) async {
    final dtos = await dataSource.getNotis(uId);
    return dtos.map(dtoToEntity).toList();
  }

  @override
  Future<List<NotificationEntity>> getMoreNotis(String uId, NotificationEntity lastNoti) async {
    final dtos = await dataSource.getMoreNotis(uId, entityToDto(lastNoti));
    return dtos.map(dtoToEntity).toList();
  }

  @override
  Future<void> addNoti(NotificationEntity noti) async {
    await dataSource.addNoti(entityToDto(noti));
  }

  @override
  Future<void> updateNotis(List<NotificationEntity> notis) async {
    await dataSource.updateNotis(notis.map(entityToDto).toList());
  }

  @override
  Future<void> deleteNoti(String nId) async {
    await dataSource.deleteNoti(nId);
  }
}

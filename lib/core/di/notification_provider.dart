import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:damta/data/data_source/notification_data_source.dart';
import 'package:damta/data/data_source_impl/notification_data_source_impl.dart';
import 'package:damta/data/repository_impl/notification_repository_impl.dart';
import 'package:damta/domain/entity/notification_entity.dart';
import 'package:damta/domain/repository/notification_repository.dart';
import 'package:damta/presentation/view_model/notification_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

// FirebaseFirestore Provider
final firebaseFirestoreProvider = Provider<FirebaseFirestore>(
  (_) => FirebaseFirestore.instance,
);

// DataSource Provider
final notificationDataSourceProvider = Provider<NotificationDataSource>(
  (ref) => NotificationDataSourceImpl(ref.read(firebaseFirestoreProvider)),
);

// Repository Provider
final notificationRepositoryProvider = Provider<NotificationRepository>(
  (ref) => NotificationRepositoryImpl(ref.read(notificationDataSourceProvider)),
);

// ViewModel Provider
final notificationViewModelProvider =
    StateNotifierProvider.family<
      NotificationViewModel,
      List<NotificationEntity>,
      String
    >((ref, uId) {
      final repo = ref.watch(notificationRepositoryProvider);
      return NotificationViewModel(repo: repo, uId: uId);
    });

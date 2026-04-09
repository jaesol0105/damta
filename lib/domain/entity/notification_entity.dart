import 'package:freezed_annotation/freezed_annotation.dart';

part 'notification_entity.freezed.dart';

@freezed
abstract class NotificationEntity with _$NotificationEntity {
  const factory NotificationEntity({
    String? nId,
    required String uId, // 사용자 ID (내가 쓴 게시글 알림만 받아오기 위한 변수)
    required String pId, // 해당 게시글 ID
    required String pTitle, // 해당 게시글 제목
    DateTime? nCreatedAt, // 알림 생성 시간
    required bool isComment, // 댓글인지 여부 (true = 댓글, false = 반응)
    required String content, // 댓글,반응 내용
    required bool isNew, // 새로운 알림인지 여부 (댓글 표시 형식 다르게 하기 위한 변수)
    required bool
    isRead, // 알림 읽었는지 여부 (알림 목록에 표시되는 알림이 사라지지 않고, 읽음/안읽음 상태만 바꾸기 위한 변수)
  }) = _NotificationEntity;
}

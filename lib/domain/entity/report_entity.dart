import 'package:damta/domain/enum/report_reason_enum.dart';
import 'package:damta/domain/enum/report_target_type_enum.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'report_entity.freezed.dart';

@freezed
abstract class ReportEntity with _$ReportEntity {
  const factory ReportEntity({
    String? rId,
    required String reporterUid, // 신고한 유저
    required ReportTargetType targetType, // 신고 타입 (게시글, 댓글)
    required String targetId, // 게시글, 댓글 id
    required String targetUid, // 그걸 쓴 유저 id
    required ReportReason reason, // 신고 이유
    required String schoolCode, // 학교 코드
    required DateTime rCreatedAt, // 생성 시간
  }) = _ReportEntity;
}

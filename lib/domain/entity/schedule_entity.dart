import 'package:freezed_annotation/freezed_annotation.dart';

part 'schedule_entity.freezed.dart';

@freezed
abstract class ScheduleEntity with _$ScheduleEntity {
  const factory ScheduleEntity({
    required DateTime date,
    required String eventName,
    required List<int> grades, // 해당 학년 리스트, 빈 리스트면 전체 학년 대상
  }) = _ScheduleEntity;

  const ScheduleEntity._();

  /// 학년 정보를 문자열로 변환 "(2,3학년)" 형태
  String? get gradeText {
    if (grades.isEmpty) return null; // 전체 학년이면 표시 안 함
    return '(${grades.join(',')}학년)';
  }
}

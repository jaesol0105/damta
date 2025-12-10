import 'package:damta/core/extension/date_time_extension.dart';
import 'package:damta/domain/entity/time_table_entity.dart';

/// SQLite 에 저장되는 시간표 캐시 모델
class TimeTableCacheModel {
  final int? id;
  final String schoolCode;
  final String date; // yyyy-MM-dd 형식
  final String grade; // 학년
  final String classes; // 학급명(반)
  final String period; // 교시
  final String subject; // 수업내용
  final int cachedAt; // Unix timestamp (밀리초)

  TimeTableCacheModel({
    this.id,
    required this.schoolCode,
    required this.date,
    required this.grade,
    required this.classes,
    required this.period,
    required this.subject,
    required this.cachedAt,
  });

  // CacheModel > DB Map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'school_code': schoolCode,
      'date': date,
      'grade': grade,
      'classes': classes,
      'period': period,
      'subject': subject,
      'cached_at': cachedAt,
    };
  }

  // DB Map > CacheModel
  factory TimeTableCacheModel.fromMap(Map<String, dynamic> map) {
    return TimeTableCacheModel(
      id: map['id'] as int?,
      schoolCode: map['school_code'] as String,
      date: map['date'] as String,
      grade: map['grade'] as String,
      classes: map['classes'] as String,
      period: map['period'] as String,
      subject: map['subject'] as String,
      cachedAt: map['cached_at'] as int,
    );
  }

  // CacheModel > Entity
  TimeTableEntity toDomain() {
    return TimeTableEntity(
      date: DateTime.parse(date),
      grade: int.parse(grade),
      classes: int.parse(classes),
      period: int.parse(period),
      subject: subject,
    );
  }

  // Entity > CacheModel
  factory TimeTableCacheModel.fromDomain({
    required TimeTableEntity entity,
    required String schoolCode,
  }) {
    return TimeTableCacheModel(
      schoolCode: schoolCode,
      date: entity.date.dbDate(),
      grade: entity.grade.toString(),
      classes: entity.classes.toString(),
      period: entity.period.toString(),
      subject: entity.subject,
      cachedAt: DateTime.now().millisecondsSinceEpoch,
    );
  }
}

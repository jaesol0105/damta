import 'dart:convert';

import 'package:damta/data/util/extension/date_time_extension.dart';
import 'package:damta/domain/entity/schedule_entity.dart';

class ScheduleCacheDTO {
  final int? id;
  final String schoolCode;
  final String date; // yyyy-MM-dd 형식
  final String eventName; // 일정 명
  final String gradesJson; // 학년 - JSON 문자열로 저장
  final int cachedAt; // Unix timestamp (밀리초)
  /// SQLite에 저장되는 학사일정 캐시 모델
  ScheduleCacheDTO({
    this.id,
    required this.schoolCode,
    required this.date,
    required this.eventName,
    required this.gradesJson,
    required this.cachedAt,
  });

  // ScheduleCacheDTO를 DB Map으로 변롼
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'school_code': schoolCode,
      'date': date,
      'event_name': eventName,
      'grades_json': gradesJson,
      'cached_at': cachedAt,
    };
  }

  // DB Map을 ScheduleCacheDTO로 변환
  factory ScheduleCacheDTO.fromMap(Map<String, dynamic> map) {
    return ScheduleCacheDTO(
      id: map['id'] as int?,
      schoolCode: map['school_code'] as String,
      date: map['date'] as String,
      eventName: map['event_name'] as String,
      gradesJson: map['grades_json'] as String,
      cachedAt: map['cached_at'] as int,
    );
  }

  // ScheduleCacheDTO을 ScheduleEntity로 변환
  ScheduleEntity toDomain() {
    final grades = (jsonDecode(gradesJson) as List).cast<int>();
    return ScheduleEntity(date: DateTime.parse(date), eventName: eventName, grades: grades);
  }

  // ScheduleEntity를 ScheduleCacheDTO로 변환
  factory ScheduleCacheDTO.fromDomain({
    required ScheduleEntity entity,
    required String schoolCode,
  }) {
    return ScheduleCacheDTO(
      schoolCode: schoolCode,
      date: entity.date.dbDate(),
      eventName: entity.eventName,
      gradesJson: jsonEncode(entity.grades),
      cachedAt: DateTime.now().millisecondsSinceEpoch,
    );
  }
}

import 'dart:developer';

import 'package:damta/core/extension/date_time_extension.dart';
import 'package:damta/data/data_source/remote/schedule_remote_data_source.dart';
import 'package:damta/data/dto/neis_schedule_dto.dart';
import 'package:dio/dio.dart';

class ScheduleRemoteDataSourceImpl implements ScheduleRemoteDataSource {
  ScheduleRemoteDataSourceImpl(this.dio);

  final Dio dio;

  @override
  Future<List<NeisScheduleDTO>> getSchedules({
    required String officeCode,
    required String schoolCode,
    required DateTime fromDate,
    required DateTime toDate,
  }) async {
    try {
      final start = DateTime.now();
      print('[REMOTE] getMeals 요청 시작: $start');

      final response = await dio
          .get(
            'https://open.neis.go.kr/hub/SchoolSchedule',
            queryParameters: {
              'KEY': '4103adb922cc4da4a01fb1f1a3272344', // NEIS API 키
              'Type': 'json',
              'ATPT_OFCDC_SC_CODE': officeCode, // 시도 교육청 코드
              'SD_SCHUL_CODE': schoolCode, // 학교 코드
              'AA_FROM_YMD': fromDate.neisDate(), // 시작일 (NEIS API 날짜형식)
              'AA_TO_YMD': toDate.neisDate(), // 종료일
              'pSize': 1000, // 한 번에 가져올 최대 개수
            },
          )
          .timeout(const Duration(seconds: 8));

      // 너무 오래걸리는데...
      final end = DateTime.now();
      print('[REMOTE] 응답 수신: $end (소요: ${end.difference(start).inMilliseconds} ms)');

      if (response.statusCode == 200) {
        final data = response.data;
        print('🌈NEIS 학사일정 응답: ${response.data}');

        if (data['SchoolSchedule'] != null) {
          final info = data['SchoolSchedule'] as List; // []안에 {}있는 구조
          final rowField = info.firstWhere((e) => e is Map && e['row'] != null); // 'row' 필드를 가진 Map
          final row = (rowField as Map<String, dynamic>)['row'] as List; // 또 []안에 {}있는 구조
          return row.map((json) => NeisScheduleDTO.fromJson(json as Map<String, dynamic>)).toList();
        }

        // 데이터가 없는 경우 빈 리스트 반환
        return [];
      } else {
        throw Exception('서버 응답 오류 : ${response.statusCode}');
      }
      // 예외 던지기
    } on DioException catch (e, s) {
      log('Network 오류로 인한 getSchedules 실패 : ${e.message}', error: e, stackTrace: s);
      rethrow;
    } catch (e, s) {
      log('알 수 없는 오류로 인한 getSchedules 실패 : $e', error: e, stackTrace: s);
      rethrow;
    }
  }
}

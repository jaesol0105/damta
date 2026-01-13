import 'dart:developer';
import 'package:damta/data/util/extension/date_time_extension.dart';
import 'package:damta/data/dto/neis_time_table_dto.dart';
import 'package:dio/dio.dart';

abstract interface class TimeTableRemoteDataSource {
  Future<List<NeisTimeTableDto>> getTimeTables({
    required String officeCode,
    required String schoolCode,
    required DateTime fromDate,
    required DateTime toDate,
    required String grade,
    required String classes,
  });
}

class TimeTableRemoteDataSourceImpl implements TimeTableRemoteDataSource {
  TimeTableRemoteDataSourceImpl({required this.dio});

  final Dio dio;

  @override
  Future<List<NeisTimeTableDto>> getTimeTables({
    required String officeCode,
    required String schoolCode,
    required DateTime fromDate,
    required DateTime toDate,
    required String grade,
    required String classes,
  }) async {
    try {
      final start = DateTime.now();
      print('[REMOTE] getTimeTables 요청 시작: $start');

      print('1️⃣ misTimetable 중학교 시간표 요청중..');
      final misUrl = 'https://open.neis.go.kr/hub/misTimetable';
      final response = await dio
          .get(
            misUrl,
            queryParameters: {
              'KEY': 'eb85abfd7d4c4946a3c5a264bd242d3c',
              'Type': 'json',
              'ATPT_OFCDC_SC_CODE': officeCode,
              'SD_SCHUL_CODE': schoolCode,
              'TI_FROM_YMD': fromDate.neisDate(),
              'TI_TO_YMD': toDate.neisDate(),
              'GRADE': grade,
              'CLASS_NM': classes,
            },
          )
          .timeout(const Duration(seconds: 8));

      final end = DateTime.now();
      print(
        '[REMOTE] 응답 수신: $end (소요: ${end.difference(start).inMilliseconds} ms)',
      );

      if (response.statusCode == 200) {
        final data = response.data;
        print('🌈NEIS 시간표 정상 응답 (MIS): $data');
        final result = _parseResponse(data);
        print('📝 변환된 DTO 리스트 (MIS): $result');
        if (result.isNotEmpty) return result;

        print('2️⃣ hisTimetable 고등학교 시간표 요청중..');
        final hisUrl = 'https://open.neis.go.kr/hub/hisTimetable';
        final hisResponse = await dio.get(
          hisUrl,
          queryParameters: {
            'KEY': 'eb85abfd7d4c4946a3c5a264bd242d3c',
            'Type': 'json',
            'ATPT_OFCDC_SC_CODE': officeCode,
            'SD_SCHUL_CODE': schoolCode,
            'TI_FROM_YMD': fromDate.neisDate(),
            'TI_TO_YMD': toDate.neisDate(),
            'GRADE': grade,
            'CLASS_NM': classes,
          },
        );

        final hisData = hisResponse.data;
        print('🌈NEIS HIS 시간표 정상 응답: $hisData');
        final hisResult = _parseResponse(hisData);
        print('📝 변환된 HIS DTO 리스트: $hisResult');
        return hisResult;
      } else {
        throw Exception('서버 응답 오류 : ${response.statusCode}');
      }
    } on DioException catch (e, s) {
      log(
        'Network 오류로 인한 getTimeTables 실패 : ${e.message}',
        error: e,
        stackTrace: s,
      );
      rethrow;
    } catch (e, s) {
      log('알 수 없는 오류로 인한 getTimeTables 실패 : $e', error: e, stackTrace: s);
      rethrow;
    }
  }

  // 응답 데이터에서 row 리스트 추출
  List<NeisTimeTableDto> _parseResponse(dynamic data) {
    if (data['misTimetable'] != null) {
      final misTimetable = data['misTimetable'] as List;
      final rowField = misTimetable.firstWhere(
        (e) => e is Map<String, dynamic> && e['row'] != null,
        orElse: () => null,
      );

      if (rowField != null) {
        final rows = (rowField as Map<String, dynamic>)['row'] as List;
        return rows
            .map(
              (json) => NeisTimeTableDto.fromJson(json as Map<String, dynamic>),
            )
            .toList();
      }
    }

    // hisTimetable 응답도 같은 구조로 row 추출 가능
    if (data['hisTimetable'] != null) {
      final hisTimetable = data['hisTimetable'] as List;
      final rowField = hisTimetable.firstWhere(
        (e) => e is Map<String, dynamic> && e['row'] != null,
        orElse: () => null,
      );

      if (rowField != null) {
        final rows = (rowField as Map<String, dynamic>)['row'] as List;
        return rows
            .map(
              (json) => NeisTimeTableDto.fromJson(json as Map<String, dynamic>),
            )
            .toList();
      }
    }

    return [];
  }
}

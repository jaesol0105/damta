import 'package:damta/core/logger/log.dart';
import 'package:damta/data/dto/school_dto.dart';
import 'package:dio/dio.dart';

class SchoolApiDataSource {
  // NEIS API 인증키
  static const String NEIS_API_KEY = '9fbdf57eb7d54c7ba23460844ed3590c';

  // NEIS 학교 정보 API 기본 URL
  static const String BASE_URL = 'https://open.neis.go.kr/hub/schoolInfo';

  final Dio _dio;

  SchoolApiDataSource(this._dio);

  // NEIS API를 통해 학교 이름을 검색, SchoolDto 목록 반환
  Future<List<SchoolDto>> searchSchool(String query) async {
    final Map<String, dynamic> params = {
      'KEY': NEIS_API_KEY,
      'Type': 'json', // JSON 응답 요청
      'pIndex': 1,
      'pSize': 10,
      'SCHUL_NM': query, // 학교 이름 검색어
    };

    try {
      final response = await _dio.get(BASE_URL, queryParameters: params);

      final Map<String, dynamic> responseData = response.data;

      // schoolInfo 섹션이 있는지 확인 (검색 결과가 없거나 오류일 수 있음)
      if (!responseData.containsKey('schoolInfo')) {
        Log.d('!!! NEIS 응답 오류 또는 검색 결과 없음 !!! : schoolInfo 필드 누락');
        return [];
      }

      final List schoolInfoList = responseData['schoolInfo'];

      // 'row' 섹션(실제 학교 데이터 리스트) 추출
      Map<String, dynamic>? rowContainer;
      for (final item in schoolInfoList) {
        if (item is Map<String, dynamic> && item.containsKey('row')) {
          rowContainer = item;
          break; // 첫 번째 'row' 컨테이너를 찾으면 루프 종료
        }
      }

      // rowContainer가 null이면 데이터 없음 (검색 결과 0건)
      if (rowContainer == null || !rowContainer.containsKey('row')) {
        return [];
      }

      final List<dynamic> rowData = rowContainer['row'] as List<dynamic>;

      // SchoolDto로 매핑 (SchoolDto.fromJson 팩토리)
      final List<SchoolDto> schools = rowData
          .map((json) => SchoolDto.fromJson(json as Map<String, dynamic>))
          .toList();

      Log.d('학교 검색 성공 (-_- b) . 결과 수: ${schools.length}');
      return schools;
    } catch (e) {
      Log.e('!!! 학교 검색 중 알 수 없는 오류 발생 !!! : $e');
      return [];
    }
  }
}

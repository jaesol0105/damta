import 'package:damta/core/logger/log.dart';
import 'package:damta/core/services/analytics_service.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:damta/core/services/firebase_service.dart';
import 'package:damta/data/dto/school_dto.dart';
import 'package:damta/data/data_source/remote/school_api_data_source.dart';
import 'package:dio/dio.dart';

class SchoolInputPage extends StatefulWidget {
  const SchoolInputPage({super.key});

  @override
  State<SchoolInputPage> createState() => _SchoolInputPageState();
}

class _SchoolInputPageState extends State<SchoolInputPage> {
  final TextEditingController _controller = TextEditingController();
  List<SchoolDto> _searchResults = [];
  bool _isLoading = false;

  // API 통신 역할 담당 데이터 소스 인스턴스
  late final SchoolApiDataSource _dataSource;

  SchoolDto? _selectedSchool;

  @override
  void initState() {
    super.initState();
    // Dio 인스턴스 생성 및 DataSource 초기화
    _dataSource = SchoolApiDataSource(Dio());
    // 초기에는 검색 결과 없이 시작함!!
    _performSearch('');
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  // 학교 검색 로직 (DataSource 사용)
  void _performSearch(String query) async {
    final trimmedQuery = query.trim();

    // 2글자 미만 검색하지 않음
    if (trimmedQuery.length < 2) {
      setState(() {
        _searchResults = [];
      });
      return;
    }

    // 이미 선택된 학교와 동일한 이름으로 검색하는 경우 중복 실행 방지
    if (_selectedSchool != null &&
        _selectedSchool!.schoolName == trimmedQuery) {
      return;
    }

    setState(() {
      _isLoading = true;
      _searchResults = [];
    });

    try {
      // SchoolApiDataSource로 검색 작업 위임
      final results = await _dataSource.searchSchool(trimmedQuery);
      setState(() {
        _searchResults = results;
        _isLoading = false;
      });
    } catch (e) {
      Log.e('!!! 학교 검색 중 오류 발생 !!! : $e');
      setState(() {
        _isLoading = false;
        // API 오류 발생 시 사용자에게 메시지 표시
        _showErrorDialog("검색 오류", "학교 정보 조회 중 오류가 발생했습니다. 잠시 후 다시 시도해 주세요.");
        _searchResults = [];
      });
    }
  }

  // 학교 선택하고 Firebase 저장
  void _selectSchool(SchoolDto school) async {
    setState(() {
      _selectedSchool = school;
      // 학교 선택 후 검색 결과를 숨기기 위해 컨트롤러 업데이트
      _controller.text = school.schoolName;
      _searchResults = [];
    });

    // Firebase에 학교 정보 저장
    try {
      await FirebaseService.instance.saveSchoolInfo(
        schoolName: school.schoolName,
        officeCode: school.officeCode,
        schoolCode: school.schoolCode,
      );

      // 저장 성공 후 홈 페이지로 이동
      if (mounted) {
        context.go('/home');
      }

      // 📝
      AnalyticsService.event(
        'school_saved',
        p: {'school_name': school.schoolName},
      );
    } catch (e) {
      Log.e('!!! 학교 정보 Firebase 저장 실패!!!: $e');
      _showErrorDialog("저장 오류", "학교 정보 저장 중 오류가 발생했습니다. 다시 시도해 주세요.");
    }
  }

  void _showErrorDialog(String title, String content) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(content),
          actions: <Widget>[
            TextButton(
              child: const Text("확인"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '학교 선택',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // 검색 입력 필드
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: '학교 이름을 입력하세요.',
                      hintStyle: const TextStyle(color: Colors.grey),
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 15.0,
                        horizontal: 10.0,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Colors.blueGrey,
                          width: 3.0,
                        ),
                      ),
                      suffixIcon: null,
                    ),
                    onChanged: _performSearch,
                  ),
                ),
                const SizedBox(width: 8),

                IconButton(
                  icon: const Icon(
                    Icons.search,
                    size: 40,
                    color: Colors.blueGrey,
                  ),
                  onPressed: () => _performSearch(_controller.text),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // 로딩 or 검색 결과 목록
            Expanded(
              child: _isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : _searchResults.isEmpty &&
                        _controller.text.trim().length >= 2
                  ? Center(child: Text("검색 결과가 없습니다: ${_controller.text}"))
                  : _searchResults.isEmpty && _controller.text.trim().isEmpty
                  ? const Center(child: Text("학교 이름을 입력해 주세요."))
                  : ListView.builder(
                      itemCount: _searchResults.length,
                      itemBuilder: (context, index) {
                        final school = _searchResults[index];
                        return Card(
                          margin: const EdgeInsets.only(bottom: 8),
                          child: ListTile(
                            title: Text(
                              school.schoolName,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            // 도로명 주소에서 앞에 두 단어(도.시)만 나옴 + 교육청 코드
                            subtitle: Text(
                              '지역: ${school.location.split(' ')[0]} ${school.location.split(' ')[1]} | 교육청 코드: ${school.officeCode}',
                            ),

                            onTap: () =>
                                _selectSchool(school), // 학교 선택 시 저장 로직 실행
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

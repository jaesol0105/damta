import 'package:damta/core/di/provider.dart';
import 'package:damta/domain/entity/time_table_entity.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'time_table_view_model.g.dart';

const _kSelectedClassKey = 'timetable_selected_class';

class TimeTableState {
  final String selectedClass;
  final DateTime currentMonday;
  final List<TimeTableEntity> list;

  const TimeTableState({
    required this.selectedClass,
    required this.currentMonday,
    required this.list,
  });

  TimeTableState copyWith({
    String? selectedClass,
    DateTime? currentMonday,
    List<TimeTableEntity>? list,
  }) {
    return TimeTableState(
      selectedClass: selectedClass ?? this.selectedClass,
      currentMonday: currentMonday ?? this.currentMonday,
      list: list ?? this.list,
    );
  }

  /// 선택한 반 + 현재 주 필터링된 시간표
  List<TimeTableEntity> get filtered {
    final sp = selectedClass.split("-");
    final grade = int.tryParse(sp[0]) ?? 1;
    final classes = int.tryParse(sp[1]) ?? 1;
    final weekDays = List.generate(
      7,
      (i) => currentMonday.add(Duration(days: i)),
    );

    final weekSet = weekDays
        .map((d) => d.year * 10000 + d.month * 100 + d.day)
        .toSet();

    return list.where((e) {
      if (e.grade != grade || e.classes != classes) return false;
      final dateInt = e.date.year * 10000 + e.date.month * 100 + e.date.day;
      return weekSet.contains(dateInt);
    }).toList();
  }

  /// 오늘 날짜의 시간표. 홈 화면 모듈에서 사용.
  List<TimeTableEntity> get todayEntries {
    final today = DateTime.now();
    return filtered
        .where(
          (e) =>
              e.date.year == today.year &&
              e.date.month == today.month &&
              e.date.day == today.day,
        )
        .toList()
      ..sort((a, b) => a.period.compareTo(b.period));
  }

  /// 시간표 2열 정렬. 홈 화면 모듈에서 사용.
  ({List<String> col1, List<String> col2}) get todayColumns {
    final entries = todayEntries;
    return (
      col1:
          entries // 1~4 교시
              .where((e) => e.period <= 4)
              .map((e) => '${e.period} ${e.subject}')
              .toList(),
      col2:
          entries // 5교시 이상
              .where((e) => e.period > 4)
              .map((e) => '${e.period} ${e.subject}')
              .toList(),
    );
  }

  /// 전체 반 목록 (1-1 ~ 3-10)
  List<String> get classList {
    final List<String> classesList = [];
    for (int g = 1; g <= 3; g++) {
      for (int c = 1; c <= 10; c++) {
        classesList.add("$g-$c");
      }
    }
    return classesList;
  }
}

@riverpod
class TimeTableViewModel extends _$TimeTableViewModel {
  @override
  FutureOr<TimeTableState> build({
    required String officeCode,
    required String schoolCode,
  }) async {
    final now = DateTime.now();
    // 현재 주의 월요일을 계산
    final monday = now.subtract(Duration(days: now.weekday - 1));

    // SharedPreferences에서 마지막으로 선택한 학년-반 불러오기
    final prefs = await SharedPreferences.getInstance();
    final savedClass = prefs.getString(_kSelectedClassKey) ?? '1-1';

    final initialState = TimeTableState(
      selectedClass: savedClass,
      currentMonday: monday,
      list: [],
    );

    // 초기 데이터 로드
    return loadTimeTables(
      officeCode: officeCode,
      schoolCode: schoolCode,
      state: initialState,
    );
  }

  Future<TimeTableState> loadTimeTables({
    required String officeCode,
    required String schoolCode,
    TimeTableState? state,
  }) async {
    // state 없으면 현재 state 사용
    state = state ?? this.state.value!;

    // 로딩 상태로 UI 즉시 갱신
    this.state = AsyncValue.loading();

    try {
      final repo = await ref.read(timeTableRepositoryProvider.future);

      final sp = state.selectedClass.split("-");
      final grade = int.tryParse(sp[0]) ?? 1;
      final classes = int.tryParse(sp[1]) ?? 1;

      final fromDate = state.currentMonday;
      final toDate = fromDate.add(const Duration(days: 6));

      final data = await repo.getTimeTables(
        officeCode: officeCode,
        schoolCode: schoolCode,
        fromDate: fromDate,
        toDate: toDate,
        grade: grade,
        classes: classes,
      );

      final newState = state.copyWith(list: data);

      this.state = AsyncValue.data(newState);
      return newState;
    } catch (e, st) {
      this.state = AsyncValue.error(e, st);
      rethrow;
    }
  }

  // 학년-반 변경
  void changeClass(
    String value, {
    required String officeCode,
    required String schoolCode,
  }) {
    print("Changing class to: $value");
    if (!state.hasValue) return;

    // SharedPreferences에 저장
    SharedPreferences.getInstance().then((prefs) {
      prefs.setString(_kSelectedClassKey, value);
    });

    final current = state.value!;
    final newState = current.copyWith(selectedClass: value);

    loadTimeTables(
      officeCode: officeCode,
      schoolCode: schoolCode,
      state: newState,
    );
  }

  // 이전 주 변경
  void prevWeek({required String officeCode, required String schoolCode}) {
    if (!state.hasValue) return;

    final current = state.value!;
    final newState = current.copyWith(
      currentMonday: current.currentMonday.subtract(const Duration(days: 7)),
    );

    loadTimeTables(
      officeCode: officeCode,
      schoolCode: schoolCode,
      state: newState,
    );
  }

  // 다음 주 변경
  void nextWeek({required String officeCode, required String schoolCode}) {
    if (!state.hasValue) return;

    final current = state.value!;
    final newState = current.copyWith(
      currentMonday: current.currentMonday.add(const Duration(days: 7)),
    );

    loadTimeTables(
      officeCode: officeCode,
      schoolCode: schoolCode,
      state: newState,
    );
  }
}

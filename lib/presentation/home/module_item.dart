import 'package:damta/domain/enum/module_type_enum.dart';
import 'package:damta/domain/enum/module_width_enum.dart';

class ModuleItem {
  final String id; // 아이디
  final ModuleType type; // 모듈 종류
  final ModuleWidth width; // 모듈 너비
  int order; // 순서 (1차원 배열로 정렬)
  bool visible; // 표시 여부. 아직 기능없음
  final String? photoPath; // 사진 모듈용

  ModuleItem({
    required this.id,
    required this.type,
    required this.width,
    required this.order,
    this.visible = true,
    this.photoPath,
  });
}

List<ModuleItem> defaultModules() => [
  ModuleItem(
    id: 'weather',
    type: ModuleType.weather,
    width: ModuleWidth.full,
    order: 0,
  ),
  ModuleItem(
    id: 'lunch',
    type: ModuleType.lunch,
    width: ModuleWidth.half,
    order: 1,
  ),
  ModuleItem(
    id: 'timetable',
    type: ModuleType.timetable,
    width: ModuleWidth.half,
    order: 2,
  ),
  ModuleItem(
    id: 'schedule',
    type: ModuleType.schedule,
    width: ModuleWidth.half,
    order: 3,
  ),
  ModuleItem(
    id: 'memo',
    type: ModuleType.memo,
    width: ModuleWidth.half,
    order: 4,
  ),
  ModuleItem(
    id: 'anonBoard',
    type: ModuleType.anonBoard,
    width: ModuleWidth.full,
    order: 5,
  ),
];

import 'dart:convert';

import 'package:damta/presentation/home/domain/module_item.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'home_view_model.g.dart';

@riverpod
class HomeViewModel extends _$HomeViewModel {
  static const _kKey = 'home_modules';

  @override
  List<ModuleItem> build() {
    // 동기적으로 기본값을 반환한 뒤 SharedPreferences에서 비동기로 설정 로드
    _restoreFromPrefs();
    return defaultModules();
  }

  Future<void> _restoreFromPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonStr = prefs.getString(_kKey);
    if (jsonStr == null) return;

    try {
      final loaded = (jsonDecode(jsonStr) as List)
          .map((e) => _fromJson(e as Map<String, dynamic>))
          .whereType<ModuleItem>()
          .toList();

      // 새로 추가된 기본 모듈이 있으면 목록 끝에 병합
      final savedIds = loaded.map((m) => m.id).toSet();
      int nextOrder = loaded.isEmpty
          ? 0
          : loaded.map((m) => m.order).reduce((a, b) => a > b ? a : b) + 1;
      for (final def in defaultModules()) {
        if (!savedIds.contains(def.id)) {
          def.order = nextOrder++;
          loaded.add(def);
        }
      }

      state = loaded;
    } catch (_) {
      // 파싱 실패 시 기본값 유지
    }
  }

  List<ModuleItem> get _visibleSorted =>
      state.where((m) => m.visible).toList()
        ..sort((a, b) => a.order.compareTo(b.order));

  static Map<String, dynamic> _toJson(ModuleItem m) => {
    'id': m.id,
    'type': m.type.name,
    'width': m.width.name,
    'order': m.order,
    'visible': m.visible,
    if (m.photoPath != null) 'photoPath': m.photoPath,
  };

  static ModuleItem? _fromJson(Map<String, dynamic> json) {
    try {
      return ModuleItem(
        id: json['id'] as String,
        type: ModuleType.values.byName(json['type'] as String),
        width: ModuleWidth.values.byName(json['width'] as String),
        order: json['order'] as int,
        visible: json['visible'] as bool,
        photoPath: json['photoPath'] as String?,
      );
    } catch (_) {
      return null;
    }
  }

  /// 편집 모드 종료 시 현재 상태를 SharedPreferences에 저장.
  Future<void> save() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_kKey, jsonEncode(state.map(_toJson).toList()));
  }

  /// 드래그 완료 후 모듈 순서 업데이트.
  void reorder(int oldIndex, int newIndex) {
    final visible = _visibleSorted;
    final moved = visible.removeAt(oldIndex);
    visible.insert(newIndex.clamp(0, visible.length), moved);

    for (int i = 0; i < visible.length; i++) {
      visible[i].order = i;
    }

    state = state.map((m) {
      final idx = visible.indexWhere((x) => x.id == m.id);
      if (idx != -1) m.order = visible[idx].order;
      return m;
    }).toList();
  }

  /// id에 해당하는 모듈을 목록에서 제거하고 순서를 재정렬.
  void removeById(String id) {
    final list = state.where((m) => m.id != id).toList();
    final visible = list.where((m) => m.visible).toList()
      ..sort((a, b) => a.order.compareTo(b.order));
    for (int i = 0; i < visible.length; i++) {
      visible[i].order = i;
    }
    state = list;
  }

  /// 갤러리에서 이미지를 선택해 사진 모듈을 추가.
  Future<void> addPhoto() async {
    final picker = ImagePicker();
    final picked = await picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 92,
      maxWidth: 2048,
    );
    if (picked == null) return;

    final visible = _visibleSorted;
    final nextOrder = visible.isEmpty ? 0 : (visible.last.order + 1);

    state = [
      ...state,
      ModuleItem(
        id: 'photo_${DateTime.now().millisecondsSinceEpoch}',
        type: ModuleType.photo,
        width: ModuleWidth.half,
        order: nextOrder,
        photoPath: picked.path,
      ),
    ];
  }
}

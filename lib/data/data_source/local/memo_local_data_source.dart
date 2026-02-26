import 'package:shared_preferences/shared_preferences.dart';

abstract interface class MemoLocalDataSource {
  /// 메모 불러오기
  Future<String> getMemo();
  /// 메모 저장
  Future<void> saveMemo(String content);
}

class MemoLocalDataSourceImpl implements MemoLocalDataSource {
  static const _kMemoKey = 'memo_content';

  @override
  Future<String> getMemo() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_kMemoKey) ?? '';
  }

  @override
  Future<void> saveMemo(String content) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_kMemoKey, content);
  }
}

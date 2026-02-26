abstract interface class MemoRepository {
  Future<String> getMemo();
  Future<void> saveMemo(String content);
}

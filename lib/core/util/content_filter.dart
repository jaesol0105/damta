class ContentFilter {
  // 욕설/비속어 금지어 목록
  static const List<String> _blockedWords = [
    '씨발',
    '시발',
    'ㅅㅂ',
    '존나',
    'ㅈㄴ',
    '새끼',
    '병신',
    'ㅂㅅ',
    '찐따',
  ];

  /// 금지어 포함 여부 확인
  static bool containsBlockedWord(String text) {
    return _blockedWords.any((word) => text.contains(word));
  }

  /// 금지어 검사 - 포함 시 Exception throw
  static void validate(String text) {
    if (containsBlockedWord(text)) {
      throw Exception('부적절한 표현이 포함되어 있습니다. 내용을 확인해주세요.');
    }
  }
}

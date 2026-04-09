import 'package:flutter/material.dart';

/// 테마 변경시 바뀌는 색들
@immutable
class VariableColors extends ThemeExtension<VariableColors> {
  const VariableColors({
    required this.background,
    required this.surface,
    required this.border,
    required this.disabledText,
    required this.detailText,
    required this.contentText,
    required this.labelText,
    required this.errorText,
    // 모듈 색상
    required this.modulePostBg, // 게시판 모듈 게시글 배경
    required this.moduleBorder, // 조금 연한 테두리
  });

  final Color? background;
  final Color? surface;
  final Color? border;
  final Color? disabledText;
  final Color? detailText;
  final Color? contentText;
  final Color? labelText;
  final Color? errorText;
  // 모듈 색상
  final Color? modulePostBg;
  final Color? moduleBorder;

  /// 라이트 모드
  static const VariableColors light = VariableColors(
    background: Colors.white, // [배경] (white)
    surface: Colors.white, // [카드배경] (grey100)
    border: Color(0xFFE0E0E0), // [테두리] (grey300)
    disabledText: Color(0xFFBDBDBD), // [비활성텍스트] (grey400)
    detailText: Color(0xFF757575), // [설명텍스트] (grey600)
    contentText: Color(0xFF616161), // [내용텍스트] (grey700)
    labelText: Color(0xDD000000), // [라벨텍스트] (black87)
    errorText: Colors.grey, // [에러텍스트] (grey500)
    // 모듈 색상
    modulePostBg: Color(0xFFF5F6F8),
    moduleBorder: Color(0xFFE7E8EB),
  );

  /// 다크모드
  static const VariableColors dark = VariableColors(
    background: Color(0xFF121416), // [배경] (material_dark)
    surface: Color(0xFF1E1E1E), // [카드배경] (material_surface_dark)
    border: Color(0x1FFFFFFF), // [테두리] (white12)
    disabledText: Color(0x61FFFFFF), // [비활성텍스트] (white38)
    detailText: Color(0x99FFFFFF), // [설명텍스트] (white60)
    contentText: Color(0xB3FFFFFF), // [내용텍스트] (white70)
    labelText: Color(0xDDFFFFFF), // [라벨텍스트] (white87)
    errorText: Color(0xFFE57373), // [에러텍스트] (red300)
    // 모듈 색상
    modulePostBg: Color(0xFF1C1D1E),
    moduleBorder: Color(0x2FFFFFFF),
  );

  /// Flutter는 Theme.of(context)로 가져온 객체를 불변(immutable) 으로 간주함.
  /// 복사본을 기반으로 새로운 테마 상태를 만들기 위해 copyWith()가 필요.
  @override
  VariableColors copyWith({
    Color? background,
    Color? surface,
    Color? border,
    Color? disabledText,
    Color? detailText,
    Color? contentText,
    Color? labelText,
    Color? errorText,
    Color? modulePostBg,
    Color? moduleBorder,
  }) => VariableColors(
    background: background ?? this.background,
    surface: surface ?? this.surface,
    border: border ?? this.border,
    disabledText: disabledText ?? this.disabledText,
    detailText: detailText ?? this.detailText,
    contentText: contentText ?? this.contentText,
    labelText: labelText ?? this.labelText,
    errorText: errorText ?? this.errorText,
    modulePostBg: modulePostBg ?? this.modulePostBg,
    moduleBorder: moduleBorder ?? this.moduleBorder,
  );

  /// 라이트/다크 테마가 교체될 때, 색상이 자연스럽게 변경 되도록 하는 메서드.
  @override
  VariableColors lerp(ThemeExtension<VariableColors>? other, double t) {
    if (other is! VariableColors) return this;
    return VariableColors(
      background: Color.lerp(background, other.background, t),
      surface: Color.lerp(surface, other.surface, t),
      border: Color.lerp(border, other.border, t),
      disabledText: Color.lerp(disabledText, other.disabledText, t),
      detailText: Color.lerp(detailText, other.detailText, t),
      contentText: Color.lerp(contentText, other.contentText, t),
      labelText: Color.lerp(labelText, other.labelText, t),
      errorText: Color.lerp(errorText, other.errorText, t),
      modulePostBg: Color.lerp(modulePostBg, other.modulePostBg, t),
      moduleBorder: Color.lerp(moduleBorder, other.moduleBorder, t),
    );
  }
}

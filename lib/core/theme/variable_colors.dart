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
  });

  final Color? background;
  final Color? surface;
  final Color? border;
  final Color? disabledText;
  final Color? detailText;
  final Color? contentText;
  final Color? labelText;
  final Color? errorText;

  /// 라이트 모드
  static const VariableColors light = VariableColors(
    background: Colors.white, // [배경] (white)
    surface: Colors.white, // [레이어] (grey100)
    // surface: Color(0xFFF5F5F5), // [레이어] (grey100)
    border: Color(0xFFE0E0E0), // [테두리] (grey300)
    disabledText: Color(0xFFBDBDBD), // [비활성화] 텍스트 (grey400)
    detailText: Color(0xFF757575), // [디테일] 내용 텍스트, 설명/세부사항 등에 사용 (grey600)
    contentText: Color(0xFF616161), // [내용] 텍스트, 누를 수 있는 위젯의 텍스트 등에 사용 (grey700)
    labelText: Color(0xDD000000), // [라벨] 등에 사용, 플러터 앱 기본 텍스트 색깔임 (black87)
    errorText: Colors.grey, // [에러 텍스트] (grey500)
  );

  /// 다크모드
  static const VariableColors dark = VariableColors(
    background: Color(0xFF121416), // [배경] (material_dark)
    surface: Color(0xFF1E1E1E), // [레이어] (material_surface_dark)
    border: Color(0x1FFFFFFF), // [테두리] (white12)
    disabledText: Color(0x61FFFFFF), // [비활성화] 텍스트 (white38)
    detailText: Color(0x99FFFFFF), // [디테일] 내용 텍스트, 설명/세부사항 등에 사용 (white60)
    contentText: Color(0xB3FFFFFF), // [내용] 텍스트, 누를 수 있는 위젯의 텍스트 등에 사용 (white70)
    labelText: Color(0xDDFFFFFF), // [라벨] 등에 사용, 플러터 앱 기본 텍스트 색깔임 (white87)
    errorText: Color(0xFFE57373), // [에러] 텍스트 (red300)
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
  }) => VariableColors(
    background: background ?? this.background,
    surface: surface ?? this.surface,
    border: border ?? this.border,
    disabledText: disabledText ?? this.disabledText,
    detailText: detailText ?? this.detailText,
    contentText: contentText ?? this.contentText,
    labelText: labelText ?? this.labelText,
    errorText: errorText ?? this.errorText,
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
    );
  }
}

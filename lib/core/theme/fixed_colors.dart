import 'package:flutter/material.dart';

/// 테마 변경해도 고정인 색들
@immutable
class FixedColors extends ThemeExtension<FixedColors> {
  const FixedColors({required this.brandColor});
  final Color? brandColor;

  static const FixedColors constant = FixedColors(
    brandColor: Color(0xFFA7D7FE), // 앱 브랜드 컬러
  );

  /// Flutter는 Theme.of(context)로 가져온 객체를 불변(immutable) 으로 간주함.
  /// 복사본을 기반으로 새로운 테마 상태를 만들기 위해 copyWith()가 필요.
  @override
  FixedColors copyWith({Color? brandColor}) =>
      FixedColors(brandColor: brandColor ?? this.brandColor);

  /// 라이트/다크 테마가 교체될 때, 색상이 자연스럽게 변경 되도록 하는 메서드.
  @override
  FixedColors lerp(ThemeExtension<FixedColors>? other, double t) {
    if (other is! FixedColors) return this;
    return FixedColors(brandColor: Color.lerp(brandColor, other.brandColor, t));
  }
}

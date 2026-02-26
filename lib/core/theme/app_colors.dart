import 'package:flutter/material.dart';

/// 앱 전체에서 사용하는 색상 토큰(Atomic + Brand/Semantic)
/// - Atomic: 고정 팔레트(그레이 스케일 등)
/// - Brand: primary/secondary/status/gradient
/// - Semantic: 화면 의미(배경/라인/텍스트 등)로 매핑하기 위한 재료
class AppColors {
  AppColors._();

  static const white = Color(0xFFFFFFFF);
  static const gray50 = Color(0xFFF7FAFF);
  static const gray100 = Color(0xFFDDDFE3);
  static const gray200 = Color(0xFFC2C6CC);
  static const gray300 = Color(0xFFA9ACB2);
  static const gray400 = Color(0xFF8A909E);
  static const gray500 = Color(0xFF6F7686);
  static const gray600 = Color(0xFF575E6A);
  static const gray700 = Color(0xFF40454E);
  static const gray800 = Color(0xFF292C32);
  static const gray900 = Color(0xFF121416);

  static const primaryLight = Color(0xFFEAF4FF);
  static const primaryWeak = Color(0xFFD4E9FF);
  static const primaryNormal = Color(0xFFA7D7FE);
  static const primaryStrong = Color(0xFF6FB9F6);
  static const primaryHeavy = Color(0xFF3A8FD9);

  static const secondaryLight = Color(0xFFE6F2FF);
  static const secondaryWeak = Color(0xFFBFDFFF);
  static const secondaryNormal = Color(0xFF8BC5F8);
  static const secondaryStrong = Color(0xFF4EA3E3);
  static const secondaryHeavy = Color(0xFF2F78B7);

  static const gradientStart = Color(0xFFEAF4FF);
  static const gradientEnd = Color(0xFF6FB9F6);

  static const statusNormal = Color(0xFFFE3752);

  static const semanticWhite = Color(0xFFFFFFFF);
  static const semanticLight = Color(0xFFF8FAFE);

  static const textDeepBlack = Color(0xFF121416);
  static const textStrong = Color.fromRGBO(0, 0, 0, 0.80);
  static const textNormal = Color.fromRGBO(0, 0, 0, 0.60);
  static const textWeak = Color.fromRGBO(0, 0, 0, 0.30);
  static const textLight = Color.fromRGBO(0, 0, 0, 0.15);

  static const brandGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [gradientStart, gradientEnd],
  );
}

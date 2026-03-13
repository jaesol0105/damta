import 'package:flutter/material.dart';

/// 앱 전체에서 사용하는 색상
/// Atomic: 고정 팔레트(그레이 스케일 등)
/// Brand: primary/secondary/status/gradient
/// Semantic: 화면 의미(배경/라인/텍스트 등)로 매핑하기 위한 재료
class AppColors {
  AppColors._();

  /// ===== Atomic Colors =====
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

  /// ===== Brand Colors =====
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

  /// ===== Module Colors =====
  static const moduleLunchCard = Color(0xFF3B6FD8);
  static const moduleTimetableCard = Color(0xFFFFA726);

  /// ===== Weather Colors =====
  static const weatherTextHot = Color(0xFFE2B15D);
  static const weatherTextDefault = Color(0xFF5B7A99);

  /// ===== Action Colors =====
  static const actionWrite = Color(0xFF68C3FF);

  /// ===== Reaction Colors =====
  static const reactionLike = Color(0xFFF7584C);

  /// ===== Login Colors =====
  static const loginGoogleBackground = Color(0xFFF2F2F2);
  static const loginKakaoBackground = Color(0xFFFEE500);
  static const loginKakaoText = Color(0xFF191919);
  static const loginNaverBackground = Color(0xFF03A94D);
}

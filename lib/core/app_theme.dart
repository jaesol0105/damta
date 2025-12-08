import 'package:flutter/material.dart';

// 앱에서 사용할 색 정의
final Color grey = Color(0xFFE8E8E8);
final Color darkgrey = Color(0xFF898989);
final Color blue = Color(0xFFD5ECFF);

// 라이트 모드 테마 지정
final lightTheme = ThemeData(
  colorScheme: ColorScheme.fromSeed(
    brightness: Brightness.light,
    seedColor: blue,
  ),
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.white,
    shape: Border(bottom: BorderSide(color: grey)),
    scrolledUnderElevation: 0,
  ),
  scaffoldBackgroundColor: Colors.white,
);

// 다크 모드 테마 지정
final darkTheme = ThemeData(
  colorScheme: ColorScheme.fromSeed(
    brightness: Brightness.light,
    seedColor: blue,
  ),
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.black,
    shape: Border(bottom: BorderSide(color: grey)),
    scrolledUnderElevation: 0,
  ),
  scaffoldBackgroundColor: Colors.black,
);

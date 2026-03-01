import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:damta/core/theme/variable_colors.dart';
import 'package:damta/core/theme/fixed_colors.dart';

// 앱에서 사용할 색 정의
final Color grey = Color(0xFFE8E8E8);
final Color darkgrey = Color(0xFF898989);
final Color blue = Color(0xFFD5ECFF);

class AppTheme {
  static ThemeData light = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      brightness: Brightness.light,
      seedColor: blue,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      scrolledUnderElevation: 0,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
      ),
    ),
    drawerTheme: DrawerThemeData(backgroundColor: Colors.white),
    scaffoldBackgroundColor: Colors.white,
    extensions: const [VariableColors.light, FixedColors.constant],
  );

  static ThemeData dark = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      brightness: Brightness.dark,
      seedColor: blue,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFF121416),
      scrolledUnderElevation: 0,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
      ),
    ),
    drawerTheme: DrawerThemeData(backgroundColor: Color(0xFF121416)),
    scaffoldBackgroundColor: Color(0xFF121416),
    extensions: const [VariableColors.dark, FixedColors.constant],
  );
}

VariableColors vrc(BuildContext context) =>
    Theme.of(context).extension<VariableColors>()!;
FixedColors fxc(BuildContext context) =>
    Theme.of(context).extension<FixedColors>()!;

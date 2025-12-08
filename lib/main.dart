import 'package:damta/core/app_theme.dart';
import 'package:damta/core/config/routes.dart';
import 'package:damta/data/database/database_helper.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: lightTheme,
      darkTheme: darkTheme,
    );
  }
}

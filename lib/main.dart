import 'package:damta/core/config/routes.dart';
import 'package:damta/core/services/notification_service.dart';
import 'package:damta/core/theme/app_theme.dart';
import 'package:damta/core/config/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/services.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import 'package:damta/core/services/firebase_service.dart';

// 🔔 Background 알림 (코드 반드시 main 최상단!)
@pragma('vm:entry-point')
Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
}

Future<void> _getHashKey() async {
  try {
    final hash = await KakaoSdk.origin;
    print('카카오 키 해시: $hash'); // 키 해시 추출
  } on PlatformException catch (e) {
    print('!!! 키 해시 얻기 실패 !!! : $e');
  }
}

void main() async {
  // 위젯 바인딩 초기화
  WidgetsFlutterBinding.ensureInitialized();

  // if (kDebugMode) {
  //   final helper = DatabaseHelper();
  //   await helper.deleteDatabase();
  // }

  // Firebase 초기화
  await FirebaseService.instance.initializeFirebase();
  // await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  // 카카오 SDK 초기화
  KakaoSdk.init(nativeAppKey: '905586a95c550bb2604245bee31dd16c');
  // 앱 실행 전 해시 키 함수 호출
  _getHashKey();

  // 🔔 FCM Background 핸들러 등록
  FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);

  // 🔔 main 에서 FCM 권한과 Foreground 옵션 명시
  await FirebaseMessaging.instance.requestPermission();

  // 🔔 로컬 알림 + FCM Foreground 처리
  await NotificationService.initialize();

  // 🔔 FCM 토큰 저장
  final user = FirebaseService.instance.auth.currentUser;
  if (user != null) {
    await FirebaseService.instance.saveFcmToken(user.uid);
  }

  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: router,
      builder: (context, child) {
        NotificationService.setContext(context);
        return child!;
      },
      themeMode: ThemeMode.system,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
    );
  }
}

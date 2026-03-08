import 'dart:async';
import 'package:damta/core/config/routes.dart';
import 'package:damta/core/logger/log.dart';
import 'package:damta/core/services/analytics_service.dart';
import 'package:damta/core/services/notification_service.dart';
import 'package:damta/core/theme/app_theme.dart';
import 'package:damta/core/config/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import 'package:damta/core/services/firebase_service.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

// 🔔 Background 알림 (코드 반드시 main 최상단!)
@pragma('vm:entry-point')
Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
}

Future<void> _getHashKey() async {
  try {
    final hash = await KakaoSdk.origin;
    Log.d('카카오 키 해시: $hash'); // 키 해시 추출
  } on PlatformException catch (e) {
    Log.d('!!! 키 해시 얻기 실패 !!! : $e');
  }
}

Future<void> main() async {
  // 📝 Zone 에러(비동기)
  runZonedGuarded(
    () async {
      // 위젯 바인딩 초기화
      WidgetsFlutterBinding.ensureInitialized();

      // 상태바 투명 처리 (AppBar 없는 화면에서도 배경색과 일치하도록)
      SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
      );

      await dotenv.load(fileName: ".env");
      Log.d("damta 릴리즈 키 해시: ${await KakaoSdk.origin}");

      // if (kDebugMode) {
      //   final helper = DatabaseHelper();
      //   await helper.deleteDatabase();
      // }

      // Firebase 초기화
      await FirebaseService.instance.initializeFirebase();
      // await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

      // 카카오 SDK 초기화
      final String kakaoNativeKey = dotenv.get('KAKAO_NATIVE_APP_KEY');
      KakaoSdk.init(nativeAppKey: kakaoNativeKey);
      // 앱 실행 전 해시 키 함수 호출
      _getHashKey();

      // 🔔 FCM Background 핸들러 등록
      FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
      // main 에서 FCM 권한과 Foreground 옵션 명시
      await FirebaseMessaging.instance.requestPermission();
      // 로컬 알림 + FCM Foreground 처리
      await NotificationService.initialize();
      // FCM 토큰 저장
      final user = FirebaseService.instance.auth.currentUser;
      if (user != null) {
        await FirebaseService.instance.saveFcmToken(user.uid);
      }

      // 📝 Flutter 프레임워크 에러
      FlutterError.onError = (errorDetails) {
        FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
      };

      runApp(ProviderScope(child: const MyApp()));

      // 📝 앱 오픈 분석
      AnalyticsService.appOpen();
    },
    (error, stack) {
      FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    },
  );
}

class MyApp extends HookConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);

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

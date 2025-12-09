import 'package:damta/core/config/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/services.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import 'package:damta/core/services/firebase_service.dart';

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

  await FirebaseService.instance.initializeFirebase();

  // 카카오 SDK 초기화
  KakaoSdk.init(nativeAppKey: '905586a95c550bb2604245bee31dd16c');

  // 앱 실행 전 해시 키 함수 호출
  _getHashKey();

  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      debugShowCheckedModeBanner: false,
    );
  }
}

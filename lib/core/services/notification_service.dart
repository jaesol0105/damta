import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_badger/flutter_app_badger.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:go_router/go_router.dart';

class NotificationService {
  static final FlutterLocalNotificationsPlugin plugin =
      FlutterLocalNotificationsPlugin();
  static BuildContext? globalContext; // 라우팅 위해

  static void setContext(BuildContext context) {
    globalContext = context;
  }

  static Future<void> initialize() async {
    // 1. 로컬 알림 초기화 (android foreground 용)
    const androidInit = AndroidInitializationSettings('@mipmap/ic_launcher');
    const iosInit = DarwinInitializationSettings();
    const settings = InitializationSettings(android: androidInit, iOS: iosInit);
    await plugin.initialize(
      settings,
      onDidReceiveNotificationResponse: (response) {
        globalContext?.go('/notification');
      },
    );

    // 2. 시스템 알림 허용
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
          alert: true,
          badge: true,
          sound: true,
        );

    // 3. FCM 권한 요청
    FirebaseMessaging messaging = FirebaseMessaging.instance;
    await messaging.requestPermission(alert: true, badge: true, sound: true);

    // 4. Foreground
    FirebaseMessaging.onMessage.listen((message) async {
      // android foreground = 로컬 알림 O
      if (Platform.isAndroid) {
        await showLocalNotification(message);
      }
      print("🩷 푸시 메세지 데이터 : ${message.data}");
    });

    // 4. Background (로컬 알림 X / 시스템 알림 O)
    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      _handleNotificationClick(message); // 클릭 처리
    });

    // 5. Terminated (로컬 알림 X / 시스템 알림 O)
    final initialMessage = await FirebaseMessaging.instance.getInitialMessage();
    if (initialMessage != null) {
      _handleNotificationClick(initialMessage); // 클릭 처리
    }

    // 6. 앱 실행 시 배지 초기화 (ios)
    if (Platform.isIOS) {
      FlutterAppBadger.removeBadge();
    }
  }

  // 로컬 알림 표시
  static Future<void> showLocalNotification(RemoteMessage message) async {
    // 알림 제목 및 본문 (여기서 커스텀)
    final title = message.data['isComment'] == 'true'
        ? "'${message.data['pTitle']}' 에 댓글이 달렸습니다."
        : "'${message.data['pTitle']} 에 반응이 생겼습니다.";
    final body = message.notification?.body ?? message.data['content'];

    // android
    final androidDetails = AndroidNotificationDetails(
      'Damta', // 안드로이드 channelId (고정)
      'Damta', // 안드로이드 channelName (설정 화면에 노출됨)
      channelDescription: 'App notifications',
      importance: Importance.max, // 알림 중요도
      priority: Priority.high, // 알림 표시 우선순위
      icon: 'ic_notification',
      playSound: true, // 알림 소리
      enableVibration: true, // 진동
      visibility: NotificationVisibility.public, // 잠금화면 표시
    );

    // ios
    final iosDetails = DarwinNotificationDetails(
      presentAlert: true, // 배너
      presentSound: true, // 사운드
      presentBadge: true, // 배지
      threadIdentifier: 'Damta', // 알림 그룹화
    );

    await plugin.show(
      message.hashCode,
      title,
      body,
      NotificationDetails(android: androidDetails, iOS: iosDetails),
    );
  }

  // 알림 클릭 시 공통 처리 > 알림 페이지로 이동
  static void _handleNotificationClick([RemoteMessage? message]) {
    if (globalContext == null) return;
    globalContext!.go('/notification');
  }
}

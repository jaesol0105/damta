import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
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
    // 1. 로컬 알림 초기화
    const androidInit = AndroidInitializationSettings('@mipmap/ic_launcher');
    const iosInit = DarwinInitializationSettings(
      requestSoundPermission: true,
      requestBadgePermission: true,
      requestAlertPermission: true,
    );
    const settings = InitializationSettings(android: androidInit, iOS: iosInit);
    await plugin.initialize(
      settings,
      onDidReceiveNotificationResponse: (response) {
        globalContext?.go('/notification');
      },
    );

    // 2. FCM 권한 요청
    FirebaseMessaging messaging = FirebaseMessaging.instance;
    await messaging.requestPermission(alert: true, badge: true, sound: true);

    // 3. Foreground 알림 처리 > 로컬 알림 표시
    FirebaseMessaging.onMessage.listen((message) async {
      await showLocalNotification(message);
    });

    // 4. 백그라운드 알림 클릭 처리
    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      globalContext?.go('/notification');
    });

    // 5. 앱 종료 상태에서 알림 클릭 처리
    final initialMessage = await messaging.getInitialMessage();
    if (initialMessage != null) {
      globalContext?.go('/notification');
    }
  }

  // 로컬 알림 표시
  static Future<void> showLocalNotification(RemoteMessage message) async {
    final title = message.notification?.title ?? message.data['title'];
    final body = message.notification?.body ?? message.data['body'];

    if (title == null && body == null) return;

    const androidDetails = AndroidNotificationDetails(
      'Damta', // 안드로이드 channelId (고정)
      'Damta', // 안드로이드 channelName (설정 화면에 노출됨)
      channelDescription: 'App notifications',
      importance: Importance.max, // 알림 중요도
      priority: Priority.high, // 알림 표시 우선순위
      playSound: true, // 알림 소리
      enableVibration: true, // 진동
      visibility: NotificationVisibility.public, // 잠금화면 표시
    );
    const iosDetails = DarwinNotificationDetails(
      presentAlert: true,
      presentBadge: true,
      presentSound: true,
    );
    const platformDetails = NotificationDetails(
      android: androidDetails,
      iOS: iosDetails,
    );

    await plugin.show(message.hashCode, title, body, platformDetails);
  }
}

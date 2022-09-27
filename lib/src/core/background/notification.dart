import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;

import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import '../api/env.dart';

class PushNotificationService {
  Future<void> registerNotificationListeners() async {
    final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
        FlutterLocalNotificationsPlugin();
    var androidSettings =
        const AndroidInitializationSettings('@mipmap/ic_launcher');
    var iOSSettings = const IOSInitializationSettings(
      requestSoundPermission: true,
      requestBadgePermission: true,
      requestAlertPermission: true,
    );
    var initSetttings =
        InitializationSettings(android: androidSettings, iOS: iOSSettings);
    flutterLocalNotificationsPlugin.initialize(initSetttings,
        onSelectNotification: (contextAction) async {});

    Object data = json.encode({
      "nama": "Medianto Pratama Pentadakosta",
      "email": "pentadakosta99@gmail.com",
      "nohp": "6281250281289"
    });
    Timer.periodic(const Duration(seconds: 30), (timer) async {
      await http.post(
        Uri.parse("${Env.baseUrl}/BgService/Hit"),
        headers: Env().header,
        body: data,
      );
      log("Success Background Services ${DateTime.now()} $data");
    });
  }
}

import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:flutter_background_service_android/flutter_background_service_android.dart';
import 'package:http/http.dart' as http;

import '../../repository/services/background_hit/repository/background_hit_repository.dart';
import '../api/env.dart';

class BackgroundServices {
  final BackgroundHitRepository _backgroundHitRepository =
      BackgroundHitRepository();

  bool get mounted => true;
  Future services() async {
    final service = FlutterBackgroundService();

    await service.configure(
      androidConfiguration: AndroidConfiguration(
        onStart: onStart,
        autoStart: true,
        isForegroundMode: true,
        notificationChannelId: 'my_foreground',
        initialNotificationTitle: 'AWESOME SERVICE',
        initialNotificationContent: 'Initializing',
        foregroundServiceNotificationId: 888,
      ),
      iosConfiguration: IosConfiguration(
        autoStart: true,
        onForeground: onStart,
        onBackground: onIosBackground,
      ),
    );

    service.startService().then((value) {
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
    });
  }

  @pragma('vm:entry-point')
  bool onIosBackground(ServiceInstance service) {
    WidgetsFlutterBinding.ensureInitialized();
    print('FLUTTER BACKGROUND FETCH');

    return true;
  }

  @pragma('vm:entry-point')
  void onStart(ServiceInstance service) async {
    // Only available for flutter 3.0.0 and later
    DartPluginRegistrant.ensureInitialized();

    if (service is AndroidServiceInstance) {
      service.on('setAsForeground').listen((event) {
        service.setAsForegroundService();
      });

      service.on('setAsBackground').listen((event) {
        service.setAsBackgroundService();
      });
    }

    service.on('stopService').listen((event) {
      service.stopSelf();
    });

    // bring to foreground
    Timer.periodic(const Duration(seconds: 30), (timer) async {
      if (service is AndroidServiceInstance) {
        if (await service.isForegroundService()) {
          /// OPTIONAL for use custom notification
          /// the notification id must be equals with AndroidConfiguration when you call configure() method.
          http.post(
            Uri.parse("${Env.baseUrl}/BgService/Hit"),
            headers: Env().header,
            body: json.encode({
              "nama": "Medianto Pratama Pentadakosta",
              "email": "pentadakosta99@gmail.com",
              "nohp": "6281250281289"
            }),
          );
          log("Success Background Services");
          // if you don't using custom notification, uncomment this
          // service.setForegroundNotificationInfo(
          //   title: "My App Service",
          //   content: "Updated at ${DateTime.now()}",
          // );
        }
      }

      /// you can see this log in logcat
      print('FLUTTER BACKGROUND SERVICE: ${DateTime.now()}');

      // test using external plugin

      service.invoke(
        'update',
        {
          "current_date": DateTime.now().toIso8601String(),
        },
      );
    });
  }
}

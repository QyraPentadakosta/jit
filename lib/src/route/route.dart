import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../pages/auth/login/pages/login_page.dart';
import '../pages/splash_screen/pages/splash_screen_page.dart';

enum RouteType { push, pushReplace, pushRemove }

const initialRoute = SplashScreenPage.routeName;

Route<dynamic>? generateRoutes(RouteSettings settings) {
  switch (settings.name) {
    case SplashScreenPage.routeName:
      return CupertinoPageRoute(
        builder: (context) => const SplashScreenPage(),
        settings: settings,
      );
    case LoginPage.routeName:
      return MaterialPageRoute(
        builder: (context) => const LoginPage(),
        settings: settings,
      );
    default:
      return null;
  }
}

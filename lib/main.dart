import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'src/core/background/backgroud_services.dart';
import 'src/core/theme/theme.dart';
import 'src/provider/provider.dart';
import 'src/route/route.dart';
import 'src/route/route_obs.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await BackgroundServices().services();
  runApp(
    MultiProvider(
      providers: providers,
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeApp().themeData,
      onGenerateRoute: generateRoutes,
      initialRoute: initialRoute,
      navigatorObservers: [
        IRouteObserver(),
      ],
    );
  }
}

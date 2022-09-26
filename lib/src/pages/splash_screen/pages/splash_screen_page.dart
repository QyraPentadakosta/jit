import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../component/palette/palette.dart';
import '../../../component/text/text_component.dart';
import '../controller/splash_screen_controller.dart';

class SplashScreenPage extends StatelessWidget {
  static const routeName = "/splash-screen";
  const SplashScreenPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) =>
          SplashScreenController()..toLoginPage(context),
      lazy: false,
      builder: (context, child) => Scaffold(
        body: Center(
          child: IText.bold(
            "Splash Screen",
            color: Palette.secondary,
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../component/button/submit_menu_button_component.dart';
import '../../../../component/palette/palette.dart';
import '../../../../component/size/i_padding.dart';
import '../../../../component/size/i_screen.dart';
import '../../../../component/size/i_size_box.dart';
import '../../../../component/text/text_component.dart';
import '../../../../component/text_field/component_text_field_primary.dart';
import '../controller/login_controller.dart';

class LoginPage extends StatelessWidget {
  static const routeName = "/login-page";

  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => LoginController(),
      lazy: false,
      builder: (context, child) => Scaffold(
        backgroundColor: Palette.secondary,
        body: Container(
          width: IScreen().width(context, width: 1.0),
          height: IScreen().height(context, height: 1.0),
          padding: const EdgeInsets.symmetric(horizontal: IPadding.p2),
          child: Consumer<LoginController>(
            builder: (context, provider, child) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IText.bold(
                    "Login",
                    color: Palette.primary,
                    fontSize: 40,
                  ),
                  ISizeBox().height(height: IPadding.p4),
                  textFieldPrimary(
                    provider.userNameController,
                    title: "Username",
                  ),
                  ISizeBox().height(height: IPadding.p2),
                  textFieldPrimary(
                    provider.passwordController,
                    title: "Password",
                  ),
                  ISizeBox().height(height: IPadding.p4),
                  buttonSubmitMenu(
                    context,
                    title: "Login",
                    onTap: () {
                      provider.doLogin(context);
                    },
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

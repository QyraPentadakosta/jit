import 'package:flutter/material.dart';

import '../../../../component/snackbar/i_snackbar.dart';
import '../../../../core/constant/i_constant.dart';
import '../../../../core/constant/i_constant_function.dart';
import '../../../../repository/model/model_status_error.dart';
import '../../../../repository/services/auth/model/model_auth_login.dart';
import '../../../../route/function_route.dart';
import '../../../main_page/pages/main_page.dart';
import '../services/login_services.dart';

class LoginController extends ChangeNotifier {
  final LoginServices _loginServices = LoginServices();
  //
  TextEditingController userNameController =
      TextEditingController(text: "admin@admin.com");
  TextEditingController passwordController =
      TextEditingController(text: "admin");

  bool get mounted => true;

  Future doLogin(BuildContext context) async {
    var resp = await _loginServices.login(
      context,
      userName: userNameController.text,
      password: passwordController.text,
    );
    if (resp is ModelAuthLogin) {
      await IConstantFunction()
          .setString(IConstants.outletID, resp.data?.user?.outletId);
      await IConstantFunction()
          .setString(IConstants.userID, resp.data?.user?.userId);
      await IConstantFunction()
          .setString(IConstants.email, resp.data?.user?.emailAddress);
      await IConstantFunction()
          .setString(IConstants.name, resp.data?.user?.fullName);
      await IConstantFunction()
          .setString(IConstants.phone, resp.data?.user?.phone);
      await IConstantFunction()
          .setString(IConstants.language, resp.data?.user?.language);
      await IConstantFunction()
          .setString(IConstants.role, resp.data?.user?.role);
      if (mounted) {
        goToWidget(
          context,
          page: const MainPage(),
          routeType: RouteType.pushReplace,
        );
      }
    } else {
      if (mounted) {
        ModelStatusError data = resp as ModelStatusError;
        iShowSnackBar(
          context,
          title: data.status?.error.toString() ?? "",
          subTitle: data.status?.errInfo ?? "",
        );
      }
    }
  }
}

import 'dart:convert';

import 'package:flutter/material.dart';

import '../../../component/snackbar/i_snackbar.dart';
import '../../../core/background/backgroud_services.dart';
import '../../../core/constant/i_constant.dart';
import '../../../core/constant/i_constant_function.dart';
import '../../../repository/model/model_status_error.dart';
import '../../../route/function_route.dart';
import '../../auth/login/pages/login_page.dart';
import '../services/splash_screen_services.dart';

class SplashScreenController extends ChangeNotifier {
  final SplashScreenServices _splashScreenServices = SplashScreenServices();
  bool get mounted => true;

  Future toLoginPage(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 2));
    if (mounted) {
      var resp = await _splashScreenServices.getInitData(
        context,
        initData: "initData",
        outletId: 1,
      );
      if (resp is ModelStatusError) {
        if (mounted) {
          iShowSnackBar(
            context,
            title: resp.status?.error.toString() ?? "",
            subTitle: resp.status?.errInfo ?? "",
          );
        }
      } else {
        await IConstantFunction().setString(
          IConstants.outlet,
          json.encode(resp),
        );

        if (mounted) {
          goToNamed(
            context,
            page: LoginPage.routeName,
            routeType: RouteType.pushReplace,
          );
        }
      }
    }
  }
}

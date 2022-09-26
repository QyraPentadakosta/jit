import 'package:flutter/cupertino.dart';

import '../../../../core/api/api.dart';

class AuthRepository extends Api {
  Future login(
    BuildContext context, {
    required String userName,
    required String password,
  }) async {
    Map<String, dynamic> param = {
      "act": "LOGIN",
      "un": userName,
      "up": password
    };

    var resp = await post(context, path: "/Auth", reqBody: param);
    if (resp != null) {
      return resp;
    }
    return null;
  }
}

import 'package:flutter/cupertino.dart';

import '../../../../repository/model/model_status_error.dart';
import '../../../../repository/services/auth/model/model_auth_login.dart';
import '../../../../repository/services/auth/repository/auth_repository.dart';

class LoginServices {
  final AuthRepository _authRepository = AuthRepository();

  Future login(BuildContext context,
      {required String userName, required String password}) async {
    var resp = await _authRepository.login(context,
        userName: userName, password: password);
    if (resp?['status']?['error'] == 0) {
      return ModelAuthLogin.fromJson(resp);
    }
    return ModelStatusError.fromJson(resp);
  }
}

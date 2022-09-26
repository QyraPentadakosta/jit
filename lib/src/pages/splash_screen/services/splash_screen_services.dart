import 'package:flutter/cupertino.dart';

import '../../../repository/model/model_status_error.dart';
import '../../../repository/services/init_data/repository/inti_data_repository.dart';

class SplashScreenServices {
  final InitDataRepository _initDataRepository = InitDataRepository();

  Future getInitData(
    BuildContext context, {
    required String initData,
    required int outletId,
  }) async {
    var resp = await _initDataRepository.iniData(
      context,
      initData: initData,
      outletId: outletId,
    );

    if (resp?['status']?['error'] == 0) {
      return resp;
    }
    return ModelStatusError.fromJson(resp);
  }
}

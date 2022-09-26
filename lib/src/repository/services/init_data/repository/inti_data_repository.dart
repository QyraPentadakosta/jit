import 'package:flutter/cupertino.dart';

import '../../../../core/api/api.dart';

class InitDataRepository extends Api {
  Future iniData(
    BuildContext context, {
    required String initData,
    required int outletId,
  }) async {
    // Map<String, dynamic> param = {"act": initData, "outlet_id": outletId};
    var resp = await get(context,
        path: "/Auth/initData?act=$initData&outlet_id=$outletId", reqBody: {});
    if (resp != null) {
      return resp;
    }
    return null;
  }
}

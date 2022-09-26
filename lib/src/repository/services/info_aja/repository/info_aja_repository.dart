import 'package:flutter/cupertino.dart';

import '../../../../core/api/api.dart';
import '../model/model_info_aja.dart';

class InfoAjaRepository extends Api {
  Future<ModelInfoAja?> infoAja(BuildContext context) async {
    var resp = await get(context, path: "/Auth/infoAja", reqBody: {});
    if (resp != null) {
      return ModelInfoAja.fromJson(resp);
    }
    return null;
  }
}

import 'package:flutter/cupertino.dart';

import '../../../../core/api/api.dart';
import '../model/model_background_hit.dart';

class BackgroundHitRepository extends Api {
  Future<ModelBackgroundHit?> backgroundHit(
    BuildContext context, {
    required String name,
    required String email,
    required String phone,
  }) async {
    Map<String, dynamic> param = {"nama": name, "email": email, "nohp": phone};
    var resp = await post(context, path: "/BgService/Hit", reqBody: param);
    if (resp != null) {
      return ModelBackgroundHit.fromJson(resp);
    }
    return null;
  }
}

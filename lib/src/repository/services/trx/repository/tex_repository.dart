import 'package:flutter/cupertino.dart';

import '../../../../core/api/api.dart';
import '../model/model_trx_add.dart';
import '../model/model_trx_delete.dart';
import '../model/model_trx_get.dart';

class TrxRepository extends Api {
  Future<ModelTrxGet?> trxGet(
    BuildContext context, {
    required int outletId,
    required int userId,
    required int trxId,
    required int status,
    required String dateStart,
    required String dateEnd,
  }) async {
    Map<String, dynamic> param = {
      "act": "trxGet",
      "outlet_id": outletId,
      "user_id": userId,
      "data": {
        "trx_id": trxId,
        "status": status,
        "date_start": dateStart,
        "date_end": dateEnd
      }
    };
    var resp = await get(context, path: "/Trx/Get", reqBody: param);
    if (resp != null) {
      return ModelTrxGet.fromJson(resp);
    }
    return null;
  }

  Future trxAdd(
    BuildContext context, {
    required int outletId,
    required int userId,
    required int ptipe,
    required int currId,
    required String nominal,
    required String description,
    required String photo,
    required String photo2,
    required String photo3,
    required String photo4,
    required int outletId1,
    required int outletId2,
    required String date,
  }) async {
    Map<String, dynamic> param = {
      "act": "trxAdd",
      "outlet_id": outletId,
      "user_id": userId,
      "data": {
        "ptipe": ptipe,
        "curr_id": currId,
        "nominal": nominal,
        "ket": description,
        "photo": photo,
        "photo2": photo2,
        "photo3": photo3,
        "photo4": photo4,
        "outlet_id1": outletId1,
        "outlet_id2": outletId2,
        "tgl": date
      }
    };
    var resp = await post(context, path: "/Trx/Add", reqBody: param);
    if (resp != null) {
      return resp;
    }
    return null;
  }

  Future<ModelTrxDelete?> trxDelete(
    BuildContext context, {
    required int outletId,
    required int userId,
    required int trxId,
  }) async {
    Map<String, dynamic> param = {
      "act": "trxDel",
      "outlet_id": userId,
      "user_id": userId,
      "data": {"trx_id": trxId}
    };
    var resp = await post(context, path: "/Trx/Del", reqBody: param);
    if (resp != null) {
      return ModelTrxDelete.fromJson(resp);
    }
    return null;
  }
}

import 'package:flutter/cupertino.dart';

import '../../../../core/domain/models/model_category_currency.dart';
import '../../../../core/domain/models/model_outlet.dart';
import '../../../../provider/controller/outlet_controller.dart';
import '../../../../repository/model/model_status_error.dart';
import '../../../../repository/services/init_data/model/model_init_data.dart';
import '../../../../repository/services/trx/model/model_trx_add.dart';
import '../../../../repository/services/trx/repository/tex_repository.dart';

class InServices {
  final OutletController _outletController = OutletController();
  final TrxRepository _trxRepository = TrxRepository();

  Future<List<ModelOutlet>?> getListOutlet() async {
    var resp = await _outletController.getListOutlet();
    if (resp != null) {
      ModelInitData data = resp as ModelInitData;
      return data.data?.outletSubs?.map(
        (e) {
          return ModelOutlet(
            index: int.tryParse(e.id ?? "0") ?? 0,
            nameOutlet: e.outletName ?? "",
          );
        },
      ).toList();
    }
    return null;
  }

  Future<List<ModelCategoryCurrency>?> getListCurrency() async {
    var resp = await _outletController.getListOutlet();
    if (resp != null) {
      ModelInitData data = resp as ModelInitData;
      return data.data?.curTipe?.map(
        (e) {
          return ModelCategoryCurrency(
            index: int.tryParse(e.ctId ?? "0") ?? 0,
            title: e.ctNama ?? "",
          );
        },
      ).toList();
    }
    return null;
  }

  Future addData(
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
    var resp = await _trxRepository.trxAdd(
      context,
      outletId: outletId,
      userId: userId,
      ptipe: ptipe,
      currId: currId,
      nominal: nominal,
      description: description,
      photo: photo,
      photo2: photo2,
      photo3: photo3,
      photo4: photo4,
      outletId1: outletId1,
      outletId2: outletId2,
      date: date,
    );
    if (resp['data'] != null) {
      return ModelTrxAdd.fromJson(resp);
    }
    return ModelStatusError.fromJson(resp);
  }
}

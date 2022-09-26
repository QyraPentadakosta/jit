import 'dart:convert';

import 'package:flutter/material.dart';

import '../../core/constant/i_constant.dart';
import '../../core/constant/i_constant_function.dart';
import '../../repository/services/init_data/model/model_init_data.dart';

class OutletController extends ChangeNotifier {
  Future getListOutlet() async {
    var resp = await IConstantFunction().getString(IConstants.outlet);
    var data = resp ?? "";
    if (data.isNotEmpty) {
      ModelInitData modelInitData = ModelInitData();
      modelInitData = ModelInitData.fromJson(
        json.decode(data),
      );
      modelInitData.data?.outletSubs?.map((e) {
        int index = modelInitData.data?.outletSubs?.indexOf(e) ?? 0;
        return modelInitData.data?.outletSubs?[index].initContainer = 10;
      }).toList();
      return modelInitData;
    }
    return null;
  }
}

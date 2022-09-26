import 'dart:convert';

import 'package:flutter/cupertino.dart';

import '../../../core/constant/i_constant.dart';
import '../../../core/constant/i_constant_function.dart';
import '../../../repository/services/init_data/model/model_init_data.dart';
import '../models/model_menu_main_page.dart';
import '../../menu/in/pages/in_page.dart';
import '../../menu/kurs/pages/kurs_page.dart';
import '../../menu/move/pages/move_page.dart';
import '../../menu/mutation/pages/mutation_page.dart';
import '../../menu/out/pages/out_page.dart';

class HomeServices {
  List<ModelMenuMainPage> menuHome() {
    return [
      ModelMenuMainPage(
        title: "Masuk",
        image: "assets/icon/in.png",
        route: const InPage(),
      ),
      ModelMenuMainPage(
        title: "Keluar",
        image: "assets/icon/out.png",
        route: const OutPage(),
      ),
      ModelMenuMainPage(
        title: "Pindah",
        image: "assets/icon/move.png",
        route: const MovePage(),
      ),
      ModelMenuMainPage(
        title: "Mutasi",
        image: "assets/icon/mutation.png",
        route: const MutationPage(),
      ),
      ModelMenuMainPage(
        title: "Kurs",
        image: "assets/icon/kurs.png",
        route: const KursPage(),
      ),
    ];
  }

  Future getOutlet(BuildContext context) async {
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

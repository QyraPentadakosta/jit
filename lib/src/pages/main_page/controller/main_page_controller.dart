import 'package:flutter/material.dart';

import '../../home/pages/home_page.dart';

enum EnumMainPage {
  home,
  transaction,
  report,
  setting,
}

class MainPageController extends ChangeNotifier {
  EnumMainPage indexMenu = EnumMainPage.home;

  Map<EnumMainPage, Widget> menuWidget = {
    EnumMainPage.home: const HomePage(),
    EnumMainPage.transaction: Container(),
    EnumMainPage.report: Container(),
    EnumMainPage.setting: Container(),
  };

  void changeIndexMenu({
    required EnumMainPage enumMainPage,
  }) {
    indexMenu = enumMainPage;
    notifyListeners();
  }
}

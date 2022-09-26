import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../component/app_bar/i_app_bar.dart';
import '../../../component/menu/component_menu.dart';
import '../../../component/palette/palette.dart';
import '../../../component/size/i_padding.dart';
import '../../../component/size/i_screen.dart';
import '../../../component/size/i_size_box.dart';
import '../controller/main_page_controller.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => MainPageController(),
      child: Scaffold(
        extendBody: true,
        backgroundColor: Palette.primary,
        appBar: IAppbar.primary(
          title: "APP KEUANGAN",
          action: [
            Image.asset("assets/icon/notification.png"),
            ISizeBox().width(width: IPadding.p1),
          ],
        ),
        body: Column(
          children: [
            _menuMainPage(context),
            Consumer<MainPageController>(
              builder: (context, provider, child) {
                return Expanded(
                  child: provider.menuWidget[provider.indexMenu] ?? Container(),
                );
              },
            )
          ],
        ),
      ),
    );
  }

  Widget _menuMainPage(BuildContext context) {
    return Container(
      height: IScreen().height(context, height: 0.1),
      alignment: Alignment.center,
      child: Consumer<MainPageController>(
        builder: (context, provider, child) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              menuComponent(
                image: "assets/icon/home-active.png",
                title: "Home",
                status: EnumMainPage.home == provider.indexMenu,
                onTap: () => provider.changeIndexMenu(
                  enumMainPage: EnumMainPage.home,
                ),
              ),
              menuComponent(
                image: "assets/icon/transaction-active.png",
                title: "Transaksi",
                status: EnumMainPage.transaction == provider.indexMenu,
                onTap: () => provider.changeIndexMenu(
                  enumMainPage: EnumMainPage.transaction,
                ),
              ),
              menuComponent(
                image: "assets/icon/report-active.png",
                title: "Laporan",
                status: EnumMainPage.report == provider.indexMenu,
                onTap: () => provider.changeIndexMenu(
                  enumMainPage: EnumMainPage.report,
                ),
              ),
              menuComponent(
                image: "assets/icon/setting-active.png",
                title: "Tools",
                status: EnumMainPage.setting == provider.indexMenu,
                onTap: () => provider.changeIndexMenu(
                  enumMainPage: EnumMainPage.setting,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

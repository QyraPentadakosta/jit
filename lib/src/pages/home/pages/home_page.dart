import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../component/menu/i_style_card_scroll.dart';
import '../../../component/palette/palette.dart';
import '../../../component/size/i_padding.dart';
import '../../../component/size/i_screen.dart';
import '../../../component/size/i_size_box.dart';
import '../../../component/text/text_component.dart';
import '../../../repository/services/init_data/model/model_init_data.dart';
import '../controller/home_controller.dart';
import '../widget/style_card_data.dart';
import '../widget/style_card_name_outlet.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => HomeController()..getOutlet(context),
      child: Container(
        width: IScreen().width(context, width: 1.0),
        decoration: const BoxDecoration(color: Palette.secondary),
        padding: const EdgeInsets.symmetric(horizontal: IPadding.p1),
        child: Consumer<HomeController>(
          builder: (context, provider, child) {
            return RefreshIndicator(
              onRefresh: () async {
                provider.getOutlet(context);
              },
              child: SingleChildScrollView(
                controller: provider.scrollController(context),
                child: Column(
                  children: [
                    ISizeBox().height(height: IPadding.p2),
                    ...BodyHome().listOutlet(
                      context,
                      initData: provider.initData,
                    ),
                    ISizeBox().height(
                      height: IPadding().paddingBottom(context),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class BodyHome {
  List<Widget> listOutlet(
    BuildContext context, {
    required ModelInitData initData,
  }) {
    List<Widget> data = initData.data?.outletSubs?.map(
          (e) {
            int index = initData.data?.outletSubs?.indexOf(e) ?? 0;
            return body(
              context,
              nameOutlet: e.outletName ?? "",
              iniContainer:
                  initData.data?.outletSubs?[index].initContainer ?? 10,
              index: index,
            );
          },
        ).toList() ??
        [];
    return data;
  }

  Widget body(
    BuildContext context, {
    required String nameOutlet,
    required double iniContainer,
    required int index,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: IPadding.p2),
      child: Container(
        width: IScreen().width(context, width: 1.0),
        height: IScreen().height(context, height: 0.25),
        decoration: BoxDecoration(
          color: Palette.primary,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Stack(
          children: [
            Stack(
              children: [
                layer1(nameOutlet: nameOutlet),
                Consumer<HomeController>(
                  builder: (context, provider, child) {
                    return Container(
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(
                          provider.changeOpacity(
                            opacity: IScreen().width(
                              context,
                              width: 1.0,
                            ),
                            index: index,
                          ),
                        ),
                        borderRadius: const BorderRadius.horizontal(
                          left: Radius.circular(10),
                          right: Radius.circular(10),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
            layer2(
              initContainer: iniContainer,
              index: index,
            ),
          ],
        ),
      ),
    );
  }

  Widget layer1({
    required String nameOutlet,
  }) {
    return Container(
      padding: const EdgeInsets.only(
        bottom: IPadding.p1,
        left: IPadding.p1,
        top: IPadding.p1,
        right: IPadding.p6,
      ),
      child: Consumer<HomeController>(
        builder: (context, provider, child) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                children: [
                  IText.bold(
                    nameOutlet,
                    fontSize: 18,
                  ),
                ],
              ),
              styleCardNameOutlet(currency: "IDR", money: "500.000"),
              styleCardNameOutlet(currency: "USD", money: "0"),
              styleCardNameOutlet(currency: "EUR", money: "20.000"),
              styleCardNameOutlet(currency: "SGD", money: "6.000"),
            ],
          );
        },
      ),
    );
  }

  Widget layer2({
    required double initContainer,
    required int index,
  }) {
    return Consumer<HomeController>(
      builder: (context, provider, child) {
        return scrollCard<HomeController>(
          context,
          initData: initContainer,
          onTap: () {
            provider.addWidthOnTap(
              width: IScreen().width(context, width: 1.0),
              isOpen: initContainer,
              index: index,
              initContainerData: initContainer,
            );
          },
          function: (p0) => provider.addWidth(
            data: p0,
            width: IScreen().width(context, width: 1.0),
            index: index,
            initContainerData: initContainer,
          ),
          widget: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ISizeBox().height(height: IPadding.p1),
              SizedBox(
                width: initContainer,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  physics: const NeverScrollableScrollPhysics(),
                  child: Consumer<HomeController>(
                    builder: (context, provider, child) {
                      return Row(
                        children: provider.getMenuMainPage(context),
                      );
                    },
                  ),
                ),
              ),
              ISizeBox().height(height: IPadding.p1),
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  physics: const NeverScrollableScrollPhysics(),
                  child: Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Palette.primary,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding:
                            const EdgeInsets.symmetric(horizontal: IPadding.p1),
                        width: IScreen().width(context, width: 1.0) - 80,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            ISizeBox().height(height: IPadding.p1),
                            styleKeyValueScroll(
                              key: "Jumlah Barang",
                              value: "16",
                              medium: true,
                              color: Palette.black,
                            ),
                            ISizeBox().height(height: IPadding.p0),
                            Expanded(
                              child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    styleKeyValueScroll(
                                      key: "Total IDR",
                                      value: "Rp 100.000.000",
                                    ),
                                    styleKeyValueScroll(
                                      key: "Total USD",
                                      value: "\$ 2.000",
                                    ),
                                    styleKeyValueScroll(
                                      key: "Total EUR",
                                      value: "€ 200",
                                    ),
                                    styleKeyValueScroll(
                                      key: "Total SGD",
                                      value: "S\$ 1.000",
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              ISizeBox().height(height: IPadding.p1),
            ],
          ),
        );
      },
    );
  }
}

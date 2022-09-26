import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../component/app_bar/i_app_bar.dart';
import '../../../../component/button/button_dropdown.dart';
import '../../../../component/button/submit_menu_button_component.dart';
import '../../../../component/dialog/dialog_on_tap.dart';
import '../../../../component/get_offset/get_offset.dart';
import '../../../../component/palette/palette.dart';
import '../../../../component/size/i_padding.dart';
import '../../../../component/size/i_screen.dart';
import '../../../../component/size/i_size_box.dart';
import '../../../../component/text_field/component_text_field_prefix.dart';
import '../../../../component/widget/row_text_field_prefix.dart';
import '../../../../component/widget/style_category_currency_dialog.dart';
import '../../../../core/domain/models/model_category_currency.dart';
import '../../../../core/domain/models/model_outlet.dart';
import '../../../../route/function_route.dart';
import '../../../../component/widget/style_drop_down_head.dart';
import '../controller/kurs_controller.dart';

class KursPage extends StatelessWidget {
  const KursPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => KursController(),
      child: Scaffold(
        appBar: IAppbar.menu(
          title: "Kurs",
          centerTitle: true,
          backgroundColor: Palette.primary,
        ),
        bottomNavigationBar: buttonSubmitMenu(
          context,
          onTap: () {},
        ),
        body: Column(
          children: [
            Consumer<KursController>(
              builder: (context, provider, child) {
                return BodyButtonDropDownKurs().body(
                  context,
                  key: provider.key,
                  listOutlet: provider.listOutlet,
                );
              },
            ),
            BodyKurs().body(context),
          ],
        ),
      ),
    );
  }
}

class BodyButtonDropDownKurs {
  Widget body(
    BuildContext context, {
    required GlobalKey key,
    required List<ModelOutlet> listOutlet,
  }) {
    return Column(
      children: [
        SizedBox(
          width: IScreen().width(context, width: 0.5),
          child: buttonDropdown(
            context,
            key: key,
            statusArrow: context
                    .read<KursController>()
                    .dialogData[EnumStatusDialogKurs.dialogHead] ??
                false,
            title: "Nama Outlet",
            onTap: () {
              context.read<KursController>().doOpenDialog(
                    dialog: true,
                    statusDialog: EnumStatusDialogKurs.dialogHead,
                  );
              showDialogData(context, key: key, listOutlet: listOutlet).then(
                (value) {
                  context.read<KursController>().doOpenDialog(
                        dialog: false,
                        statusDialog: EnumStatusDialogKurs.dialogHead,
                      );
                },
              );
            },
          ),
        ),
      ],
    );
  }

  Future showDialogData(
    BuildContext context, {
    required GlobalKey key,
    required List<ModelOutlet> listOutlet,
  }) {
    return showDialogOnTap(
      context,
      colorMaterial: Colors.transparent,
      offset: getOffset(key, yTrue: true) + 60,
      widget: InkWell(
        onTap: () {
          goBack(context);
        },
        child: Container(
          width: IScreen().width(
                context,
                width: 1.0,
              ) -
              IPadding.p4,
          color: Colors.transparent,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: IScreen().width(context, width: 1.0) / 2 - IPadding.p4,
                padding: const EdgeInsets.symmetric(
                  horizontal: IPadding.p2,
                  vertical: IPadding.p1,
                ),
                decoration: BoxDecoration(
                  color: Palette.primary,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ...dropDown(
                      context,
                      listOutlet: listOutlet,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> dropDown(
    BuildContext context, {
    required List<ModelOutlet> listOutlet,
  }) {
    List<Widget> data = listOutlet.map(
      (e) {
        return StyleDropDownHead().style(
          context,
          nameOutlet: e.nameOutlet,
        );
      },
    ).toList();
    return data;
  }
}

class BodyKurs {
  Widget body(BuildContext context) {
    return Expanded(
      child: Container(
        width: IScreen().width(context, width: 1.0),
        color: Palette.secondary,
        padding: const EdgeInsets.symmetric(
          horizontal: IPadding.p2,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ISizeBox().height(height: IPadding.p1),
              Consumer<KursController>(
                builder: (context, provider, child) {
                  return textFieldPrefix(
                    context,
                    title: "Dari",
                    widget: rowTextFieldPrefix(
                      key: provider.key2,
                      arrowStatus: provider
                              .dialogData[EnumStatusDialogKurs.dialogBody1] ??
                          false,
                      title: "IDR",
                      onTap: () {
                        provider.doOpenDialog(
                          dialog: true,
                          statusDialog: EnumStatusDialogKurs.dialogBody1,
                        );
                        showDialogOnTap(
                          context,
                          colorMaterial: Palette.primary,
                          rightOffset: 0,
                          offset: getOffset(provider.key2, yTrue: true) + 40,
                          widget: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: IPadding.p2,
                              vertical: IPadding.p0,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: styleCategoryCurrencyDialog(
                                listData: provider.listCategoryCurrency,
                              ),
                            ),
                          ),
                        ).then((value) {
                          provider.doOpenDialog(
                            dialog: false,
                            statusDialog: EnumStatusDialogKurs.dialogBody1,
                          );
                        });
                      },
                    ),
                  );
                },
              ),
              ISizeBox().height(height: IPadding.p1),
              Consumer<KursController>(
                builder: (context, provider, child) {
                  return textFieldPrefix(
                    context,
                    title: "Ke",
                    widget: rowTextFieldPrefix(
                      key: provider.key3,
                      title: "IDR",
                      arrowStatus: provider
                              .dialogData[EnumStatusDialogKurs.dialogBody2] ??
                          false,
                      onTap: () {
                        provider.doOpenDialog(
                            dialog: true,
                            statusDialog: EnumStatusDialogKurs.dialogBody2);
                        showDialogOnTap(
                          context,
                          colorMaterial: Palette.primary,
                          rightOffset: 0,
                          offset: getOffset(provider.key3, yTrue: true) + 40,
                          widget: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: IPadding.p2,
                              vertical: IPadding.p0,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: styleCategoryCurrencyDialog(
                                listData: provider.listCategoryCurrency,
                              ),
                            ),
                          ),
                        ).then((value) {
                          provider.doOpenDialog(
                            dialog: false,
                            statusDialog: EnumStatusDialogKurs.dialogBody2,
                          );
                        });
                      },
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> styleCategoryCurrencyDialog({
    required List<ModelCategoryCurrency> listData,
  }) {
    List<Widget> data = listData
        .map(
          (e) => StyleCategoryCurrency().style(title: e.title),
        )
        .toList();
    return data;
  }
}

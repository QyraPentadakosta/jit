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
import '../../../../component/text_field/component_text_field_primary.dart';
import '../../../../component/widget/row_text_field_prefix.dart';
import '../../../../component/widget/style_category_currency_dialog.dart';
import '../../../../component/widget/style_field_add_photo.dart';
import '../../../../core/domain/models/model_card_add_photo.dart';
import '../../../../core/domain/models/model_category_currency.dart';
import '../../../../core/domain/models/model_outlet.dart';
import '../../../../route/function_route.dart';
import '../../../../component/widget/style_drop_down_head.dart';
import '../controller/out_controller.dart';

class OutPage extends StatelessWidget {
  const OutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => OutController(),
      builder: (context, child) => Scaffold(
        backgroundColor: Palette.primary,
        appBar: IAppbar.menu(
          title: "Keluar",
          centerTitle: true,
          backgroundColor: Palette.primary,
        ),
        bottomNavigationBar: buttonSubmitMenu(
          context,
          onTap: () {},
        ),
        body: Column(
          children: [
            Consumer<OutController>(
              builder: (context, provider, child) {
                return BodyButtonDropDownOut().body(
                  context,
                  key: provider.key,
                  listOutlet: provider.listOutlet,
                );
              },
            ),
            BodyOut().body(context),
          ],
        ),
      ),
    );
  }
}

class BodyButtonDropDownOut {
  Widget body(
    BuildContext context, {
    required GlobalKey key,
    required List<ModelOutlet> listOutlet,
  }) {
    return SizedBox(
      width: IScreen().width(context, width: 0.5),
      child: buttonDropdown(
        context,
        key: key,
        statusArrow: context
                .read<OutController>()
                .openDialog[EnumStatusDialogOut.dialogHead] ??
            false,
        title: "Nama Outlet",
        onTap: () {
          context.read<OutController>().doOpenDialog(
                dialog: true,
                enumStatusDialogOut: EnumStatusDialogOut.dialogHead,
              );
          showDialogData(context, key: key, listOutlet: listOutlet).then(
            (value) {
              context.read<OutController>().doOpenDialog(
                    dialog: false,
                    enumStatusDialogOut: EnumStatusDialogOut.dialogHead,
                  );
            },
          );
        },
      ),
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
        return InkWell(
          onTap: () {
            context.read<OutController>().nameOutlet = e.nameOutlet;
            goBack(context);
          },
          child: StyleDropDownHead().style(
            context,
            nameOutlet: e.nameOutlet,
          ),
        );
      },
    ).toList();
    return data;
  }
}

class BodyOut {
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
              textFieldPrimary(null, title: "Start Date"),
              ISizeBox().height(height: IPadding.p1),
              textFieldPrimary(null, title: "Judul"),
              ISizeBox().height(height: IPadding.p1),
              Consumer<OutController>(
                builder: (context, provider, child) {
                  return textFieldPrefix(
                    context,
                    key: provider.key2,
                    title: "Input",
                    widget: rowTextFieldPrefix(
                      title: "IDR",
                      arrowStatus:
                          provider.openDialog[EnumStatusDialogOut.dialogBody] ??
                              false,
                      onTap: () {
                        provider.doOpenDialog(
                          dialog: true,
                          enumStatusDialogOut: EnumStatusDialogOut.dialogBody,
                        );
                        showDialogOnTap(
                          context,
                          rightOffset: 0,
                          offset: getOffset(provider.key2, yTrue: true) + 40,
                          colorMaterial: Palette.primary,
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
                            enumStatusDialogOut: EnumStatusDialogOut.dialogBody,
                          );
                        });
                      },
                    ),
                  );
                },
              ),
              ISizeBox().height(height: IPadding.p2),
              Consumer<OutController>(
                builder: (context, provider, child) {
                  return AddPhotoStyle().styleFieldAddPhoto(
                    context,
                    listWidget: [
                      ...listData(context, listData: provider.listAddPhoto),
                    ],
                  );
                },
              ),
              ISizeBox().height(height: IPadding.p2),
              textFieldPrimary(null, title: "Keterangan"),
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

  List<Widget> listData(
    BuildContext context, {
    required List<ModelCardAddPhoto> listData,
  }) {
    List<Widget> data = listData
        .map(
          (e) => AddPhotoStyle().styleCard(
            context,
            title: e.title,
            status: e.status ?? EnumStatusAddPhoto.empty,
          ),
        )
        .toList();
    return data;
  }
}

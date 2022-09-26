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
import '../controller/move_controller.dart';

class MovePage extends StatelessWidget {
  const MovePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => MoveController(),
      child: Scaffold(
        backgroundColor: Palette.primary,
        appBar: IAppbar.menu(
          title: "Pindah",
          centerTitle: true,
          backgroundColor: Palette.primary,
        ),
        bottomNavigationBar: buttonSubmitMenu(
          context,
          onTap: () {},
        ),
        body: Column(
          children: [
            BodyButtonDropDownMove().body(
              context,
            ),
            BodyMove().body(context),
          ],
        ),
      ),
    );
  }
}

class BodyButtonDropDownMove {
  Widget body(BuildContext context) {
    return Consumer<MoveController>(
      builder: (context, provider, child) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 1,
              child: Container(
                child: buttonDropdown(
                  context,
                  key: provider.key,
                  statusArrow: provider
                          .openDialog[EnumStatusDialogMove.dialogHeadFrom] ??
                      false,
                  title: "Nama Outlet",
                  label: "Dari",
                  onTap: () {
                    provider.doOpenDialog(
                      dialog: true,
                      enumStatusDialogMove: EnumStatusDialogMove.dialogHeadFrom,
                    );
                    showDialogData(
                      context,
                      key: provider.key,
                      leftOffset: 0,
                      listOutlet: provider.listOutlet,
                    ).then((value) {
                      provider.doOpenDialog(
                        dialog: false,
                        enumStatusDialogMove:
                            EnumStatusDialogMove.dialogHeadFrom,
                      );
                    });
                  },
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                child: buttonDropdown(
                  context,
                  key: provider.key2,
                  statusArrow:
                      provider.openDialog[EnumStatusDialogMove.dialogHeadTo] ??
                          false,
                  title: "Nama Outlet",
                  label: "Ke",
                  onTap: () {
                    provider.doOpenDialog(
                      dialog: true,
                      enumStatusDialogMove: EnumStatusDialogMove.dialogHeadTo,
                    );
                    showDialogData(
                      context,
                      key: provider.key2,
                      rightOffset: 0,
                      listOutlet: provider.listOutlet,
                    ).then((value) {
                      provider.doOpenDialog(
                        dialog: false,
                        enumStatusDialogMove: EnumStatusDialogMove.dialogHeadTo,
                      );
                    });
                  },
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Future showDialogData(
    BuildContext context, {
    required GlobalKey key,
    required List<ModelOutlet> listOutlet,
    double? rightOffset,
    double? leftOffset,
  }) {
    return showDialogOnTap(
      context,
      colorMaterial: Colors.transparent,
      rightOffset: rightOffset,
      leftOffset: leftOffset,
      offset: getOffset(key, yTrue: true) + 75,
      widget: InkWell(
        onTap: () {
          goBack(context);
        },
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

class BodyMove {
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
              Consumer<MoveController>(
                builder: (context, provider, child) {
                  return textFieldPrefix(
                    context,
                    title: "Input",
                    widget: rowTextFieldPrefix(
                      key: provider.key3,
                      arrowStatus: provider
                              .openDialog[EnumStatusDialogMove.dialogBody] ??
                          false,
                      title: "IDR",
                      onTap: () {
                        provider.doOpenDialog(
                          dialog: true,
                          enumStatusDialogMove: EnumStatusDialogMove.dialogBody,
                        );
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
                            enumStatusDialogMove:
                                EnumStatusDialogMove.dialogBody,
                          );
                        });
                      },
                    ),
                  );
                },
              ),
              ISizeBox().height(height: IPadding.p2),
              Consumer<MoveController>(
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

import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
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
import '../controller/in_controller.dart';

class InPage extends StatelessWidget {
  const InPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => InController()
        ..getListOutlet()
        ..getListCurrency(),
      child: Scaffold(
        backgroundColor: Palette.primary,
        appBar: IAppbar.menu(
          title: "Masuk",
          centerTitle: true,
          backgroundColor: Palette.primary,
        ),
        bottomSheet: Visibility(
          visible: MediaQuery.of(context).viewInsets.bottom == 0.0,
          child: Consumer<InController>(
            builder: (context, provider, child) {
              return buttonSubmitMenu(
                context,
                onTap: () {
                  provider.addData(context);
                },
              );
            },
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        body: Column(
          children: [
            Consumer<InController>(
              builder: (context, provider, child) {
                return BodyButtonDropDownIn().body(
                  context,
                  key: provider.key,
                  listOutlet: provider.listOutlet,
                );
              },
            ),
            BodyIn().body(context),
            // buttonSubmitMenu(
            //   context,
            //   onTap: () {},
            // )
          ],
        ),
      ),
    );
  }
}

class BodyButtonDropDownIn {
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
                .read<InController>()
                .openDialog[EnumStatusDialogIn.dialogHead] ??
            false,
        title: context.read<InController>().nameOutlet,
        onTap: () {
          context.read<InController>().doOpenDialog(
                dialog: true,
                enumStatusDialogIn: EnumStatusDialogIn.dialogHead,
              );
          showDialogData(context, key: key, listOutlet: listOutlet).then(
            (value) {
              context.read<InController>().doOpenDialog(
                    dialog: false,
                    enumStatusDialogIn: EnumStatusDialogIn.dialogHead,
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
                child: listOutlet.isEmpty
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : Column(
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
            context.read<InController>().setOutlet(context, e: e);
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

class BodyIn {
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
              Consumer<InController>(
                builder: (context, provider, child) {
                  return textFieldPrimary(
                    provider.startDateController,
                    title: "Start Date",
                    keyboardType: TextInputType.datetime,
                    inputFormatters: [
                      MaskTextInputFormatter(
                        mask: "####-##-##",
                        filter: {"#": RegExp('^[0-9]')},
                        type: MaskAutoCompletionType.lazy,
                      )
                    ],
                  );
                },
              ),
              ISizeBox().height(height: IPadding.p1),
              Consumer<InController>(
                builder: (context, provider, child) {
                  return textFieldPrefix(
                    context,
                    title: "Input",
                    inputFormatters: [
                      CurrencyTextInputFormatter(
                        decimalDigits: 0,
                        locale: 'id_ID',
                        name: '',
                        symbol: "",
                      )
                    ],
                    keyboardType: TextInputType.number,
                    controller: provider.priceController,
                    widget: rowTextFieldPrefix(
                      key: provider.key2,
                      title: provider.nameCurrency,
                      arrowStatus:
                          provider.openDialog[EnumStatusDialogIn.dialogBody] ??
                              false,
                      onTap: () {
                        provider.doOpenDialog(
                          dialog: true,
                          enumStatusDialogIn: EnumStatusDialogIn.dialogBody,
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
                                context,
                                listData: provider.listCategoryCurrency,
                              ),
                            ),
                          ),
                        ).then((value) {
                          provider.doOpenDialog(
                            dialog: false,
                            enumStatusDialogIn: EnumStatusDialogIn.dialogBody,
                          );
                        });
                      },
                    ),
                  );
                },
              ),
              ISizeBox().height(height: IPadding.p1),
              Consumer<InController>(
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
              Consumer<InController>(
                builder: (context, provider, child) {
                  return textFieldPrimary(
                    provider.descController,
                    title: "Keterangan",
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> styleCategoryCurrencyDialog(
    BuildContext context, {
    required List<ModelCategoryCurrency> listData,
  }) {
    List<Widget> data = listData
        .map(
          (e) => InkWell(
            onTap: () {
              context.read<InController>().setCurrency(context, e: e);
            },
            child: StyleCategoryCurrency().style(title: e.title),
          ),
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
          (e) => Consumer<InController>(
            builder: (context, provider, child) {
              return InkWell(
                onTap: () {
                  provider.getPhoto(
                    context,
                    index: listData.indexOf(e),
                  );
                },
                child: AddPhotoStyle().styleCard(
                  context,
                  title: e.title,
                  status: e.status ?? EnumStatusAddPhoto.empty,
                  fileImage: e.file,
                ),
              );
            },
          ),
        )
        .toList();
    return data;
  }
}

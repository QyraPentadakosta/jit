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
import '../../../../component/text/text_component.dart';
import '../../../../component/text_field/component_text_field_prefix.dart';
import '../../../../component/widget/row_text_field_prefix.dart';
import '../../../../component/widget/style_category_currency_dialog.dart';
import '../../../../core/domain/models/model_category_currency.dart';
import '../../../../core/domain/models/model_outlet.dart';
import '../../../../route/function_route.dart';
import '../../../../component/widget/style_drop_down_head.dart';
import '../controller/mutation_controller.dart';

class MutationPage extends StatelessWidget {
  const MutationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => MutationController(),
      child: Scaffold(
        backgroundColor: Palette.primary,
        appBar: IAppbar.menu(
          title: "Pindah Kurs",
          centerTitle: true,
          backgroundColor: Palette.primary,
        ),
        bottomNavigationBar: buttonSubmitMenu(
          context,
          onTap: () {},
        ),
        body: Column(
          children: [
            Consumer<MutationController>(
              builder: (context, provider, child) {
                return BodyButtonDropDownMutation().body(
                  context,
                  key: provider.key,
                  listOutlet: provider.listOutlet,
                );
              },
            ),
            BodyMutation().body(context),
          ],
        ),
      ),
    );
  }
}

class BodyButtonDropDownMutation {
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
                    .read<MutationController>()
                    .dialogData[EnumStatusDialogMutation.dialogHead1] ??
                false,
            title: "Nama Outlet",
            onTap: () {
              context.read<MutationController>().doOpenDialog(
                    dialog: true,
                    statusDialog: EnumStatusDialogMutation.dialogHead1,
                  );
              showDialogData(context, key: key, listOutlet: listOutlet).then(
                (value) {
                  context.read<MutationController>().doOpenDialog(
                        dialog: false,
                        statusDialog: EnumStatusDialogMutation.dialogHead1,
                      );
                },
              );
            },
          ),
        ),
        Consumer<MutationController>(
          builder: (context, provider, child) {
            return buttonDropDownReport(
              date: "19/10/2012 - 19/10/2012",
              key: provider.key4,
              statusArrow:
                  provider.dialogData[EnumStatusDialogMutation.dialogHead2] ??
                      false,
              onTap: () {
                provider.doOpenDialog(
                  dialog: true,
                  statusDialog: EnumStatusDialogMutation.dialogHead2,
                );
                dialogReport(
                  context,
                  key: provider.key4,
                ).then(
                  (value) {
                    provider.doOpenDialog(
                      dialog: false,
                      statusDialog: EnumStatusDialogMutation.dialogHead2,
                    );
                  },
                );
              },
            );
          },
        ),
        ISizeBox().height(height: IPadding.p3),
      ],
    );
  }

  Future dialogReport(
    BuildContext context, {
    required GlobalKey key,
  }) {
    return showDialogOnTap(
      context,
      offset: getOffset(key, yTrue: true) + 40,
      widget: Container(
        width: IScreen().width(context, width: 1.0) - IPadding.p4,
        decoration: BoxDecoration(
          color: Palette.primary,
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: IPadding.p1,
          vertical: IPadding.p1,
        ),
        child: Column(
          children: [
            IText.bold("Filter"),
            ISizeBox().height(height: IPadding.p2),
            _styleCardReport(
              title: "Jenis Laporan",
              statusArrow: context
                      .read<MutationController>()
                      .dialogData[EnumStatusDialogMutation.report] ??
                  false,
            ),
            ISizeBox().height(height: IPadding.p2),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _styleCardDate(
                  title: "Start Date",
                  date: "19/10/2012",
                  statusArrow: context
                          .read<MutationController>()
                          .dialogData[EnumStatusDialogMutation.startDate] ??
                      false,
                  onTap: () {},
                ),
                _styleCardDate(
                  title: "End Date",
                  date: "19/10/2012",
                  statusArrow: context
                          .read<MutationController>()
                          .dialogData[EnumStatusDialogMutation.endDate] ??
                      false,
                  onTap: () {},
                ),
              ],
            ),
            ISizeBox().height(height: IPadding.p2),
            Container(
              decoration: BoxDecoration(
                  color: Palette.secondary,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      offset: const Offset(0.0, 2.0),
                      color: Colors.black.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 5,
                    ),
                  ]),
              padding: const EdgeInsets.symmetric(
                vertical: IPadding.p1,
                horizontal: IPadding.p3,
              ),
              child: const Text(
                "Submit",
                style: TextStyle(
                  color: Palette.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _styleCardReport({
    required String title,
    required bool statusArrow,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Card(
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: IPadding.p0,
              horizontal: IPadding.p1,
            ),
            child: Row(
              children: [
                IText.bold(
                  title,
                ),
                Icon(
                  statusArrow
                      ? Icons.keyboard_arrow_up
                      : Icons.keyboard_arrow_down,
                  color: Palette.secondary,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _styleCardDate({
    required String title,
    required String date,
    required Function() onTap,
    required bool statusArrow,
  }) {
    return Column(
      children: [
        IText.bold(
          title,
          fontSize: 10,
        ),
        ISizeBox().height(height: IPadding.p0),
        InkWell(
          onTap: onTap,
          child: Card(
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: IPadding.p0,
                horizontal: IPadding.p1,
              ),
              child: Row(
                children: [
                  IText.bold(date),
                  ISizeBox().height(height: IPadding.p0),
                  Icon(
                    statusArrow
                        ? Icons.keyboard_arrow_up
                        : Icons.keyboard_arrow_down,
                    color: Palette.secondary,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget buttonDropDownReport({
    required String date,
    required bool statusArrow,
    required GlobalKey key,
    Function()? onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            key: key,
            decoration: BoxDecoration(
              color: Palette.secondary2,
              borderRadius: BorderRadius.circular(10),
            ),
            padding: const EdgeInsets.symmetric(
              vertical: IPadding.p0,
              horizontal: IPadding.p1,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IText.bold(
                  "Jenis Laporan",
                ),
                ISizeBox().width(width: IPadding.p1),
                IText.regular(date),
                Icon(
                  statusArrow
                      ? Icons.keyboard_arrow_up
                      : Icons.keyboard_arrow_down,
                  color: Palette.secondary,
                ),
              ],
            ),
          ),
        ],
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
                    )
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

class BodyMutation {
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
              Consumer<MutationController>(
                builder: (context, provider, child) {
                  return textFieldPrefix(
                    context,
                    title: "Dari",
                    widget: rowTextFieldPrefix(
                      key: provider.key2,
                      arrowStatus: provider
                              .dialogData[EnumStatusDialogMutation.dialog1] ??
                          false,
                      title: "IDR",
                      onTap: () {
                        provider.doOpenDialog(
                          dialog: true,
                          statusDialog: EnumStatusDialogMutation.dialog1,
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
                            statusDialog: EnumStatusDialogMutation.dialog1,
                          );
                        });
                      },
                    ),
                  );
                },
              ),
              ISizeBox().height(height: IPadding.p1),
              Consumer<MutationController>(
                builder: (context, provider, child) {
                  return textFieldPrefix(
                    context,
                    title: "Ke",
                    widget: rowTextFieldPrefix(
                      key: provider.key3,
                      title: "IDR",
                      arrowStatus: provider
                              .dialogData[EnumStatusDialogMutation.dialog2] ??
                          false,
                      onTap: () {
                        provider.doOpenDialog(
                            dialog: true,
                            statusDialog: EnumStatusDialogMutation.dialog2);
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
                            statusDialog: EnumStatusDialogMutation.dialog2,
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

import 'package:flutter/cupertino.dart';

import '../../../../core/domain/models/model_card_add_photo.dart';
import '../../../../core/domain/models/model_category_currency.dart';
import '../../../../core/domain/models/model_outlet.dart';

enum EnumStatusDialogMutation {
  dialog1,
  dialog2,
  dialogHead1,
  dialogHead2,
  report,
  startDate,
  endDate,
}

class MutationController extends ChangeNotifier {
  GlobalKey key = GlobalKey();
  GlobalKey key2 = GlobalKey();
  GlobalKey key3 = GlobalKey();
  GlobalKey key4 = GlobalKey();

  Map<EnumStatusDialogMutation, bool> dialogData = {
    EnumStatusDialogMutation.dialog1: false,
    EnumStatusDialogMutation.dialog2: false,
    EnumStatusDialogMutation.dialogHead1: false,
    EnumStatusDialogMutation.dialogHead2: false,
    EnumStatusDialogMutation.report: false,
    EnumStatusDialogMutation.startDate: false,
    EnumStatusDialogMutation.endDate: false,
  };

  List<ModelCardAddPhoto> listAddPhoto = [
    ModelCardAddPhoto(
      title: "Tambahkan\nFoto",
      status: EnumStatusAddPhoto.initial,
    ),
    ModelCardAddPhoto(
      title: "Tambahkan\nFoto",
    ),
    ModelCardAddPhoto(
      title: "Tambahkan\nFoto",
    ),
    ModelCardAddPhoto(
      title: "Tambahkan\nFoto",
    )
  ];
  List<ModelCategoryCurrency> listCategoryCurrency = [
    ModelCategoryCurrency(index: 1, title: "IDR"),
    ModelCategoryCurrency(index: 2, title: "USD"),
    ModelCategoryCurrency(index: 3, title: "EUR"),
    ModelCategoryCurrency(index: 4, title: "SGD"),
  ];
  List<ModelOutlet> listOutlet = [
    ModelOutlet(index: 1, nameOutlet: "Outlet 1"),
    ModelOutlet(index: 2, nameOutlet: "Outlet 2"),
    ModelOutlet(index: 3, nameOutlet: "Outlet 3"),
    ModelOutlet(index: 4, nameOutlet: "Outlet 4"),
    ModelOutlet(index: 5, nameOutlet: "Outlet 5"),
  ];

  void doOpenDialog({
    required bool dialog,
    required EnumStatusDialogMutation statusDialog,
  }) {
    dialogData[statusDialog] = dialog;
    notifyListeners();
  }
}

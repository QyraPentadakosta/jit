import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../component/snackbar/i_snackbar.dart';
import '../../../../core/constant/i_constant.dart';
import '../../../../core/constant/i_constant_function.dart';
import '../../../../core/domain/models/model_card_add_photo.dart';
import '../../../../core/domain/models/model_category_currency.dart';
import '../../../../core/domain/models/model_outlet.dart';
import '../../../../repository/services/trx/model/model_trx_add.dart';
import '../../../../route/function_route.dart';
import '../../../../utils/image_picker/image_picker.dart';
import '../services/in_services.dart';

enum EnumStatusDialogIn {
  dialogHead,
  dialogBody,
}

class InController extends ChangeNotifier {
  final InServices _inServices = InServices();
  GlobalKey key = GlobalKey();
  GlobalKey key2 = GlobalKey();
  TextEditingController startDateController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController descController = TextEditingController();

  String nameOutlet = "Nama Outlet";
  String nameCurrency = "-";
  late int outletId;
  late int currencyId;

  Map<EnumStatusDialogIn, bool> openDialog = {
    EnumStatusDialogIn.dialogHead: false,
    EnumStatusDialogIn.dialogBody: false,
  };

  List<ModelCardAddPhoto> listAddPhoto = [
    ModelCardAddPhoto(
        title: "Tambahkan\nFoto", status: EnumStatusAddPhoto.initial),
    ModelCardAddPhoto(title: "Tambahkan\nFoto"),
    ModelCardAddPhoto(title: "Tambahkan\nFoto"),
    ModelCardAddPhoto(title: "Tambahkan\nFoto"),
  ];
  List<ModelCategoryCurrency> listCategoryCurrency = [];
  List<ModelOutlet> listOutlet = [];

  bool get mounted => true;

  void doOpenDialog({
    required bool dialog,
    required EnumStatusDialogIn enumStatusDialogIn,
  }) {
    openDialog[enumStatusDialogIn] = dialog;
    notifyListeners();
  }

  Future getListOutlet() async {
    var resp = await _inServices.getListOutlet();
    if (resp != null) {
      listOutlet = resp;
    }
    notifyListeners();
  }

  Future getPhoto(
    BuildContext context, {
    required int index,
  }) async {
    if (listAddPhoto[index].status == EnumStatusAddPhoto.initial) {
      XFile? dataImage = await IImagePicker().getImageFromGallery(context);
      if (dataImage != null) {
        int indexPlus = index + 1;
        if (index <= 2) {
          listAddPhoto[index].status = EnumStatusAddPhoto.filled;
          listAddPhoto[index].file = File(dataImage.path);
          listAddPhoto[indexPlus].status = EnumStatusAddPhoto.initial;
        } else {
          listAddPhoto[index].status = EnumStatusAddPhoto.filled;
          listAddPhoto[index].file = File(dataImage.path);
        }
        notifyListeners();
      }
    } else {
      if (index != 3) {
        listAddPhoto[index].status = EnumStatusAddPhoto.initial;
        listAddPhoto[index].file = null;
        listAddPhoto[index + 1].status = null;
      } else {
        listAddPhoto[index].status = EnumStatusAddPhoto.initial;
        listAddPhoto[index].file = null;
      }
      notifyListeners();
    }
  }

  Future getListCurrency() async {
    var resp = await _inServices.getListCurrency();
    if (resp != null) {
      listCategoryCurrency = resp;
      nameCurrency = resp.first.title;
      currencyId = resp.first.index;
      notifyListeners();
    }
  }

  Future addData(
    BuildContext context,
  ) async {
    String outletID =
        await IConstantFunction().getString(IConstants.outletID) ?? "";
    String userID =
        await IConstantFunction().getString(IConstants.userID) ?? "";
    if (nameOutlet != "Nama Outlet" &&
        nameCurrency != "-" &&
        priceController.text.isNotEmpty &&
        startDateController.text.isNotEmpty) {
      if (mounted) {
        var resp = await _inServices.addData(
          context,
          outletId: int.tryParse(outletID) ?? 0,
          userId: int.tryParse(userID) ?? 0,
          ptipe: 1,
          currId: currencyId,
          nominal: priceController.text,
          description: descController.text,
          photo: "",
          photo2: "",
          photo3: "",
          photo4: "",
          outletId1: outletId,
          outletId2: 0,
          date: startDateController.text,
        );
        if (resp is ModelTrxAdd) {
          if (mounted) {
            iShowSnackBar(
              context,
              title: "Success",
              subTitle: "Success to add data",
              success: true,
            );
          }
        } else {
          if (mounted) {
            iShowSnackBar(
              context,
              title: "Failed",
              subTitle: "Failed to add data",
            );
          }
        }
      }
    } else {
      if (mounted) {
        iShowSnackBar(
          context,
          title: "Failed",
          subTitle: "Data not complete",
        );
      }
    }
  }

  void setCurrency(
    BuildContext context, {
    required ModelCategoryCurrency e,
  }) {
    currencyId = e.index;
    nameCurrency = e.title;
    notifyListeners();
    goBack(context);
  }

  void setOutlet(BuildContext context, {required ModelOutlet e}) {
    nameOutlet = e.nameOutlet;
    outletId = e.index;
    notifyListeners();
    goBack(context);
  }
}

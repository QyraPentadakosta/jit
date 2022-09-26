class ModelInitData {
  ModelInitData({
    this.status,
    this.data,
    this.debugParamSent,
    this.debugLive,
  });

  Status? status;
  Data? data;
  List? debugParamSent;
  String? debugLive;

  factory ModelInitData.fromJson(Map<String, dynamic> json) => ModelInitData(
        status: Status.fromJson(json["status"]),
        data: Data.fromJson(json["data"] ?? {}),
        debugParamSent:
            List<dynamic>.from(json["debug-param-sent"].map((x) => x)),
        debugLive: json["debug-live"],
      );
}

class Data {
  Data({
    this.outlet,
    this.outletSubs,
    this.trxTipe,
    this.payTipe,
    this.curTipe,
  });

  Outlet? outlet;
  List<OutletSub>? outletSubs;
  List<TrxTipe>? trxTipe;
  List<PayTipe>? payTipe;
  List<CurTipe>? curTipe;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        outlet: Outlet.fromJson(json["outlet"] ?? {}),
        outletSubs: List<OutletSub>.from(
          json["outlet_subs"] == null
              ? {}
              : json["outlet_subs"].map((x) => OutletSub.fromJson(x)),
        ),
        trxTipe: List<TrxTipe>.from(json["trx_tipe"] == null
            ? {}
            : json["trx_tipe"].map((x) => TrxTipe.fromJson(x))),
        payTipe: List<PayTipe>.from(json["pay_tipe"] == null
            ? {}
            : json["pay_tipe"].map((x) => PayTipe.fromJson(x))),
        curTipe: List<CurTipe>.from(json["cur_tipe"] == null
            ? {}
            : json["cur_tipe"].map((x) => CurTipe.fromJson(x))),
      );
}

class CurTipe {
  CurTipe({
    this.ctId,
    this.ctNama,
    this.ctLogo,
    this.ctKet,
  });

  String? ctId;
  String? ctNama;
  String? ctLogo;
  String? ctKet;

  factory CurTipe.fromJson(Map<String, dynamic> json) => CurTipe(
        ctId: json["ct_id"],
        ctNama: json["ct_nama"],
        ctLogo: json["ct_logo"],
        ctKet: json["ct_ket"],
      );
}

class Outlet {
  Outlet({
    this.id,
    this.outletName,
    this.outletCode,
    this.outletAddress,
    this.outletPhone,
    this.invoicePrint,
    this.startingDate,
    this.invoiceFooter,
    this.dateFormat,
    this.timeZone,
    this.currency,
    this.currencyShow,
    this.decimalShow,
    this.decimalDigit,
    this.decimalZeroHide,
    this.outletMode,
    this.showIngCode,
    this.hppMode,
    this.cekAksesBydb,
    this.collectTax,
    this.taxRegistrationTitle,
    this.taxRegistrationNo,
    this.taxTitle,
    this.taxUseGlobal,
    this.taxIsGst,
    this.stateCode,
    this.preOrPostPayment,
    this.userId,
    this.parentId,
    this.orderId,
    this.maxSub,
    this.delStatus,
  });

  String? id;
  String? outletName;
  String? outletCode;
  String? outletAddress;
  String? outletPhone;
  String? invoicePrint;
  DateTime? startingDate;
  String? invoiceFooter;
  String? dateFormat;
  String? timeZone;
  String? currency;
  String? currencyShow;
  String? decimalShow;
  String? decimalDigit;
  String? decimalZeroHide;
  String? outletMode;
  String? showIngCode;
  String? hppMode;
  String? cekAksesBydb;
  String? collectTax;
  String? taxRegistrationTitle;
  String? taxRegistrationNo;
  String? taxTitle;
  String? taxUseGlobal;
  String? taxIsGst;
  String? stateCode;
  String? preOrPostPayment;
  String? userId;
  String? parentId;
  String? orderId;
  String? maxSub;
  String? delStatus;

  factory Outlet.fromJson(Map<String, dynamic> json) => Outlet(
        id: json["id"],
        outletName: json["outlet_name"],
        outletCode: json["outlet_code"],
        outletAddress: json["outlet_address"],
        outletPhone: json["outlet_phone"],
        invoicePrint: json["invoice_print"],
        startingDate: DateTime.parse(json["starting_date"] ?? "0000-00-00"),
        invoiceFooter: json["invoice_footer"],
        dateFormat: json["date_format"],
        timeZone: json["time_zone"],
        currency: json["currency"],
        currencyShow: json["currency_show"],
        decimalShow: json["decimal_show"],
        decimalDigit: json["decimal_digit"],
        decimalZeroHide: json["decimal_zero_hide"],
        outletMode: json["outlet_mode"],
        showIngCode: json["show_ing_code"],
        hppMode: json["hpp_mode"],
        cekAksesBydb: json["cek_akses_bydb"],
        collectTax: json["collect_tax"],
        taxRegistrationTitle: json["tax_registration_title"],
        taxRegistrationNo: json["tax_registration_no"],
        taxTitle: json["tax_title"],
        taxUseGlobal: json["tax_use_global"],
        taxIsGst: json["tax_is_gst"],
        stateCode: json["state_code"],
        preOrPostPayment: json["pre_or_post_payment"],
        userId: json["user_id"],
        parentId: json["parent_id"],
        orderId: json["order_id"],
        maxSub: json["max_sub"],
        delStatus: json["del_status"],
      );
}

class OutletSub {
  OutletSub({
    this.id,
    this.outletName,
    this.parentId,
    this.orderId,
    this.initContainer,
  });

  String? id;
  String? outletName;
  String? parentId;
  String? orderId;
  double? initContainer;

  factory OutletSub.fromJson(Map<String, dynamic> json) => OutletSub(
        id: json["id"],
        outletName: json["outlet_name"],
        parentId: json["parent_id"],
        orderId: json["order_id"],
      );
}

class PayTipe {
  PayTipe({
    this.byrId,
    this.byrNama,
    this.byrDesc,
    this.byrQrisData,
    this.byrQrisImage,
    this.byrHttp,
    this.outletId,
    this.delStatus,
  });

  String? byrId;
  String? byrNama;
  String? byrDesc;
  String? byrQrisData;
  String? byrQrisImage;
  String? byrHttp;
  String? outletId;
  String? delStatus;

  factory PayTipe.fromJson(Map<String, dynamic> json) => PayTipe(
        byrId: json["byr_id"],
        byrNama: json["byr_nama"],
        byrDesc: json["byr_desc"],
        byrQrisData: json["byr_qris_data"],
        byrQrisImage: json["byr_qris_image"],
        byrHttp: json["byr_http"],
        outletId: json["outlet_id"],
        delStatus: json["del_status"],
      );
}

class TrxTipe {
  TrxTipe({
    this.id,
    this.nama,
    this.trx,
    this.outletId,
    this.delStatus,
  });

  String? id;
  String? nama;
  String? trx;
  String? outletId;
  String? delStatus;

  factory TrxTipe.fromJson(Map<String, dynamic> json) => TrxTipe(
        id: json["id"],
        nama: json["nama"],
        trx: json["trx"],
        outletId: json["outlet_id"],
        delStatus: json["del_status"],
      );
}

class Status {
  Status({
    this.error,
    this.login,
    this.apiVer,
    this.devDebugParam,
  });

  int? error;
  bool? login;
  String? apiVer;
  String? devDebugParam;

  factory Status.fromJson(Map<String, dynamic> json) => Status(
        error: json["error"],
        login: json["login"],
        apiVer: json["api-ver"],
        devDebugParam: json["dev-debug-param"],
      );
}

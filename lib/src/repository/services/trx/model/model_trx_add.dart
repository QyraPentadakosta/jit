class ModelTrxAdd {
  ModelTrxAdd({
    this.status,
    this.data,
    this.debugParamSent,
    this.debugLive,
  });

  Status? status;
  Data? data;
  DebugParamSent? debugParamSent;
  String? debugLive;

  factory ModelTrxAdd.fromJson(Map<String, dynamic> json) => ModelTrxAdd(
        status: Status.fromJson(json["status"]),
        data: Data.fromJson(json["data"] ?? {}),
        debugParamSent: DebugParamSent.fromJson(json["debug-param-sent"]),
        debugLive: json["debug-live"],
      );
}

class Data {
  Data({
    this.trxId,
    this.trxDateCreated,
    this.trxTgl,
    this.trxPtipe,
    this.trxNominal,
    this.trxCurTipe,
    this.trxKet,
    this.trxPhoto,
    this.trxAsalOutletId,
    this.trxDarikeOutletId,
    this.trxBayarVia,
    this.trxUserId,
    this.trxOutletId,
    this.trxStatus,
    this.trxIsStok,
    this.trxDateModif,
    this.trxDeleted,
    this.trxDeletedBy,
    this.trxDeletedKet,
  });

  String? trxId;
  DateTime? trxDateCreated;
  DateTime? trxTgl;
  String? trxPtipe;
  String? trxNominal;
  String? trxCurTipe;
  String? trxKet;
  String? trxPhoto;
  String? trxAsalOutletId;
  String? trxDarikeOutletId;
  String? trxBayarVia;
  String? trxUserId;
  String? trxOutletId;
  String? trxStatus;
  String? trxIsStok;
  DateTime? trxDateModif;
  String? trxDeleted;
  String? trxDeletedBy;
  String? trxDeletedKet;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        trxId: json["trx_id"],
        trxDateCreated:
            DateTime.parse(json["trx_date_created"] ?? "2022-09-24 03:52:08"),
        trxTgl: DateTime.parse(json["trx_tgl"]),
        trxPtipe: json["trx_ptipe"],
        trxNominal: json["trx_nominal"],
        trxCurTipe: json["trx_cur_tipe"],
        trxKet: json["trx_ket"],
        trxPhoto: json["trx_photo"],
        trxAsalOutletId: json["trx_asal_outlet_id"],
        trxDarikeOutletId: json["trx_darike_outlet_id"],
        trxBayarVia: json["trx_bayar_via"],
        trxUserId: json["trx_user_id"],
        trxOutletId: json["trx_outlet_id"],
        trxStatus: json["trx_status"],
        trxIsStok: json["trx_is_stok"],
        trxDateModif: DateTime.parse(json["trx_date_modif"]),
        trxDeleted: json["trx_deleted"],
        trxDeletedBy: json["trx_deleted_by"],
        trxDeletedKet: json["trx_deleted_ket"],
      );
}

class DebugParamSent {
  DebugParamSent();

  factory DebugParamSent.fromJson(Map<String, dynamic> json) =>
      DebugParamSent();

  Map<String, dynamic> toJson() => {};
}

class Status {
  Status({
    this.error,
    this.login,
    this.userId,
    this.role,
    this.apiVer,
    this.devDebugParam,
  });

  int? error;
  bool? login;
  String? userId;
  String? role;
  String? apiVer;
  String? devDebugParam;

  factory Status.fromJson(Map<String, dynamic> json) => Status(
        error: json["error"],
        login: json["login"],
        userId: json["user_id"],
        role: json["role"],
        apiVer: json["api-ver"],
        devDebugParam: json["dev-debug-param"],
      );
}

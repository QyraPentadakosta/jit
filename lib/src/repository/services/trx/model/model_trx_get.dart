class ModelTrxGet {
  ModelTrxGet({
    this.status,
    this.data,
    this.debugParamSent,
    this.debugLive,
  });

  Status? status;
  List<Datum>? data;
  DebugParamSent? debugParamSent;
  String? debugLive;

  factory ModelTrxGet.fromJson(Map<String, dynamic> json) => ModelTrxGet(
        status: Status.fromJson(json["status"]),
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        debugParamSent: DebugParamSent.fromJson(json["debug-param-sent"]),
        debugLive: json["debug-live"],
      );
}

class Datum {
  Datum({
    this.trxPtipeNama,
    this.trxCurtipeVar,
    this.trxAsalOutletNama,
    this.trxDarikeOutletId,
    this.trxDarikeOutletNama,
    this.trxId,
    this.trxTgl,
    this.trxPtipe,
    this.trxDateCreated,
    this.trxNominal,
    this.trxKet,
    this.trxStatus,
    this.trxIsStok,
    this.trxAsalOutletId,
    this.trxOutletId,
  });

  TrxPtipeNama? trxPtipeNama;
  TrxCurtipeVar? trxCurtipeVar;
  TrxOutletNama? trxAsalOutletNama;
  String? trxDarikeOutletId;
  TrxOutletNama? trxDarikeOutletNama;
  String? trxId;
  String? trxTgl;
  String? trxPtipe;
  DateTime? trxDateCreated;
  String? trxNominal;
  String? trxKet;
  String? trxStatus;
  String? trxIsStok;
  String? trxAsalOutletId;
  String? trxOutletId;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        trxPtipeNama: trxPtipeNamaValues.map?[json["trx_ptipe_nama"]],
        trxCurtipeVar: trxCurtipeVarValues.map?[json["trx_curtipe_var"]],
        trxAsalOutletNama:
            trxOutletNamaValues.map?[json["trx_asal_outlet_nama"]],
        trxDarikeOutletId: json["trx_darike_outlet_id"],
        trxDarikeOutletNama:
            trxOutletNamaValues.map?[json["trx_darike_outlet_nama"]],
        trxId: json["trx_id"],
        trxTgl: json["trx_tgl"],
        trxPtipe: json["trx_ptipe"],
        trxDateCreated: DateTime.parse(json["trx_date_created"]),
        trxNominal: json["trx_nominal"],
        trxKet: json["trx_ket"],
        trxStatus: json["trx_status"],
        trxIsStok: json["trx_is_stok"],
        trxAsalOutletId: json["trx_asal_outlet_id"],
        trxOutletId: json["trx_outlet_id"],
      );
}

enum TrxOutletNama { DANONE, INDUK, AQUA, EMPTY, LION, JTI }

final trxOutletNamaValues = EnumValues({
  "AQUA": TrxOutletNama.AQUA,
  "Danone": TrxOutletNama.DANONE,
  "": TrxOutletNama.EMPTY,
  "Induk": TrxOutletNama.INDUK,
  "JTI": TrxOutletNama.JTI,
  "Lion": TrxOutletNama.LION
});

enum TrxCurtipeVar { RP, S, EMPTY }

final trxCurtipeVarValues = EnumValues({
  "\u0024": TrxCurtipeVar.EMPTY,
  "Rp": TrxCurtipeVar.RP,
  "S\u0024": TrxCurtipeVar.S
});

enum TrxPtipeNama { MASUK, KELUAR }

final trxPtipeNamaValues =
    EnumValues({"Keluar": TrxPtipeNama.KELUAR, "Masuk": TrxPtipeNama.MASUK});

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

class EnumValues<T> {
  Map<String, T>? map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String>? get reverse {
    reverseMap ??= map?.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}

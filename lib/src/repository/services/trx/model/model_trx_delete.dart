class ModelTrxDelete {
  ModelTrxDelete({
    this.status,
    this.data,
    this.debugParamSent,
    this.debugLive,
  });

  Status? status;
  bool? data;
  DebugParamSent? debugParamSent;
  String? debugLive;

  factory ModelTrxDelete.fromJson(Map<String, dynamic> json) => ModelTrxDelete(
        status: Status.fromJson(json["status"]),
        data: json["data"],
        debugParamSent: DebugParamSent.fromJson(json["debug-param-sent"]),
        debugLive: json["debug-live"],
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

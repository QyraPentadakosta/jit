class ModelStatusError {
  ModelStatusError({
    this.status,
  });

  Status? status;

  factory ModelStatusError.fromJson(Map<String, dynamic> json) =>
      ModelStatusError(
        status: Status.fromJson(json["status"]),
      );
}

class Status {
  Status({
    this.error,
    this.errInfo,
    this.apiVer,
    this.devDebugParam,
  });

  int? error;
  String? errInfo;
  String? apiVer;
  String? devDebugParam;

  factory Status.fromJson(Map<String, dynamic> json) => Status(
        error: json["error"],
        errInfo: json["err-info"],
        apiVer: json["api-ver"],
        devDebugParam: json["dev-debug-param"],
      );
}

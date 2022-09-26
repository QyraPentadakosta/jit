class ModelBackgroundHit {
  ModelBackgroundHit({
    this.status,
    this.data,
    this.debugParamSent,
    this.debugLive,
  });

  Status? status;
  Data? data;
  DebugParamSent? debugParamSent;
  String? debugLive;

  factory ModelBackgroundHit.fromJson(Map<String, dynamic> json) =>
      ModelBackgroundHit(
        status: Status.fromJson(json["status"]),
        data: Data.fromJson(json["data"]),
        debugParamSent: DebugParamSent.fromJson(json["debug-param-sent"]),
        debugLive: json["debug-live"],
      );
}

class Data {
  Data({
    this.serverTime,
    this.sender,
  });

  DateTime? serverTime;
  Sender? sender;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        serverTime: DateTime.parse(json["Server-Time"]),
        sender: Sender.fromJson(json["Sender"]),
      );
}

class Sender {
  Sender({
    this.nama,
    this.email,
    this.nohp,
  });

  String? nama;
  String? email;
  String? nohp;

  factory Sender.fromJson(Map<String, dynamic> json) => Sender(
        nama: json["nama"],
        email: json["email"],
        nohp: json["nohp"],
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

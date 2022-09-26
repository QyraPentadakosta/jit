class ModelAuthLogin {
  ModelAuthLogin({
    this.status,
    this.data,
    this.debugParamSent,
    this.debugLive,
  });

  Status? status;
  Data? data;
  DebugParamSent? debugParamSent;
  String? debugLive;

  factory ModelAuthLogin.fromJson(Map<String, dynamic> json) => ModelAuthLogin(
        status: Status.fromJson(json["status"]),
        data: Data.fromJson(json["data"] ?? {}),
        debugParamSent: DebugParamSent.fromJson(json["debug-param-sent"]),
        debugLive: json["debug-live"],
      );
}

class Data {
  Data({
    this.user,
  });

  User? user;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        user: User.fromJson(json["user"] ?? {}),
      );
}

class User {
  User({
    this.userId,
    this.language,
    this.fullName,
    this.phone,
    this.emailAddress,
    this.role,
    this.designation,
    this.outletId,
  });

  String? userId;
  String? language;
  String? fullName;
  String? phone;
  String? emailAddress;
  String? role;
  String? designation;
  String? outletId;

  factory User.fromJson(Map<String, dynamic> json) => User(
        userId: json["user_id"],
        language: json["language"],
        fullName: json["full_name"],
        phone: json["phone"],
        emailAddress: json["email_address"],
        role: json["role"],
        designation: json["designation"],
        outletId: json["outlet_id"],
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

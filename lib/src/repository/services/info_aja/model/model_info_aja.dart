class ModelInfoAja {
  ModelInfoAja({
    this.status,
    this.data,
    this.debugParamSent,
    this.debugLive,
  });

  Status? status;
  Data? data;
  List<dynamic>? debugParamSent;
  String? debugLive;

  factory ModelInfoAja.fromJson(Map<String, dynamic> json) => ModelInfoAja(
        status: Status.fromJson(json["status"]),
        data: Data.fromJson(json["data"]),
        debugParamSent:
            List<dynamic>.from(json["debug-param-sent"].map((x) => x)),
        debugLive: json["debug-live"],
      );
}

class Data {
  Data({
    this.users,
  });

  List<User>? users;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        users: List<User>.from(json["users"].map((x) => User.fromJson(x))),
      );
}

class User {
  User({
    this.id,
    this.fullName,
    this.phone,
    this.emailAddress,
    this.password,
    this.designation,
    this.willLogin,
    this.role,
    this.outletId,
    this.companyId,
    this.accountCreationDate,
    this.language,
    this.lastLogin,
    this.activeStatus,
    this.recoverToken,
    this.recoverValid,
    this.delStatus,
    this.outletName,
  });

  String? id;
  String? fullName;
  String? phone;
  String? emailAddress;
  String? password;
  String? designation;
  String? willLogin;
  String? role;
  String? outletId;
  String? companyId;
  DateTime? accountCreationDate;
  String? language;
  DateTime? lastLogin;
  String? activeStatus;
  String? recoverToken;
  String? recoverValid;
  String? delStatus;
  String? outletName;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        fullName: json["full_name"],
        phone: json["phone"],
        emailAddress: json["email_address"],
        password: json["password"],
        designation: json["designation"],
        willLogin: json["will_login"],
        role: json["role"],
        outletId: json["outlet_id"],
        companyId: json["company_id"],
        accountCreationDate: DateTime.parse(json["account_creation_date"]),
        language: json["language"],
        lastLogin: DateTime.parse(json["last_login"]),
        activeStatus: json["active_status"],
        recoverToken: json["recover_token"],
        recoverValid: json["recover_valid"],
        delStatus: json["del_status"],
        outletName: json["outlet_name"],
      );
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

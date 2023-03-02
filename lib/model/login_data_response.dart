import 'dart:convert';

LoginDataResponse loginDataResponseFromJson(String str) => LoginDataResponse.fromJson(json.decode(str));

String loginDataResponseToJson(LoginDataResponse data) => json.encode(data.toJson());

class LoginDataResponse {
  LoginDataResponse({
    required this.status,
    required this.msg,
    required this.info,
  });

  int status;
  String msg;
  Info info;

  factory LoginDataResponse.fromJson(Map<String, dynamic> json) => LoginDataResponse(
    status: json["status"] ?? '',
    msg: json["msg"] ?? '',
    info: Info.fromJson(json["info"] ?? ''),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "msg": msg,
    "info": info.toJson(),
  };
}

class Info {
  Info({
    required this.registerId,
  });

  String registerId;

  factory Info.fromJson(Map<String, dynamic> json) => Info(
    registerId: json["registerId"],
  );

  Map<String, dynamic> toJson() => {
    "registerId": registerId,
  };
}

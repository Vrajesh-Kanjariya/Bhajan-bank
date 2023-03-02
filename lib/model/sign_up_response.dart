import 'dart:convert';

SignUpResponse signUpResponseFromJson(String str) => SignUpResponse.fromJson(json.decode(str));

String signUpResponseToJson(SignUpResponse data) => json.encode(data.toJson());

class SignUpResponse {
  SignUpResponse({
    required this.status,
    required this.msg,
    required this.info,
  });

  int status;
  String msg;
  String info;

  factory SignUpResponse.fromJson(Map<String, dynamic> json) => SignUpResponse(
    status: json["status"],
    msg: json["msg"],
    info: json["info"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "msg": msg,
    "info": info,
  };
}

import 'dart:convert';

ReSendOtpResponse reSendOtpResponseFromJson(String str) => ReSendOtpResponse.fromJson(json.decode(str));

String reSendOtpResponseToJson(ReSendOtpResponse data) => json.encode(data.toJson());

class ReSendOtpResponse {
  ReSendOtpResponse({
    required this.status,
    required this.msg,
    required this.info,
  });

  int status;
  String msg;
  dynamic info;

  factory ReSendOtpResponse.fromJson(Map<String, dynamic> json) => ReSendOtpResponse(
    status: json["status"] ?? '',
    msg: json["msg"] ?? '',
    info: json["info"] ?? '',
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "msg": msg,
    "info": info,
  };
}

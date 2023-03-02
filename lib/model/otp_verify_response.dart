import 'dart:convert';

OtpVerifyResponse otpVerifyResponseFromJson(String str) => OtpVerifyResponse.fromJson(json.decode(str));

String otpVerifyResponseToJson(OtpVerifyResponse data) => json.encode(data.toJson());

class OtpVerifyResponse {
  OtpVerifyResponse({
    required this.status,
    required this.msg,
    required this.info,
  });

  int status;
  String msg;
  Info info;

  factory OtpVerifyResponse.fromJson(Map<String, dynamic> json) => OtpVerifyResponse(
    status: json["status"] ?? '',
    msg: json["msg"] ?? '',
    info: Info.fromJson(json["info"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "msg": msg,
    "info": info.toJson(),
  };
}

class Info {
  Info({
    required this.token,
    required this.registerId,
    required this.memberId,
    required this.isProfileStatus,
    required this.isAddMemeberStatus,
    required this.isUserSelectedStatus,
  });

  String token;
  String registerId;
  String memberId;
  bool isProfileStatus;
  bool isAddMemeberStatus;
  bool isUserSelectedStatus;

  factory Info.fromJson(Map<String, dynamic> json) => Info(
    token: json["token"] ?? '',
    registerId: json["registerId"] ?? '',
    memberId: json["memberId"] ?? '',
    isProfileStatus: json["isProfileStatus"] ?? '',
    isAddMemeberStatus: json["isAddMemeberStatus"] ?? '',
    isUserSelectedStatus: json["isUserSelectedStatus"] ?? '',
  );

  Map<String, dynamic> toJson() => {
    "token": token,
    "memberId": memberId,
    "registerId": registerId,
    "isProfileStatus": isProfileStatus,
    "isAddMemeberStatus": isAddMemeberStatus,
    "isUserSelectedStatus": isUserSelectedStatus,
  };
}

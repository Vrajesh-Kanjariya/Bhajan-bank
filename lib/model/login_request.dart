import 'dart:convert';

LoginRequest loginFromJson(String str) => LoginRequest.fromJson(json.decode(str));

String loginToJson(LoginRequest? data) => json.encode(data!.toJson());

class LoginRequest {
  LoginRequest({
    required this.mobileNo,
    required this.countryName,
    required this.fcmToken,
  });

  String mobileNo;
  String countryName;
  String fcmToken;

  factory LoginRequest.fromJson(Map<String, dynamic> json) => LoginRequest(
    mobileNo: json["mobileNo"],
    countryName: json["countryName"],
    fcmToken: json["fcmToken"],
  );

  Map<String, dynamic> toJson() => {
    "mobileNo": mobileNo,
    "countryName": countryName,
    "fcmToken": fcmToken,
  };
}

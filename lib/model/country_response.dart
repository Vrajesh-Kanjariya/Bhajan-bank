import 'dart:convert';

CountryResponse countryResponseFromJson(String str) => CountryResponse.fromJson(json.decode(str));

String countryResponseToJson(CountryResponse data) => json.encode(data.toJson());

class CountryResponse {
  CountryResponse({
    required this.status,
    required this.msg,
    required this.info,
  });

  int status;
  String msg;
  List<CountryInfoResponse> info;

  factory CountryResponse.fromJson(Map<String, dynamic> json) => CountryResponse(
    status: json["status"],
    msg: json["msg"],
    info: List<CountryInfoResponse>.from(json["info"].map((x) => CountryInfoResponse.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "msg": msg,
    "info": List<dynamic>.from(info.map((x) => x.toJson())),
  };
}

class CountryInfoResponse {
  CountryInfoResponse({
    required this.countryId,
    required this.countyName,
    required this.code,
  });

  int countryId;
  String countyName;
  String code;

  factory CountryInfoResponse.fromJson(Map<String, dynamic> json) => CountryInfoResponse(
    countryId: json["countryId"],
    countyName: json["countyName"],
    code: json["code"],
  );

  Map<String, dynamic> toJson() => {
    "countryId": countryId,
    "countyName": countyName,
    "code": code,
  };
}

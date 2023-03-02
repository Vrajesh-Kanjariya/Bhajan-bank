import 'dart:convert';

CityResponse cityResponseFromJson(String str) => CityResponse.fromJson(json.decode(str));

String cityResponseToJson(CityResponse data) => json.encode(data.toJson());

class CityResponse {
  CityResponse({
    required this.status,
    required this.msg,
    required this.info,
  });

  int status;
  String msg;
  List<CityInfoResponse> info;

  factory CityResponse.fromJson(Map<String, dynamic> json) => CityResponse(
    status: json["status"],
    msg: json["msg"],
    info: List<CityInfoResponse>.from(json["info"].map((x) => CityInfoResponse.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "msg": msg,
    "info": List<dynamic>.from(info.map((x) => x.toJson())),
  };
}

class CityInfoResponse {
  CityInfoResponse({
    required this.cityId,
    required this.cityName,
  });

  int cityId;
  String cityName;

  factory CityInfoResponse.fromJson(Map<String, dynamic> json) => CityInfoResponse(
    cityId: json["cityId"],
    cityName: json["cityName"],
  );

  Map<String, dynamic> toJson() => {
    "cityId": cityId,
    "cityName": cityName,
  };
}

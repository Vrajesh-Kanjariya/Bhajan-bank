import 'dart:convert';

SplashResponse splashResponseFromJson(String str) => SplashResponse.fromJson(json.decode(str));

String splashResponseToJson(SplashResponse data) => json.encode(data.toJson());

class SplashResponse {
  SplashResponse({
    this.status,
    this.msg,
    this.info,
  });

  int? status;
  String? msg;
  SplashInfo? info;

  factory SplashResponse.fromJson(Map<String, dynamic> json) => SplashResponse(
    status: json["status"],
    msg: json["msg"],
    info: SplashInfo.fromJson(json["info"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "msg": msg,
    "info": info!.toJson(),
  };
}

class SplashInfo {
  SplashInfo({
    this.id,
    this.title,
    this.image,
  });

  int? id;
  String? title;
  String? image;

  factory SplashInfo.fromJson(Map<String, dynamic> json) => SplashInfo(
    id: json["id"],
    title: json["title"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "image": image,
  };
}

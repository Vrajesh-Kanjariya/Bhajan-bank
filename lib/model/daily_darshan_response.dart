import 'dart:convert';

DailyDarshanResponse dailyDarshanResponseFromJson(String str) => DailyDarshanResponse.fromJson(json.decode(str));

String dailyDarshanResponseToJson(DailyDarshanResponse data) => json.encode(data.toJson());

class DailyDarshanResponse {
  DailyDarshanResponse({
    required this.status,
    required this.msg,
    required this.info,
  });

  int status;
  String msg;
  DailyDarshanInfoList info;

  factory DailyDarshanResponse.fromJson(Map<String, dynamic> json) => DailyDarshanResponse(
    status: json["status"],
    msg: json["msg"],
    info: DailyDarshanInfoList.fromJson(json["info"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "msg": msg,
    "info": info.toJson(),
  };
}

class DailyDarshanInfoList {
  DailyDarshanInfoList({
    required this.dailyDarshanId,
    required this.title,
    required this.image,
    required this.description,
  });

  int dailyDarshanId;
  String title;
  List<DarshanImage> image;
  String description;

  factory DailyDarshanInfoList.fromJson(Map<String, dynamic> json) => DailyDarshanInfoList(
    dailyDarshanId: json["dailyDarshanId"],
    title: json["title"],
    image: List<DarshanImage>.from(json["image"].map((x) => DarshanImage.fromJson(x))),
    description: json["description"],
  );

  Map<String, dynamic> toJson() => {
    "dailyDarshanId": dailyDarshanId,
    "title": title,
    "image": List<dynamic>.from(image.map((x) => x.toJson())),
    "description": description,
  };
}

class DarshanImage {
  DarshanImage({
    required this.image,
  });

  String image;

  factory DarshanImage.fromJson(Map<String, dynamic> json) => DarshanImage(
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "image": image,
  };
}

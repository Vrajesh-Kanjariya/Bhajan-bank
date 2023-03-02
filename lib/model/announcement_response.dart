import 'dart:convert';

AnnouncementResponse announcementFromJson(String str) =>
    AnnouncementResponse.fromJson(json.decode(str));

String announcementToJson(AnnouncementResponse data) => json.encode(data.toJson());

class AnnouncementResponse {
  AnnouncementResponse({
    required this.status,
    required this.msg,
    required this.info,
  });

  int status;
  String msg;
  List<AnnouncementInfoList> info;

  factory AnnouncementResponse.fromJson(Map<String, dynamic> json) => AnnouncementResponse(
        status: json["status"],
        msg: json["msg"],
        info: List<AnnouncementInfoList>.from(
            json["info"].map((x) => AnnouncementInfoList.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "msg": msg,
        "info": List<dynamic>.from(info.map((x) => x.toJson())),
      };
}

class AnnouncementInfoList {
  AnnouncementInfoList({
    required this.id,
    required this.image,
    required this.audio,
    required this.title,
    required this.shortDescription,
    required this.description,
    required this.tagName,
  });

  int id;
  String image;
  String audio;
  String title;
  String shortDescription;
  String description;
  String tagName;

  factory AnnouncementInfoList.fromJson(Map<String, dynamic> json) => AnnouncementInfoList(
        id: json["id"],
        image: json["image"],
        audio: json["audio"],
        title: json["title"],
        shortDescription: json["shortDescription"],
        description: json["description"],
        tagName: json["tagName"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "image": image,
        "audio": audio,
        "title": title,
        "shortDescription": shortDescription,
        "description": description,
        "tagName": tagName,
      };
}

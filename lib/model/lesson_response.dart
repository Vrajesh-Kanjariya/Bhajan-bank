// To parse this JSON data, do
//
//     final lessonResponse = lessonResponseFromJson(jsonString);

import 'dart:convert';

LessonResponse lessonResponseFromJson(String str) => LessonResponse.fromJson(json.decode(str));

String lessonResponseToJson(LessonResponse data) => json.encode(data.toJson());

class LessonResponse {
  LessonResponse({
    required this.status,
    required this.msg,
     this.otherInfo,
    required this.info,
  });

  int status;
  String msg;
  OtherInfo? otherInfo;
  List<LessonInfoList> info;

  factory LessonResponse.fromJson(Map<String, dynamic> json) => LessonResponse(
    status: json["status"],
    msg: json["msg"],
    otherInfo:json["otherInfo"] != null ? OtherInfo.fromJson(json["otherInfo"]): null,
    info: List<LessonInfoList>.from(json["info"].map((x) => LessonInfoList.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "msg": msg,
    "otherInfo": otherInfo!.toJson(),
    "info": List<dynamic>.from(info.map((x) => x.toJson())),
  };
}

class OtherInfo {
  OtherInfo({
    this.image,
    this.meaning,
    this.mahima,
    this.history,
  });

  String? image;
  String? meaning;
  String? mahima;
  String? history;

  factory OtherInfo.fromJson(Map<String, dynamic> json) => OtherInfo(
    image: json["image"],
    meaning: json["meaning"],
    mahima: json["mahima"],
    history: json["history"],
  );

  Map<String, dynamic> toJson() => {
    "image": image,
    "meaning": meaning,
    "mahima": mahima,
    "history": history,
  };
}

class LessonInfoList {
  LessonInfoList({
    required this.lessonCatId,
    required this.subCatName,
    required this.lessonCatName,
    required this.niyamId,
    required this.lessonList,
  });

  int lessonCatId;
  String subCatName;
  String lessonCatName;
  dynamic niyamId;
  List<LessonList> lessonList;

  factory LessonInfoList.fromJson(Map<String, dynamic> json) => LessonInfoList(
    lessonCatId: json["lessonCatId"],
    subCatName: json["subCatName"],
    lessonCatName: json["lessonCatName"],
    niyamId: json["niyamId"],
    lessonList: List<LessonList>.from(json["lessonList"].map((x) => LessonList.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "lessonCatId": lessonCatId,
    "subCatName": subCatName,
    "lessonCatName": lessonCatName,
    "niyamId": niyamId,
    "lessonList": List<dynamic>.from(lessonList.map((x) => x.toJson())),
  };
}

class LessonList {
  LessonList({
    required this.lessonId,
    required this.catId,
    required this.subcatId,
    required this.petasubcatId,
    required this.lesssonName,
    this.lesssonShortDescription,
    required this.lesssonDescription,
    required this.image,
    required this.isReadStatus,
    required this.isOpenStatus,
    required this.isCurrentStatus,
  });

  int lessonId;
  int catId;
  int subcatId;
  int petasubcatId;
  String lesssonName;
  dynamic lesssonShortDescription;
  String lesssonDescription;
  String image;
  bool isReadStatus;
  bool isOpenStatus;
  bool isCurrentStatus;

  factory LessonList.fromJson(Map<String, dynamic> json) => LessonList(
    lessonId: json["lessonId"],
    catId: json["catId"],
    subcatId: json["subcatId"],
    petasubcatId: json["petasubcatId"],
    lesssonName: json["lesssonName"],
    lesssonShortDescription: json["lesssonShortDescription"],
    lesssonDescription: json["lesssonDescription"],
    image: json["image"],
    isReadStatus: json["isReadStatus"],
    isOpenStatus: json["isOpenStatus"],
    isCurrentStatus: json["isCurrentStatus"],
  );

  Map<String, dynamic> toJson() => {
    "lessonId": lessonId,
    "catId": catId,
    "subcatId": subcatId,
    "petasubcatId": petasubcatId,
    "lesssonName": lesssonName,
    "lesssonShortDescription": lesssonShortDescription,
    "lesssonDescription": lesssonDescription,
    "image": image,
    "isReadStatus": isReadStatus,
    "isOpenStatus": isOpenStatus,
    "isCurrentStatus": isCurrentStatus,
  };
}

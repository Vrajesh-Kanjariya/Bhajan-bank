// To parse this JSON data, do
//
//     final mukhaPathResponse = mukhaPathResponseFromJson(jsonString);

import 'dart:convert';

MukhaPathResponse mukhaPathResponseFromJson(String str) => MukhaPathResponse.fromJson(json.decode(str));

String mukhaPathResponseToJson(MukhaPathResponse data) => json.encode(data.toJson());

class MukhaPathResponse {
  MukhaPathResponse({
    required this.status,
    required this.msg,
    required this.info,
  });

  int status;
  String msg;
  List<MukhPathList> info;

  factory MukhaPathResponse.fromJson(Map<String, dynamic> json) => MukhaPathResponse(
    status: json["status"],
    msg: json["msg"],
    info: List<MukhPathList>.from(json["info"].map((x) => MukhPathList.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "msg": msg,
    "info": List<dynamic>.from(info.map((x) => x.toJson())),
  };
}

class MukhPathList {
  MukhPathList({
    this.niyamId,
    this.catId,
    this.subcatId,
    this.petasubcatId,
    this.catName,
    this.subCatName,
    this.memberId,
    this.registerId,
    this.myDailyTarget,
    this.totalTarget,
    this.isSelected,
    this.bkColor,
    this.textColor,
    this.readCategory,
    this.TotalTarget,
    this.mainImage,
    this.progressBar,
    this.book,
  });

  int? niyamId;
  int? catId;
  int? subcatId;
  int? petasubcatId;
  String? catName;
  String? subCatName;
  String? memberId;
  String? registerId;
  int? myDailyTarget;
  int? totalTarget;
  int? isSelected;
  String? bkColor;
  String? textColor;
  List<ReadCategory>? readCategory;
  int? TotalTarget;
  String? mainImage;
  String? progressBar;
  List<Book>? book;

  factory MukhPathList.fromJson(Map<String, dynamic> json) => MukhPathList(
    niyamId: json["niyamId"],
    catId: json["catId"],
    subcatId: json["subcatId"],
    petasubcatId: json["petasubcatId"],
    catName: json["catName"],
    subCatName: json["subCatName"],
    memberId: json["memberId"],
    registerId: json["registerId"],
    myDailyTarget: json["myDailyTarget"],
    totalTarget: json["TotalTarget"],
    isSelected: json["isSelected"],
    TotalTarget: json["TotalTarget"],
    mainImage: json["mainImage"],
    progressBar: json["progressBar"],
    bkColor: json["bk_color"],
    textColor: json["text_color"],
    readCategory: List<ReadCategory>.from(
        json["readCategory"].map((x) => ReadCategory.fromJson(x))),
    book: json["book"] == null
        ? []
        : List<Book>.from(json["book"].map((x) => Book.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "niyamId": niyamId,
    "catId": catId,
    "subcatId": subcatId,
    "petasubcatId": petasubcatId,
    "catName": catName,
    "subCatName": subCatName,
    "memberId": memberId,
    "registerId": registerId,
    "myDailyTarget": myDailyTarget,
    "TotalTarget": totalTarget,
    "isSelected": isSelected,
    "TotalTarget": TotalTarget,
    "mainImage": mainImage,
    "progressBar": progressBar,
    "bk_color": bkColor,
    "text_color": textColor,
    "readCategory":
    List<dynamic>.from(readCategory!.map((x) => x.toJson())),
    "book": List<dynamic>.from(book!.map((x) => x.toJson())),
  };
}

class Book {
  Book({
    this.book,
  });

  String? book;

  factory Book.fromJson(Map<String, dynamic> json) => Book(
    book: json["book"],
  );

  Map<String, dynamic> toJson() => {
    "book": book,
  };
}

class ReadCategory {
  ReadCategory({
    this.id,
    this.readType,
  });

  int? id;
  String? readType;

  factory ReadCategory.fromJson(Map<String, dynamic> json) => ReadCategory(
    id: json["id"],
    readType: json["readType"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "readType": readType,
  };
}

import 'dart:convert';

import 'package:bank/model/niyam_meaning_response.dart';
import 'package:flutter/material.dart';

SubCategoryDataResponse subCategoryDataResponseFromJson(String str) =>
    SubCategoryDataResponse.fromJson(json.decode(str));

String subCategoryResponseToJson(SubCategoryDataResponse data) => json.encode(data.toJson());

class SubCategoryDataResponse {
  SubCategoryDataResponse({
    required this.status,
    required this.msg,
    required this.info,
  });

  int status;
  String msg;
  List<SubCategoryDataInfo> info;

  factory SubCategoryDataResponse.fromJson(Map<String, dynamic> json) => SubCategoryDataResponse(
        status: json["status"],
        msg: json["msg"],
        info: List<SubCategoryDataInfo>.from(
            json["info"].map((x) => SubCategoryDataInfo.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "msg": msg,
        "info": List<dynamic>.from(info.map((x) => x.toJson())),
      };
}

class SubCategoryDataInfo {
  SubCategoryDataInfo({
    required this.catId,
    required this.catName,
    required this.type,
    required this.subcategoryList,
  });

  int catId;
  String catName;
  String type;
  List<SubcategoryList> subcategoryList;

  factory SubCategoryDataInfo.fromJson(Map<String, dynamic> json) => SubCategoryDataInfo(
        catId: json["catId"],
        catName: json["catName"],
        type: json['type'] ?? '',
        subcategoryList: json["subcategoryList"] != null ?List<SubcategoryList>.from(
            json["subcategoryList"].map((x) => SubcategoryList.fromJson(x))) : [],
      );

  Map<String, dynamic> toJson() => {
        "catId": catId,
        "catName": catName,
        "type": type,
        "subcategoryList": List<SubcategoryList>.from(subcategoryList.map((x) => x.toJson())),
      };
}

class SubcategoryList {
  SubcategoryList(
      {required this.catId,
      required this.subcatId,
      required this.catName,
      required this.subCatName,
      required this.mainImage,
      required this.backImage,
      required this.niyamMeaning,
      required this.countTotalDays,
      required this.targetInputTitle,
      required this.totalInputTitle,
      required this.dailyInputTitle,
      required this.niyamSelectShortDescription,
      required this.mainDescription,
      required this.note,
      required this.videoUrl,
      required this.targetDate,
      required this.totalTarget,
      required this.bkColor,
      required this.readCategory,
      required this.book,
      required this.noteBook,
      required this.noteApp,
      required this.isSelected,
      required this.description,
      required this.isYesNoStatus,
      this.dailyTargetController,
      this.isSelect = false});

  int catId;
  int subcatId;
  String catName;
  String subCatName;
  String mainImage;
  String backImage;
  dynamic niyamMeaning;
  int countTotalDays;
  String targetInputTitle;
  String totalInputTitle;
  String dailyInputTitle;
  String niyamSelectShortDescription;
  String mainDescription;
  String note;
  String videoUrl;
  String targetDate;
  int totalTarget;
  String bkColor;
  List<ReadCategory> readCategory;
  dynamic book;
  String noteBook;
  String noteApp;
  int? isSelected;
  String description;
  int? isYesNoStatus;
  TextEditingController? dailyTargetController;
  bool isSelect;

  factory SubcategoryList.fromJson(Map<String, dynamic> json) => SubcategoryList(
        catId: json["catId"] ?? 0,
        subcatId: json["subcatId"] ?? 0,
        catName: json["catName"] ?? '',
        subCatName: json["subCatName"] ?? '',
        mainImage: json["mainImage"] ?? '',
        backImage: json["backImage"] ?? '',
        niyamMeaning: json["niyamMeaning"].toString().isNotEmpty
            ? NiyamMeaningResponse.fromJson(json["niyamMeaning"])
            : {},
        countTotalDays: json["countTotalDays"] ?? 0,
        targetInputTitle: json["targetInputTitle"] ?? '',
        totalInputTitle: json["totalInputTitle"] ?? '',
        dailyInputTitle: json["dailyInputTitle"] ?? '',
        niyamSelectShortDescription: json["niyamSelectShortDescription"] ?? '',
        mainDescription: json["mainDescription"] ?? '',
        note: json["note"] ?? '',
        videoUrl: json["videoUrl"] ?? '',
        targetDate: json["targetDate"] ?? '',
        totalTarget: json["totalTarget"] ?? 0,
        bkColor: json["bk_color"] ?? '',
        readCategory: json["readCategory"] == null
            ? []
            : List<ReadCategory>.from(json["readCategory"]!.map((x) => ReadCategory.fromJson(x))),
        book: json["book"] == null
            ? []
            : List<BookElement>.from(json["book"]!.map((x) => BookElement.fromJson(x))),
        noteBook: json["noteBook"] ?? '',
        noteApp: json["noteApp"] ?? '',
        isSelected: json["isSelected"] ?? 0,
        description: json["description"] ?? '',
        isYesNoStatus: json["isYesNoStatus"] ?? 0,
        dailyTargetController: TextEditingController(text: ''),
      );

  Map<String, dynamic> toJson() => {
        "catId": catId,
        "subcatId": subcatId,
        "catName": catName,
        "subCatName": subCatName,
        "mainImage": mainImage,
        "backImage": backImage,
        "niyamMeaning": niyamMeaning.toJson(),
        "countTotalDays": countTotalDays,
        "targetInputTitle": targetInputTitle,
        "totalInputTitle": totalInputTitle,
        "dailyInputTitle": dailyInputTitle,
        "niyamSelectShortDescription": niyamSelectShortDescription,
        "mainDescription": mainDescription,
        "note": note,
        "videoUrl": videoUrl,
        "targetDate": targetDate,
        "totalTarget": totalTarget,
        "bk_color": bkColor,
        "readCategory":
            readCategory == null ? [] : List<dynamic>.from(readCategory.map((x) => x.toJson())),
        "book": book,
        "noteBook": noteBook,
        "noteApp": noteApp,
        "isSelected": isSelected,
        "description": description,
        "isYesNoStatus": isYesNoStatus,
      };
}

class BookElement {
  BookElement({
    required this.book,
  });

  dynamic book;

  factory BookElement.fromJson(Map<String, dynamic> json) => BookElement(
    book: json["book"],
  );

  Map<String, dynamic> toJson() => {
    "book": book,
  };
}

class ReadCategory {
  ReadCategory({
    this.id,
    required this.readType,
    this.readCategoryId,
  });

  int? id;
  String readType;
  int? readCategoryId;

  factory ReadCategory.fromJson(Map<String, dynamic> json) => ReadCategory(
        id: json["id"],
        readType: json["readType"],
        readCategoryId: json["id "],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "readType": readType,
        "id ": readCategoryId,
      };
}

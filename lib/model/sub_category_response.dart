import 'dart:convert';

import 'package:flutter/material.dart';

import '../../model/niyam_meaning_response.dart';

SubCategoryResponse subCategoryResponseFromJson(String str) =>
    SubCategoryResponse.fromJson(json.decode(str));

String subCategoryResponseToJson(SubCategoryResponse data) => json.encode(data.toJson());

class SubCategoryResponse {
  SubCategoryResponse({
    required this.status,
    required this.msg,
    required this.info,
  });

  int status;
  String msg;
  List<SubCategoryInfoResponse> info;

  factory SubCategoryResponse.fromJson(Map<String, dynamic> json) => SubCategoryResponse(
        status: json["status"],
        msg: json["msg"],
        info: List<SubCategoryInfoResponse>.from(
            json["info"].map((x) => SubCategoryInfoResponse.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "msg": msg,
        "info": List<dynamic>.from(info.map((x) => x.toJson())),
      };
}

class SubCategoryInfoResponse {
  SubCategoryInfoResponse(
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
      required this.noteApp,
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
  String noteApp;
  TextEditingController? dailyTargetController;
  bool isSelect;

  factory SubCategoryInfoResponse.fromJson(Map<String, dynamic> json) => SubCategoryInfoResponse(
      catId: json["catId"],
      subcatId: json["subcatId"],
      catName: json["catName"],
      subCatName: json["subCatName"],
      mainImage: json["mainImage"],
      backImage: json["backImage"],
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
      noteApp: json["noteApp"] ?? '',
      dailyTargetController: TextEditingController(text: ''));

  Map<String, dynamic> toJson() => {
        "catId": catId,
        "subcatId": subcatId,
        "catName": catName,
        "subCatName": subCatName,
        "mainImage": mainImage,
        "backImage": backImage,
        "niyamMeaning": niyamMeaning,
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
        "noteApp": noteApp,
        "bk_color": bkColor,
      };
}

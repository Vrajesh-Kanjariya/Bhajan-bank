import 'dart:convert';

import '../../model/niyam_meaning_response.dart';

SelectNiyamResponse selectNiyamResponseFromJson(String str) =>
    SelectNiyamResponse.fromJson(json.decode(str));

String selectNiyamResponseToJson(SelectNiyamResponse data) => json.encode(data.toJson());

class SelectNiyamModel {
  List<SelectNiyamInfoResponse>? niyamList;

  SelectNiyamModel({this.niyamList});
}

class SelectNiyamResponse {
  SelectNiyamResponse({
    required this.status,
    required this.msg,
    required this.info,
  });

  int status;
  String msg;
  List<SelectNiyamInfoResponse> info;

  factory SelectNiyamResponse.fromJson(Map<String, dynamic> json) => SelectNiyamResponse(
        status: json["status"],
        msg: json["msg"],
        info: List<SelectNiyamInfoResponse>.from(
            json["info"].map((x) => SelectNiyamInfoResponse.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "msg": msg,
        "info": List<dynamic>.from(info.map((x) => x.toJson())),
      };
}

class SelectNiyamInfoResponse {
  SelectNiyamInfoResponse({
    required this.memberId,
    required this.registerId,
    required this.niyamId,
    required this.catId,
    required this.subcatId,
    required this.catName,
    required this.subCatName,
    required this.mainImage,
    required this.backImage,
    required this.niyamSelectShortDescription,
    required this.isArchiverStatus,
    required this.countTotalDays,
    required this.targetInputTitle,
    required this.totalInputTitle,
    required this.dailyInputTitle,
    required this.mainDescription,
    required this.note,
    required this.videoUrl,
    required this.targetDate,
    required this.totalTarget,
    required this.isYesNoStatus,
    required this.isSelected,
    required this.bkColor,
    required this.dailyTarget,
    required this.niyamMeaning,
    required this.mobileImage,
  });

  String memberId;
  String registerId;
  int niyamId;
  int catId;
  int subcatId;
  String catName;
  String subCatName;
  String mainImage;
  String backImage;
  String niyamSelectShortDescription;
  bool isArchiverStatus;
  int countTotalDays;
  String targetInputTitle;
  String totalInputTitle;
  String dailyInputTitle;
  String mainDescription;
  String note;
  String videoUrl;
  String targetDate;
  int totalTarget;
  int isYesNoStatus;
  int isSelected;
  String bkColor;
  int dailyTarget;
  dynamic niyamMeaning;
  String mobileImage;

  factory SelectNiyamInfoResponse.fromJson(Map<String, dynamic> json) => SelectNiyamInfoResponse(
        memberId: json["memberId"],
        registerId: json["registerId"],
        niyamId: json["niyamId"],
        catId: json["catId"],
        subcatId: json["subcatId"],
        catName: json["catName"],
        subCatName: json["subCatName"],
        mainImage: json["mainImage"],
        backImage: json["backImage"],
        niyamSelectShortDescription: json["niyamSelectShortDescription"],
        isArchiverStatus: json["isArchiverStatus"],
        countTotalDays: json["countTotalDays"],
        targetInputTitle: json["targetInputTitle"] ?? '',
        totalInputTitle: json["totalInputTitle"] ?? '',
        dailyInputTitle: json["dailyInputTitle"] ?? '',
        mainDescription: json["mainDescription"] ?? '',
        note: json["note"] ?? '',
        videoUrl: json["videoUrl"] ?? '',
        targetDate: json["targetDate"] ?? '',
        totalTarget: json["totalTarget"] ?? 0,
        isYesNoStatus: json["isYesNoStatus"] ?? 0,
        isSelected: json["isSelected"] ?? 0,
        bkColor: json["bk_color"],
        dailyTarget: json["daily_target"] ?? 0,
        niyamMeaning: json["niyamMeaning"].toString().isNotEmpty
            ? NiyamMeaningResponse.fromJson(json["niyamMeaning"])
            : {},
        mobileImage: json["mobileImage"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "memberId": memberId,
        "registerId": registerId,
        "niyamId": niyamId,
        "catId": catId,
        "subcatId": subcatId,
        "catName": catName,
        "subCatName": subCatName,
        "mainImage": mainImage,
        "backImage": backImage,
        "niyamSelectShortDescription": niyamSelectShortDescription,
        "isArchiverStatus": isArchiverStatus,
        "countTotalDays": countTotalDays,
        "targetInputTitle": targetInputTitle,
        "totalInputTitle": totalInputTitle,
        "dailyInputTitle": dailyInputTitle,
        "mainDescription": mainDescription,
        "note": note,
        "videoUrl": videoUrl,
        "targetDate": targetDate,
        "totalTarget": totalTarget,
        "isYesNoStatus": isYesNoStatus,
        "isSelected": isSelected,
        "bk_color": bkColor,
        "daily_target": dailyTarget,
        "niyamMeaning": niyamMeaning,
        "mobileImage": mobileImage,
      };
}

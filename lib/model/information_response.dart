import 'dart:convert';

InformationResponse informationResponseFromJson(String str) =>
    InformationResponse.fromJson(json.decode(str));

String informationResponseToJson(InformationResponse data) => json.encode(data.toJson());

class InformationResponse {
  InformationResponse({
    required this.status,
    required this.msg,
    required this.info,
  });

  int status;
  String msg;
  InformationInfoList info;

  factory InformationResponse.fromJson(Map<String, dynamic> json) => InformationResponse(
        status: json["status"],
        msg: json["msg"],
        info: InformationInfoList.fromJson(json["info"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "msg": msg,
        "info": info.toJson(),
      };
}

class InformationInfoList {
  InformationInfoList({
    required this.niyamId,
    required this.catId,
    required this.subcatId,
    required this.petasubcatId,
    required this.catName,
    required this.subCatName,
    required this.memberId,
    required this.registerId,
    required this.mainImage,
    required this.backImage,
    required this.niyamMeaning,
    required this.note,
    required this.videoUrl,
    required this.targetDate,
    required this.myDailyTarget,
    required this.myDailyTotalTarget,
    required this.myAnnualRemainingTarget,
    required this.myAnnualTotalTarget,
    required this.overallTarget,
    required this.overallTotalTarget,
    required this.targetInputTitle,
    required this.totalInputTitle,
    required this.dailyInputTitle,
    required this.niyamSelectShortDescription,
    required this.dailyUpadteTitle,
    required this.mainDescription,
    required this.totalTarget,
    required this.isButtonStatus,
    required this.isTypeStatus,
    this.buttonImage,
    this.noteApp,
    this.readCategory,
    this.buttonAfterNote,
    this.myAnnualTarget,
    this.target,
    this.totalTarget1,
    this.description
  });

  int niyamId;
  int catId;
  int subcatId;
  int petasubcatId;
  String catName;
  String subCatName;
  String memberId;
  String registerId;
  String mainImage;
  String backImage;
  dynamic niyamMeaning;
  String note;
  String? videoUrl;
  String targetDate;
  dynamic myDailyTarget;
  int? myDailyTotalTarget;
  int? myAnnualRemainingTarget;
  int? myAnnualTotalTarget;
  String? overallTarget;
  int? overallTotalTarget;
  String? targetInputTitle;
  String? totalInputTitle;
  String? dailyInputTitle;
  String? niyamSelectShortDescription;
  String? dailyUpadteTitle;
  String? mainDescription;
  int? totalTarget;
  int? isButtonStatus;
  int? isTypeStatus;
  dynamic buttonImage;
  String? noteApp;
  List<ReadCategory>? readCategory;
  String? buttonAfterNote;
  int? myAnnualTarget;
  int? target;
  int? totalTarget1;
  String? description;

  factory InformationInfoList.fromJson(Map<String, dynamic> json) => InformationInfoList(
        niyamId: json["niyamId"],
        catId: json["catId"],
        subcatId: json["subcatId"],
        petasubcatId: json["petasubcatId"],
        catName: json["catName"],
        subCatName: json["subCatName"],
        memberId: json["memberId"],
        registerId: json["registerId"],
        mainImage: json["mainImage"],
        backImage: json["backImage"],
        niyamMeaning: json["niyamMeaning"],
        note: json["note"],
        videoUrl: json["videoUrl"],
        targetDate: json["targetDate"],
        myDailyTarget: json["myDailyTarget"],
        myDailyTotalTarget: json["myDailyTotalTarget"],
        myAnnualRemainingTarget: json["myAnnualRemainingTarget"],
        myAnnualTotalTarget: json["myAnnualTotalTarget"],
        overallTarget: json["overallTarget"],
        overallTotalTarget: json["overallTotalTarget"],
        targetInputTitle: json["targetInputTitle"],
        totalInputTitle: json["totalInputTitle"],
        dailyInputTitle: json["dailyInputTitle"],
        niyamSelectShortDescription: json["niyamSelectShortDescription"],
        dailyUpadteTitle: json["dailyUpadteTitle"],
        mainDescription: json["mainDescription"],
        totalTarget: json["totalTarget"],
        isButtonStatus: json["isButtonStatus"],
        isTypeStatus: json["isTypeStatus"],
        buttonImage: json["buttonImage"],
    noteApp: json["noteApp"],
    readCategory: json["readCategory"] == null
        ? []
        : List<ReadCategory>.from(
        json["readCategory"].map((x) => ReadCategory.fromJson(x))),
      buttonAfterNote:json["buttonAfterNote"],
      myAnnualTarget:json["myAnnualTarget"],
    target:json["Target"],
    totalTarget1:json["TotalTarget"],
      description:json["description"]
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
        "mainImage": mainImage,
        "backImage": backImage,
        "niyamMeaning": niyamMeaning.toJson(),
        "note": note,
        "videoUrl": videoUrl,
        "targetDate": targetDate,
        "myDailyTarget": myDailyTarget,
        "myDailyTotalTarget": myDailyTotalTarget,
        "myAnnualRemainingTarget": myAnnualRemainingTarget,
        "myAnnualTotalTarget": myAnnualTotalTarget,
        "overallTarget": overallTarget,
        "overallTotalTarget": overallTotalTarget,
        "targetInputTitle": targetInputTitle,
        "totalInputTitle": totalInputTitle,
        "dailyInputTitle": dailyInputTitle,
        "niyamSelectShortDescription": niyamSelectShortDescription,
        "dailyUpadteTitle": dailyUpadteTitle,
        "mainDescription": mainDescription,
        "totalTarget": totalTarget,
        "isButtonStatus": isButtonStatus,
        "isTypeStatus": isTypeStatus,
        "buttonImage": buttonImage,
    "noteApp": noteApp,
    "readCategory":
    List<dynamic>.from(readCategory!.map((x) => x.toJson())),
    "buttonAfterNote":buttonAfterNote,
    "myAnnualTarget":myAnnualTarget,
    "Target":target,
    "TotalTarget":totalTarget1,
    "description":description
      };
}

class NiyamMeaning {
  NiyamMeaning({
    required this.meaning,
    required this.mahima,
    required this.history,
  });

  String meaning;
  String mahima;
  String history;

  factory NiyamMeaning.fromJson(Map<String, dynamic> json) => NiyamMeaning(
        meaning: json["meaning"],
        mahima: json["mahima"],
        history: json["history"],
      );

  Map<String, dynamic> toJson() => {
        "meaning": meaning,
        "mahima": mahima,
        "history": history,
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
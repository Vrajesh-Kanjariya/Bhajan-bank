import 'dart:convert';

SaveNiyamHistoryRequest saveNiyamHistoryRequestFromJson(String str) =>
    SaveNiyamHistoryRequest.fromJson(json.decode(str));

String saveNiyamHistoryRequestToJson(SaveNiyamHistoryRequest data) => json.encode(data.toJson());

class SaveNiyamHistoryRequest {
  SaveNiyamHistoryRequest({
    this.niyamId,
    this.catId,
    this.memberId,
    this.registerId,
    this.targetInfo,
  });

  String? niyamId;
  String? catId;
  String? memberId;
  String? registerId;
  List<TargetInfoRequest>? targetInfo;

  factory SaveNiyamHistoryRequest.fromJson(Map<String, dynamic> json) => SaveNiyamHistoryRequest(
        niyamId: json["niyamId"],
        catId: json["catId"],
        memberId: json["memberId"],
        registerId: json["registerId"],
        targetInfo: List<TargetInfoRequest>.from(
            json["targetInfo"].map((x) => TargetInfoRequest.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "niyamId": niyamId,
        "catId": catId,
        "memberId": memberId,
        "registerId": registerId,
        "targetInfo": List<dynamic>.from(targetInfo!.map((x) => x.toJson())),
      };
}

class TargetInfoRequest {
  TargetInfoRequest({
    this.subcatId,
    this.petasubcatId,
    this.dailyTarget,
    this.totalTarget,
    this.niyamId,
  });

  String? subcatId;
  String? petasubcatId;
  String? dailyTarget;
  String? totalTarget;
  String? niyamId;

  factory TargetInfoRequest.fromJson(Map<String, dynamic> json) => TargetInfoRequest(
        subcatId: json["subcatId"],
        petasubcatId: json["petasubcatId"],
        dailyTarget: json["dailyTarget"],
        totalTarget: json["totalTarget"],
        niyamId: json["niyamId"],
      );

  Map<String, dynamic> toJson() => {
        "subcatId": subcatId,
        "petasubcatId": petasubcatId,
        "dailyTarget": dailyTarget,
        "totalTarget": totalTarget,
        "niyamId": niyamId,
      };
}

import 'dart:convert';

UserChartReport userChartReportFromJson(String str) => UserChartReport.fromJson(json.decode(str));

String userChartReportToJson(UserChartReport data) => json.encode(data.toJson());

class UserChartReport {
  UserChartReport({
    required this.status,
    required this.msg,
    required this.info,
  });

  int status;
  String msg;
  List<Info> info;

  factory UserChartReport.fromJson(Map<String, dynamic> json) => UserChartReport(
    status: json["status"],
    msg: json["msg"],
    info: List<Info>.from(json["info"].map((x) => Info.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "msg": msg,
    "info": List<dynamic>.from(info.map((x) => x.toJson())),
  };
}

class Info {
  Info({
    this.memberId,
    this.registerId,
    this.date,
    this.achievementBar,
    this.targetBar,
    this.overallTarget,
    this.overallTotalTarget,
  });

  String? memberId;
  String? registerId;
  dynamic date;
  int? achievementBar;
  int? targetBar;
  String? overallTarget;
  int? overallTotalTarget;

  factory Info.fromJson(Map<String, dynamic> json) =>
      Info(
        memberId: json["memberId"],
        registerId: json["registerId"],
        date: json["date"],
        achievementBar: json["AchievementBar"],
        targetBar: json["TargetBar"],
        overallTarget: json["overallTarget"],
        overallTotalTarget: json["overallTotalTarget"],
      );

  Map<String, dynamic> toJson() => {
    "memberId": memberId,
    "registerId": registerId,
    "date": date,
    "AchievementBar": achievementBar,
    "TargetBar": targetBar,
    "overallTarget": overallTarget,
    "overallTotalTarget": overallTotalTarget,
  };
}

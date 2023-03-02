import 'dart:convert';

ServerResponse serverResponseFromJson(String str) => ServerResponse.fromJson(json.decode(str));

String serverResponseToJson(ServerResponse data) => json.encode(data.toJson());

class ServerResponse {
  ServerResponse({
    required this.msg,
    required this.status,
    required this.info,
  });

  String msg;
  int status;
  ServerResponseInfo info;

  factory ServerResponse.fromJson(Map<String, dynamic> json) => ServerResponse(
    msg: json["msg"],
    status: json["status"],
    info: ServerResponseInfo.fromJson(json["info"]),
  );

  Map<String, dynamic> toJson() => {
    "msg": msg,
    "status": status,
    "info": info.toJson(),
  };
}

class ServerResponseInfo {
  ServerResponseInfo({
    required this.dailyNiyamId,
  });

  int? dailyNiyamId;

  factory ServerResponseInfo.fromJson(Map<String, dynamic> json) => ServerResponseInfo(
    dailyNiyamId: json["dailyNiyamId"],
  );

  Map<String, dynamic> toJson() => {
    "dailyNiyamId": dailyNiyamId,
  };
}

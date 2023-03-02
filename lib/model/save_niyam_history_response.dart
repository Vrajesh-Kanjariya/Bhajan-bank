import 'dart:convert';

SaveNiyamHistoryResponse saveNiyamHistoryResponseFromJson(String str) => SaveNiyamHistoryResponse.fromJson(json.decode(str));

String saveNiyamHistoryResponseToJson(SaveNiyamHistoryResponse data) => json.encode(data.toJson());

class SaveNiyamHistoryResponse {
  SaveNiyamHistoryResponse({
    required this.msg,
    required this.status,
    required this.info,
  });

  String msg;
  int status;
  dynamic info;

  factory SaveNiyamHistoryResponse.fromJson(Map<String, dynamic> json) => SaveNiyamHistoryResponse(
    msg: json["msg"],
    status: json["status"],
    info: json["info"],
  );

  Map<String, dynamic> toJson() => {
    "msg": msg,
    "status": status,
    "info": info,
  };
}

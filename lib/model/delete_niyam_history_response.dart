import 'dart:convert';

DeleteNiyamHistoryResponse deleteNiyamHistoryResponseFromJson(String str) => DeleteNiyamHistoryResponse.fromJson(json.decode(str));

String deleteNiyamHistoryResponseToJson(DeleteNiyamHistoryResponse data) => json.encode(data.toJson());

class DeleteNiyamHistoryResponse {
  DeleteNiyamHistoryResponse({
    required this.msg,
    required this.status,
  });

  String msg;
  int status;

  factory DeleteNiyamHistoryResponse.fromJson(Map<String, dynamic> json) => DeleteNiyamHistoryResponse(
    msg: json["msg"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "msg": msg,
    "status": status,
  };
}

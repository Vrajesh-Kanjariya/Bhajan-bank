import 'dart:convert';

DeleteMemberResponse deleteMemberResponseFromJson(String str) => DeleteMemberResponse.fromJson(json.decode(str));

String deleteMemberResponseToJson(DeleteMemberResponse data) => json.encode(data.toJson());

class DeleteMemberResponse {
  DeleteMemberResponse({
    required this.msg,
    required this.status,
  });

  String msg;
  int status;

  factory DeleteMemberResponse.fromJson(Map<String, dynamic> json) => DeleteMemberResponse(
    msg: json["msg"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "msg": msg,
    "status": status,
  };
}

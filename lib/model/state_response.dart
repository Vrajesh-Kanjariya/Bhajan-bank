import 'dart:convert';

StateResponse stateResponseFromJson(String str) => StateResponse.fromJson(json.decode(str));

String stateResponseToJson(StateResponse data) => json.encode(data.toJson());

class StateResponse {
  StateResponse({
    required this.status,
    required this.msg,
    required this.info,
  });

  int status;
  String msg;
  List<StateInfoResponse> info;

  factory StateResponse.fromJson(Map<String, dynamic> json) => StateResponse(
    status: json["status"],
    msg: json["msg"],
    info: List<StateInfoResponse>.from(json["info"].map((x) => StateInfoResponse.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "msg": msg,
    "info": List<dynamic>.from(info.map((x) => x.toJson())),
  };
}

class StateInfoResponse {
  StateInfoResponse({
    required this.stateId,
    required this.stateName,
  });

  int stateId;
  String stateName;

  factory StateInfoResponse.fromJson(Map<String, dynamic> json) => StateInfoResponse(
    stateId: json["stateId"],
    stateName: json["stateName"],
  );

  Map<String, dynamic> toJson() => {
    "stateId": stateId,
    "stateName": stateName,
  };
}

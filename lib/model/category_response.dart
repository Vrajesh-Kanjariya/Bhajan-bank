import 'dart:convert';

CategoryResponse categoryResponseFromJson(String str) => CategoryResponse.fromJson(json.decode(str));

String categoryResponseToJson(CategoryResponse data) => json.encode(data.toJson());

class CategoryResponse {
  CategoryResponse({
    required this.status,
    required this.msg,
    required this.info,
  });

  int status;
  String msg;
  List<CategoryInfoResponse> info;

  factory CategoryResponse.fromJson(Map<String, dynamic> json) => CategoryResponse(
    status: json["status"],
    msg: json["msg"],
    info: List<CategoryInfoResponse>.from(json["info"].map((x) => CategoryInfoResponse.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "msg": msg,
    "info": List<dynamic>.from(info.map((x) => x.toJson())),
  };
}

class CategoryInfoResponse {
  CategoryInfoResponse({
    required this.id,
    required this.catName,
  });

  int id;
  String catName;

  factory CategoryInfoResponse.fromJson(Map<String, dynamic> json) => CategoryInfoResponse(
    id: json["id"],
    catName: json["catName"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "catName": catName,
  };
}

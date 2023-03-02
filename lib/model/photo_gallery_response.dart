import 'dart:convert';

PhotoGalleryResponse photoGalleryResponseFromJson(String str) =>
    PhotoGalleryResponse.fromJson(json.decode(str));

String photoGalleryResponseToJson(PhotoGalleryResponse data) => json.encode(data.toJson());

class PhotoGalleryResponse {
  PhotoGalleryResponse({
    required this.status,
    required this.msg,
    required this.info,
  });

  int status;
  String msg;
  List<PhotoGalleryInfoList> info;

  factory PhotoGalleryResponse.fromJson(Map<String, dynamic> json) => PhotoGalleryResponse(
        status: json["status"],
        msg: json["msg"],
        info: List<PhotoGalleryInfoList>.from(json["info"].map((x) => PhotoGalleryInfoList.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "msg": msg,
        "info": List<dynamic>.from(info.map((x) => x.toJson())),
      };
}

class PhotoGalleryInfoList {
  PhotoGalleryInfoList({
    required this.gharMandirId,
    required this.catId,
    required this.subcatId,
    required this.memberId,
    required this.registerId,
    required this.fullName,
    required this.firstImage,
    required this.secondImage,
    required this.createdAt,
  });

  int gharMandirId;
  int catId;
  int subcatId;
  String memberId;
  String registerId;
  String fullName;
  String firstImage;
  String secondImage;
  String createdAt;

  factory PhotoGalleryInfoList.fromJson(Map<String, dynamic> json) => PhotoGalleryInfoList(
        gharMandirId: json["gharMandirId"],
        catId: json["catId"],
        subcatId: json["subcatId"],
        memberId: json["memberId"],
        registerId: json["registerId"],
        fullName: json["fullName"],
        firstImage: json["firstImage"],
        secondImage: json["secondImage"],
        createdAt: json["createdAt"],
      );

  Map<String, dynamic> toJson() => {
        "gharMandirId": gharMandirId,
        "catId": catId,
        "subcatId": subcatId,
        "memberId": memberId,
        "registerId": registerId,
        "fullName": fullName,
        "firstImage": firstImage,
        "secondImage": secondImage,
        "createdAt": createdAt,
      };
}



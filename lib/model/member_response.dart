import 'dart:convert';

MemberResponse memberResponseFromJson(String str) => MemberResponse.fromJson(json.decode(str));

String memberResponseToJson(MemberResponse data) => json.encode(data.toJson());

class MemberResponse {
  MemberResponse({
    required this.status,
    required this.msg,
    required this.info,
    required this.maxMember,
  });

  int status;
  String msg;
  List<MemberInfoResponse> info;
  int maxMember;


  factory MemberResponse.fromJson(Map<String, dynamic> json) => MemberResponse(
    status: json["status"],
    msg: json["msg"],
    info: List<MemberInfoResponse>.from(json["info"].map((x) => MemberInfoResponse.fromJson(x))),
    maxMember: json["max_member"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "msg": msg,
    "info": List<dynamic>.from(info.map((x) => x.toJson())),
    "max_member": maxMember,
  };
}

class MemberInfoResponse {
  MemberInfoResponse({
    required this.memberId,
    required this.registerId,
    required this.fullName,
    required this.firstName,
    required this.middleName,
    required this.lastName,
    required this.age,
    required this.gender,
    required this.emailId,
    required this.countryName,
    required this.countryCode,
    required this.countryId,
    required this.stateId,
    required this.cityId,
    required this.stateName,
    required this.cityName,
    required this.houseNo,
    required this.address,
    required this.mainArea,
    required this.pincode,
    required this.profileImage,
    required this.isUserSelectedStatus,
    required this.mobileNo,
  });

  String memberId;
  String registerId;
  String fullName;
  String firstName;
  String middleName;
  String lastName;
  String age;
  String gender;
  String emailId;
  String countryName;
  String countryCode;
  int countryId;
  int stateId;
  int cityId;
  String stateName;
  String cityName;
  String houseNo;
  String address;
  String mainArea;
  String pincode;
  String profileImage;
  bool isUserSelectedStatus;
  dynamic mobileNo;

  factory MemberInfoResponse.fromJson(Map<String, dynamic> json) => MemberInfoResponse(
    memberId: json["memberId"],
    registerId: json["registerId"],
    fullName: json["fullName"],
    firstName: json["firstName"],
    middleName: json["middleName"],
    lastName: json["lastName"],
    age: json["age"],
    gender: json["gender"],
    emailId: json["email_id"] ?? '',
    countryName: json["country_name"],
    countryCode: json["country_code"],
    countryId: json["country_id"],
    stateId: json["state_id"],
    cityId: json["city_id"],
    stateName: json["state_name"],
    cityName: json["city_name"],
    houseNo: json["house_no"],
    address: json["address"],
    mainArea: json["main_area"],
    pincode: json["pincode"],
    profileImage: json["profileImage"],
    isUserSelectedStatus: json["isUserSelectedStatus"],
    mobileNo: json["mobile_no"] ?? '',
  );

  Map<String, dynamic> toJson() => {
    "memberId": memberId,
    "registerId": registerId,
    "fullName": fullName,
    "firstName": firstName,
    "middleName": middleName,
    "lastName": lastName,
    "age": age,
    "gender": gender,
    "email_id": emailId,
    "country_name": countryName,
    "country_code": countryCode,
    "country_id": countryId,
    "state_id": stateId,
    "city_id": cityId,
    "state_name": stateName,
    "city_name": cityName,
    "house_no": houseNo,
    "address": address,
    "main_area": mainArea,
    "pincode": pincode,
    "profileImage": profileImage,
    "isUserSelectedStatus": isUserSelectedStatus,
  };
}

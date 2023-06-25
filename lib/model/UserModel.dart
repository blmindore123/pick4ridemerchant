// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  bool? success;
  Data? data;
  String? message;

  UserModel({
    this.success,
    this.data,
    this.message,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    success: json["success"],
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "data": data?.toJson(),
    "message": message,
  };
}

class Data {
  int? id;
  String? role;
  dynamic subadminType;
  String? firstName;
  dynamic lastName;
  String? email;
  String? countryCode;
  String? phoneNumber;
  dynamic image;
  String? status;
  String? profileStatus;
  int? mobileVerified;
  int? emailVerified;
  String? address;
  dynamic latitude;
  dynamic longitude;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? token;
  String? imageUrl;
  String? fullName;

  Data({
    this.id,
    this.role,
    this.subadminType,
    this.firstName,
    this.lastName,
    this.email,
    this.countryCode,
    this.phoneNumber,
    this.image,
    this.status,
    this.profileStatus,
    this.mobileVerified,
    this.emailVerified,
    this.address,
    this.latitude,
    this.longitude,
    this.createdAt,
    this.updatedAt,
    this.token,
    this.imageUrl,
    this.fullName,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    role: json["role"],
    subadminType: json["subadmin_type"],
    firstName: json["first_name"],
    lastName: json["last_name"],
    email: json["email"],
    countryCode: json["country_code"],
    phoneNumber: json["phone_number"],
    image: json["image"],
    status: json["status"],
    profileStatus: json["profile_status"],
    mobileVerified: json["mobile_verified"],
    emailVerified: json["email_verified"],
    address: json["address"],
    latitude: json["latitude"],
    longitude: json["longitude"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    token: json["token"],
    imageUrl: json["image_url"],
    fullName: json["full_name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "role": role,
    "subadmin_type": subadminType,
    "first_name": firstName,
    "last_name": lastName,
    "email": email,
    "country_code": countryCode,
    "phone_number": phoneNumber,
    "image": image,
    "status": status,
    "profile_status": profileStatus,
    "mobile_verified": mobileVerified,
    "email_verified": emailVerified,
    "address": address,
    "latitude": latitude,
    "longitude": longitude,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "token": token,
    "image_url": imageUrl,
    "full_name": fullName,
  };
}

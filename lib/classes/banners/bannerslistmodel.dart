// To parse this JSON data, do
//
//     final bannersListModel = bannersListModelFromJson(jsonString);

import 'dart:convert';

BannersListModel bannersListModelFromJson(String str) => BannersListModel.fromJson(json.decode(str));

String bannersListModelToJson(BannersListModel data) => json.encode(data.toJson());

class BannersListModel {
  bool? success;
  String? message;
  List<Datum>? data;

  BannersListModel({
    this.success,
    this.message,
    this.data,
  });

  factory BannersListModel.fromJson(Map<String, dynamic> json) => BannersListModel(
    success: json["success"],
    message: json["message"],
    data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class Datum {
  int? id;
  String? image;
  String? imageUrl;

  Datum({
    this.id,
    this.image,
    this.imageUrl,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    image: json["image"],
    imageUrl: json["image_url"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "image": image,
    "image_url": imageUrl,
  };
}

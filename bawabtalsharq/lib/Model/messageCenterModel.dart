// To parse this JSON data, do
//
//     final messageCenterModel = messageCenterModelFromJson(jsonString);

import 'dart:convert';

MessageCenterModel messageCenterModelFromJson(String str) =>
    MessageCenterModel.fromJson(json.decode(str));

String messageCenterModelToJson(MessageCenterModel data) =>
    json.encode(data.toJson());

class MessageCenterModel {
  MessageCenterModel({
    this.code,
    this.status,
    this.msg,
    this.data,
  });

  int code;
  String status;
  String msg;
  List<Datum> data;

  factory MessageCenterModel.fromJson(Map<String, dynamic> json) =>
      MessageCenterModel(
        code: json["code"],
        status: json["status"],
        msg: json["msg"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "status": status,
        "msg": msg,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    this.text,
    this.images,
  });

  String text;
  List<String> images;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        text: json["text"],
        images: List<String>.from(json["images"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "text": text,
        "images": List<dynamic>.from(images.map((x) => x)),
      };
}

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
  List<MessageCenterData> data;

  factory MessageCenterModel.fromJson(Map<String, dynamic> json) =>
      MessageCenterModel(
        code: json["code"],
        status: json["status"],
        msg: json["msg"],
        data: List<MessageCenterData>.from(
            json["data"].map((x) => MessageCenterData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "status": status,
        "msg": msg,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class MessageCenterData {
  MessageCenterData({
    this.text,
    this.images,
  });

  String text;
  List<String> images;

  factory MessageCenterData.fromJson(Map<String, dynamic> json) =>
      MessageCenterData(
        text: json["text"],
        images: List<String>.from(json["images"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "text": text,
        "images": List<dynamic>.from(images.map((x) => x)),
      };
}

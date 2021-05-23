// To parse this JSON data, do
//
//     final notificationsModel = notificationsModelFromJson(jsonString);

import 'dart:convert';

NotificationsModel notificationsModelFromJson(String str) =>
    NotificationsModel.fromJson(json.decode(str));

String notificationsModelToJson(NotificationsModel data) =>
    json.encode(data.toJson());

class NotificationsModel {
  NotificationsModel({
    this.code,
    this.status,
    this.msg,
    this.data,
  });

  int code;
  String status;
  String msg;
  List<Datum> data;

  factory NotificationsModel.fromJson(Map<String, dynamic> json) =>
      NotificationsModel(
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
    this.notificationId,
    this.userId,
    this.title,
    this.message,
    this.severity,
    this.section,
    this.tag,
    this.area,
    this.actionUrl,
    this.isRead,
    this.timestamp,
  });

  String notificationId;
  String userId;
  String title;
  String message;
  String severity;
  String section;
  String tag;
  String area;
  String actionUrl;
  String isRead;
  String timestamp;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        notificationId: json["notification_id"],
        userId: json["user_id"],
        title: json["title"],
        message: json["message"],
        severity: json["severity"],
        section: json["section"],
        tag: json["tag"],
        area: json["area"],
        actionUrl: json["action_url"],
        isRead: json["is_read"],
        timestamp: json["timestamp"],
      );

  Map<String, dynamic> toJson() => {
        "notification_id": notificationId,
        "user_id": userId,
        "title": title,
        "message": message,
        "severity": severity,
        "section": section,
        "tag": tag,
        "area": area,
        "action_url": actionUrl,
        "is_read": isRead,
        "timestamp": timestamp,
      };
}

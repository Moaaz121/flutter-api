import 'dart:convert';

PartnerData partnerDataFromJson(String str) =>
    PartnerData.fromJson(json.decode(str));

String partnerDataToJson(PartnerData data) => json.encode(data.toJson());

class PartnerData {
  PartnerData({
    this.user,
    this.success,
  });

  User user;
  bool success;

  factory PartnerData.fromJson(Map<String, dynamic> json) => PartnerData(
        user: User.fromJson(json["user"]),
        success: json["success"],
      );

  Map<String, dynamic> toJson() => {
        "user": user.toJson(),
        "success": success,
      };
}

class User {
  User({
    this.id,
    this.type,
    this.status,
    this.active,
    this.name,
    this.username,
    this.utcOffset,
  });

  String id;
  String type;
  String status;
  bool active;
  String name;
  String username;
  int utcOffset;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["_id"],
        type: json["type"],
        status: json["status"],
        active: json["active"],
        name: json["name"],
        username: json["username"],
        utcOffset: json["utcOffset"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "type": type,
        "status": status,
        "active": active,
        "name": name,
        "username": username,
        "utcOffset": utcOffset,
      };
}

import 'dart:convert';

ChatLoginModel chatLoginModelFromJson(String str) =>
    ChatLoginModel.fromJson(json.decode(str));

String chatLoginModelToJson(ChatLoginModel data) => json.encode(data.toJson());

class ChatLoginModel {
  ChatLoginModel({
    this.status,
    this.data,
  });

  String status;
  Data data;

  factory ChatLoginModel.fromJson(Map<String, dynamic> json) => ChatLoginModel(
        status: json["status"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": data.toJson(),
      };
}

class Data {
  Data({
    this.authToken,
    this.userId,
    this.me,
  });

  String authToken;
  String userId;
  Me me;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        authToken: json["authToken"],
        userId: json["userId"],
        me: Me.fromJson(json["me"]),
      );

  Map<String, dynamic> toJson() => {
        "authToken": authToken,
        "userId": userId,
        "me": me.toJson(),
      };
}

class Me {
  Me({
    this.id,
    this.name,
    this.emails,
    this.status,
    this.statusConnection,
    this.username,
    this.utcOffset,
    this.active,
    this.roles,
    this.settings,
    this.avatarUrl,
  });

  String id;
  String name;
  List<Email> emails;
  String status;
  String statusConnection;
  String username;
  int utcOffset;
  bool active;
  List<String> roles;
  Settings settings;
  String avatarUrl;

  factory Me.fromJson(Map<String, dynamic> json) => Me(
        id: json["_id"],
        name: json["name"],
        emails: List<Email>.from(json["emails"].map((x) => Email.fromJson(x))),
        status: json["status"],
        statusConnection: json["statusConnection"],
        username: json["username"],
        utcOffset: json["utcOffset"],
        active: json["active"],
        roles: List<String>.from(json["roles"].map((x) => x)),
        settings: Settings.fromJson(json["settings"]),
        avatarUrl: json["avatarUrl"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "emails": List<dynamic>.from(emails.map((x) => x.toJson())),
        "status": status,
        "statusConnection": statusConnection,
        "username": username,
        "utcOffset": utcOffset,
        "active": active,
        "roles": List<dynamic>.from(roles.map((x) => x)),
        "settings": settings.toJson(),
        "avatarUrl": avatarUrl,
      };
}

class Email {
  Email({
    this.address,
    this.verified,
  });

  String address;
  bool verified;

  factory Email.fromJson(Map<String, dynamic> json) => Email(
        address: json["address"],
        verified: json["verified"],
      );

  Map<String, dynamic> toJson() => {
        "address": address,
        "verified": verified,
      };
}

class Settings {
  Settings({
    this.preferences,
  });

  Preferences preferences;

  factory Settings.fromJson(Map<String, dynamic> json) => Settings(
        preferences: Preferences.fromJson(json["preferences"]),
      );

  Map<String, dynamic> toJson() => {
        "preferences": preferences.toJson(),
      };
}

class Preferences {
  Preferences();

  factory Preferences.fromJson(Map<String, dynamic> json) => Preferences();

  Map<String, dynamic> toJson() => {};
}

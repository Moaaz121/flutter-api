import 'dart:convert';

RoomModel roomModelFromJson(String str) => RoomModel.fromJson(json.decode(str));

String roomModelToJson(RoomModel data) => json.encode(data.toJson());

class RoomModel {
  RoomModel({
    this.ims,
    this.offset,
    this.count,
    this.total,
    this.success,
  });

  List<Im> ims;
  int offset;
  int count;
  int total;
  bool success;

  factory RoomModel.fromJson(Map<String, dynamic> json) => RoomModel(
        ims: List<Im>.from(json["ims"].map((x) => Im.fromJson(x))),
        offset: json["offset"],
        count: json["count"],
        total: json["total"],
        success: json["success"],
      );

  Map<String, dynamic> toJson() => {
        "ims": List<dynamic>.from(ims.map((x) => x.toJson())),
        "offset": offset,
        "count": count,
        "total": total,
        "success": success,
      };
}

class Im {
  Im({
    this.id,
    this.t,
    this.usernames,
    this.usersCount,
    this.msgs,
    this.ts,
    this.uids,
    this.imDefault,
    this.ro,
    this.sysMes,
    this.updatedAt,
    this.lastMessage,
    this.lm,
  });

  String id;
  String t;
  List<String> usernames;
  int usersCount;
  int msgs;
  String ts;
  List<String> uids;
  bool imDefault;
  bool ro;
  bool sysMes;
  DateTime updatedAt;
  LastMessage lastMessage;
  DateTime lm;

  factory Im.fromJson(Map<String, dynamic> json) => Im(
        id: json["_id"],
        t: json["t"],
        usernames: List<String>.from(json["usernames"].map((x) => x)),
        usersCount: json["usersCount"],
        msgs: json["msgs"],
        ts: json["ts"],
        uids: List<String>.from(json["uids"].map((x) => x)),
        imDefault: json["default"],
        ro: json["ro"],
        sysMes: json["sysMes"],
        updatedAt: DateTime.parse(json["_updatedAt"]),
        lastMessage: LastMessage.fromJson(json["lastMessage"]),
        lm: DateTime.parse(json["lm"]),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "t": t,
        "usernames": List<dynamic>.from(usernames.map((x) => x)),
        "usersCount": usersCount,
        "msgs": msgs,
        "ts": ts,
        "uids": List<dynamic>.from(uids.map((x) => x)),
        "default": imDefault,
        "ro": ro,
        "sysMes": sysMes,
        "_updatedAt": updatedAt.toIso8601String(),
        "lastMessage": lastMessage.toJson(),
        "lm": lm.toIso8601String(),
      };
}

class LastMessage {
  LastMessage({
    this.id,
    this.rid,
    this.msg,
    this.ts,
    this.u,
    this.updatedAt,
    this.mentions,
    this.channels,
  });

  String id;
  String rid;
  String msg;
  DateTime ts;
  U u;
  DateTime updatedAt;
  List<dynamic> mentions;
  List<dynamic> channels;

  factory LastMessage.fromJson(Map<String, dynamic> json) => LastMessage(
        id: json["_id"],
        rid: json["rid"],
        msg: json["msg"],
        ts: DateTime.parse(json["ts"]),
        u: U.fromJson(json["u"]),
        updatedAt: DateTime.parse(json["_updatedAt"]),
        mentions: List<dynamic>.from(json["mentions"].map((x) => x)),
        channels: List<dynamic>.from(json["channels"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "rid": rid,
        "msg": msg,
        "ts": ts.toIso8601String(),
        "u": u.toJson(),
        "_updatedAt": updatedAt.toIso8601String(),
        "mentions": List<dynamic>.from(mentions.map((x) => x)),
        "channels": List<dynamic>.from(channels.map((x) => x)),
      };
}

class U {
  U({
    this.id,
    this.username,
    this.name,
  });

  String id;
  String username;
  String name;

  factory U.fromJson(Map<String, dynamic> json) => U(
        id: json["_id"],
        username: json["username"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "username": username,
        "name": name,
      };
}

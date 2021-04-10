// To parse this JSON data, do
//
//     final socketMessage = socketMessageFromJson(jsonString);

import 'dart:convert';

SocketMessage socketMessageFromJson(String str) =>
    SocketMessage.fromJson(json.decode(str));

String socketMessageToJson(SocketMessage data) => json.encode(data.toJson());

class SocketMessage {
  SocketMessage({
    this.msg,
    this.collection,
    this.id,
    this.fields,
  });

  String msg;
  String collection;
  String id;
  Fields fields;

  factory SocketMessage.fromJson(Map<String, dynamic> json) => SocketMessage(
        msg: json["msg"] == null ? null : json["msg"],
        collection: json["collection"] == null ? null : json["collection"],
        id: json["id"] == null ? null : json["id"],
        fields: json["fields"] == null ? null : Fields.fromJson(json["fields"]),
      );

  Map<String, dynamic> toJson() => {
        "msg": msg == null ? null : msg,
        "collection": collection == null ? null : collection,
        "id": id == null ? null : id,
        "fields": fields == null ? null : fields.toJson(),
      };
}

class Fields {
  Fields({
    this.eventName,
    this.args,
  });

  String eventName;
  List<Arg> args;

  factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        eventName: json["eventName"] == null ? null : json["eventName"],
        args: json["args"] == null
            ? null
            : List<Arg>.from(json["args"].map((x) => Arg.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "eventName": eventName == null ? null : eventName,
        "args": args == null
            ? null
            : List<dynamic>.from(args.map((x) => x.toJson())),
      };
}

class Arg {
  Arg({
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
  UpdatedAt ts;
  U u;
  UpdatedAt updatedAt;
  List<dynamic> mentions;
  List<dynamic> channels;

  factory Arg.fromJson(Map<String, dynamic> json) => Arg(
        id: json["_id"] == null ? null : json["_id"],
        rid: json["rid"] == null ? null : json["rid"],
        msg: json["msg"] == null ? null : json["msg"],
        ts: json["ts"] == null ? null : UpdatedAt.fromJson(json["ts"]),
        u: json["u"] == null ? null : U.fromJson(json["u"]),
        updatedAt: json["_updatedAt"] == null
            ? null
            : UpdatedAt.fromJson(json["_updatedAt"]),
        mentions: json["mentions"] == null
            ? null
            : List<dynamic>.from(json["mentions"].map((x) => x)),
        channels: json["channels"] == null
            ? null
            : List<dynamic>.from(json["channels"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "_id": id == null ? null : id,
        "rid": rid == null ? null : rid,
        "msg": msg == null ? null : msg,
        "ts": ts == null ? null : ts.toJson(),
        "u": u == null ? null : u.toJson(),
        "_updatedAt": updatedAt == null ? null : updatedAt.toJson(),
        "mentions": mentions == null
            ? null
            : List<dynamic>.from(mentions.map((x) => x)),
        "channels": channels == null
            ? null
            : List<dynamic>.from(channels.map((x) => x)),
      };
}

class UpdatedAt {
  UpdatedAt({
    this.date,
  });

  int date;

  factory UpdatedAt.fromJson(Map<String, dynamic> json) => UpdatedAt(
        date: json["\u0024date"] == null ? null : json["\u0024date"],
      );

  Map<String, dynamic> toJson() => {
        "\u0024date": date == null ? null : date,
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
        id: json["_id"] == null ? null : json["_id"],
        username: json["username"] == null ? null : json["username"],
        name: json["name"] == null ? null : json["name"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id == null ? null : id,
        "username": username == null ? null : username,
        "name": name == null ? null : name,
      };
}

// To parse this JSON data, do
//
//     final homeModel = homeModelFromJson(jsonString);

import 'dart:convert';

import 'package:meta/meta.dart';

HomeModel homeModelFromJson(String str) => HomeModel.fromJson(json.decode(str));

String homeModelToJson(HomeModel data) => json.encode(data.toJson());

class HomeModel {
  HomeModel({
    @required this.code,
    @required this.status,
    @required this.msg,
    @required this.data,
  });

  int code;
  String status;
  String msg;
  Data data;

  factory HomeModel.fromJson(Map<String, dynamic> json) => HomeModel(
        code: json["code"] == null ? null : json["code"],
        status: json["status"] == null ? null : json["status"],
        msg: json["msg"] == null ? null : json["msg"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "code": code == null ? null : code,
        "status": status == null ? null : status,
        "msg": msg == null ? null : msg,
        "data": data == null ? null : data.toJson(),
      };
}

class Data {
  Data({
    @required this.slider,
    @required this.suppliers,
    @required this.categories,
  });

  List<String> slider;
  List<Supplier> suppliers;
  List<Category> categories;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        slider: json["slider"] == null
            ? null
            : List<String>.from(json["slider"].map((x) => x)),
        suppliers: json["suppliers"] == null
            ? null
            : List<Supplier>.from(
                json["suppliers"].map((x) => Supplier.fromJson(x))),
        categories: json["categories"] == null
            ? null
            : List<Category>.from(
                json["categories"].map((x) => Category.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "slider":
            slider == null ? null : List<dynamic>.from(slider.map((x) => x)),
        "suppliers": suppliers == null
            ? null
            : List<dynamic>.from(suppliers.map((x) => x.toJson())),
        "categories": categories == null
            ? null
            : List<dynamic>.from(categories.map((x) => x.toJson())),
      };
}

class Category {
  Category({
    @required this.name,
    @required this.type,
    @required this.data,
    @required this.categoryId,
  });

  String name;
  dynamic type;
  List<Datum> data;
  String categoryId;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        name: json["name"] == null ? null : json["name"],
        type: json["type"],
        data: json["data"] == null
            ? null
            : List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        categoryId: json["category_id"] == null ? null : json["category_id"],
      );

  Map<String, dynamic> toJson() => {
        "name": name == null ? null : name,
        "type": type,
        "data": data == null
            ? null
            : List<dynamic>.from(data.map((x) => x.toJson())),
        "category_id": categoryId == null ? null : categoryId,
      };
}

class Datum {
  Datum({
    @required this.id,
    @required this.name,
    @required this.category,
    @required this.categoryId,
    @required this.save,
    @required this.price,
    @required this.image,
  });

  String id;
  String name;
  String category;
  String categoryId;
  int save;
  String price;
  String image;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        category: json["category"] == null ? null : json["category"],
        categoryId: json["category_id"] == null ? null : json["category_id"],
        save: json["save"] == null ? null : json["save"],
        price: json["price"] == null ? null : json["price"],
        image: json["image"] == null ? null : json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "category": category == null ? null : category,
        "category_id": categoryId == null ? null : categoryId,
        "save": save == null ? null : save,
        "price": price == null ? null : price,
        "image": image == null ? null : image,
      };
}

class Supplier {
  Supplier({
    @required this.image,
    @required this.title,
    @required this.category,
    @required this.id,
    @required this.articipate,
  });

  String image;
  String title;
  String category;
  int id;
  String articipate;

  factory Supplier.fromJson(Map<String, dynamic> json) => Supplier(
        image: json["image"] == null ? null : json["image"],
        title: json["title"] == null ? null : json["title"],
        category: json["category"] == null ? null : json["category"],
        id: json["id"] == null ? null : json["id"],
        articipate: json["articipate"] == null ? null : json["articipate"],
      );

  Map<String, dynamic> toJson() => {
        "image": image == null ? null : image,
        "title": title == null ? null : title,
        "category": category == null ? null : category,
        "id": id == null ? null : id,
        "articipate": articipate == null ? null : articipate,
      };
}

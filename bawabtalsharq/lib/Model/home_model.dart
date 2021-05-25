// To parse this JSON data, do
//
//     final homeModel = homeModelFromJson(jsonString);

import 'dart:convert';

HomeModel homeModelFromJson(String str) => HomeModel.fromJson(json.decode(str));

String homeModelToJson(HomeModel data) => json.encode(data.toJson());

class HomeModel {
  HomeModel({
    this.code,
    this.status,
    this.msg,
    this.data,
  });

  int code;
  String status;
  String msg;
  Data data;

  factory HomeModel.fromJson(Map<String, dynamic> json) => HomeModel(
        code: json["code"],
        status: json["status"],
        msg: json["msg"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "status": status,
        "msg": msg,
        "data": data.toJson(),
      };
}

class Data {
  Data({
    this.slider,
    this.suppliers,
    this.categories,
  });

  List<String> slider;
  List<Supplier> suppliers;
  List<CategoryElement> categories;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        slider: List<String>.from(json["slider"].map((x) => x)),
        suppliers: List<Supplier>.from(
            json["suppliers"].map((x) => Supplier.fromJson(x))),
        categories: List<CategoryElement>.from(
            json["categories"].map((x) => CategoryElement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "slider": List<dynamic>.from(slider.map((x) => x)),
        "suppliers": List<dynamic>.from(suppliers.map((x) => x.toJson())),
        "categories": List<dynamic>.from(categories.map((x) => x.toJson())),
      };
}

class CategoryElement {
  CategoryElement({
    this.name,
    this.type,
    this.data,
    this.categoryId,
  });

  String name;
  int type;
  List<Datum> data;
  int categoryId;

  factory CategoryElement.fromJson(Map<String, dynamic> json) =>
      CategoryElement(
        name: json["name"],
        type: json["type"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        categoryId: json["category_id"] == null ? null : json["category_id"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "type": type,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "category_id": categoryId == null ? null : categoryId,
      };
}

class Datum {
  Datum({
    this.id,
    this.name,
    this.category,
    this.categoryId,
    this.price,
    this.image,
  });

  String id;
  String name;
  String category;
  int categoryId;
  String price;
  String image;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        name: json["name"],
        category: json["category"],
        categoryId: json["category_id"],
        price: json["price"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "category": category,
        "category_id": categoryId,
        "price": price,
        "image": image,
      };
}

class Supplier {
  Supplier({
    this.image,
    this.title,
    this.articipate,
  });

  String image;
  String title;
  String articipate;

  factory Supplier.fromJson(Map<String, dynamic> json) => Supplier(
        image: json["image"],
        title: json["title"],
        articipate: json["articipate"],
      );

  Map<String, dynamic> toJson() => {
        "image": image,
        "title": title,
        "articipate": articipate,
      };
}

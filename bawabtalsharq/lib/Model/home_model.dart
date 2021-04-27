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
    this.data,
  });

  int code;
  String status;
  Data data;

  factory HomeModel.fromJson(Map<String, dynamic> json) => HomeModel(
        code: json["code"],
        status: json["status"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "status": status,
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
  });

  String name;
  int type;
  List<Datum> data;

  factory CategoryElement.fromJson(Map<String, dynamic> json) =>
      CategoryElement(
        name: json["name"],
        type: json["type"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "type": type,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    this.id,
    this.name,
    this.category,
    this.price,
    this.image,
  });

  String id;
  String name;
  CategoryEnum category;
  String price;
  String image;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        name: json["name"],
        category: categoryEnumValues.map[json["category"]],
        price: json["price"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "category": categoryEnumValues.reverse[category],
        "price": price,
        "image": image,
      };
}

enum CategoryEnum { AGRICULTURAL_CROPS, BEAUTY_PERSONAL_CARE }

final categoryEnumValues = EnumValues({
  "Agricultural Crops": CategoryEnum.AGRICULTURAL_CROPS,
  "Beauty & Personal Care": CategoryEnum.BEAUTY_PERSONAL_CARE
});

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

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}

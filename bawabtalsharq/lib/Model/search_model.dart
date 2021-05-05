// To parse this JSON data, do
//
//     final searchModel = searchModelFromJson(jsonString);

import 'dart:convert';

SearchModel searchModelFromJson(String str) =>
    SearchModel.fromJson(json.decode(str));

String searchModelToJson(SearchModel data) => json.encode(data.toJson());

class SearchModel {
  SearchModel({
    this.code,
    this.status,
    this.data,
  });

  int code;
  String status;
  List<Datum> data;

  factory SearchModel.fromJson(Map<String, dynamic> json) => SearchModel(
        code: json["code"],
        status: json["status"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "status": status,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    this.productId,
    this.product,
    this.searchWords,
    this.productCode,
    this.minQty,
    this.maxQty,
    this.status,
    this.categoryId,
    this.imagePath,
    this.price,
  });

  String productId;
  String product;
  String searchWords;
  String productCode;
  String minQty;
  String maxQty;
  Status status;
  String categoryId;
  String imagePath;
  String price;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        productId: json["product_id"],
        product: json["product"],
        searchWords: json["search_words"],
        productCode: json["product_code"],
        minQty: json["min_qty"],
        maxQty: json["max_qty"],
        status: statusValues.map[json["status"]],
        categoryId: json["category_id"],
        imagePath: json["image_path"],
        price: json["price"],
      );

  Map<String, dynamic> toJson() => {
        "product_id": productId,
        "product": product,
        "search_words": searchWords,
        "product_code": productCode,
        "min_qty": minQty,
        "max_qty": maxQty,
        "status": statusValues.reverse[status],
        "category_id": categoryId,
        "image_path": imagePath,
        "price": price,
      };
}

enum Status { A }

final statusValues = EnumValues({"A": Status.A});

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

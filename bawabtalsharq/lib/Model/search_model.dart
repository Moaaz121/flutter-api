// To parse this JSON data, do
//
//     final searchModel = searchModelFromJson(jsonString);

import 'dart:convert';

import 'package:meta/meta.dart';

SearchModel searchModelFromJson(String str) =>
    SearchModel.fromJson(json.decode(str));

String searchModelToJson(SearchModel data) => json.encode(data.toJson());

class SearchModel {
  SearchModel({
    @required this.code,
    @required this.status,
    @required this.msg,
    @required this.data,
  });

  int code;
  String status;
  String msg;
  List<Datum> data;

  factory SearchModel.fromJson(Map<String, dynamic> json) => SearchModel(
        code: json["code"] == null ? null : json["code"],
        status: json["status"] == null ? null : json["status"],
        msg: json["msg"] == null ? null : json["msg"],
        data: json["data"] == null
            ? null
            : List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "code": code == null ? null : code,
        "status": status == null ? null : status,
        "msg": msg == null ? null : msg,
        "data": data == null
            ? null
            : List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    @required this.productId,
    @required this.product,
    @required this.shortDescription,
    @required this.searchWords,
    @required this.productCode,
    @required this.minQty,
    @required this.maxQty,
    @required this.status,
    @required this.categoryId,
    @required this.imagePath,
    @required this.imageId,
    @required this.price,
    @required this.company,
    @required this.companyId,
    @required this.save,
    @required this.companyImg,
  });

  String productId;
  String product;
  String shortDescription;
  String searchWords;
  String productCode;
  String minQty;
  String maxQty;
  String status;
  String categoryId;
  String imagePath;
  String imageId;
  String price;
  String company;
  String companyId;
  dynamic save;
  String companyImg;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        productId: json["product_id"] == null ? null : json["product_id"],
        product: json["product"] == null ? null : json["product"],
        shortDescription: json["short_description"] == null
            ? null
            : json["short_description"],
        searchWords: json["search_words"] == null ? null : json["search_words"],
        productCode: json["product_code"] == null ? null : json["product_code"],
        minQty: json["min_qty"] == null ? null : json["min_qty"],
        maxQty: json["max_qty"] == null ? null : json["max_qty"],
        status: json["status"] == null ? null : json["status"],
        categoryId: json["category_id"] == null ? null : json["category_id"],
        imagePath: json["image_path"] == null ? null : json["image_path"],
        imageId: json["image_id"] == null ? null : json["image_id"],
        price: json["price"] == null ? null : json["price"],
        company: json["company"] == null ? null : json["company"],
        companyId: json["company_id"] == null ? null : json["company_id"],
        save: json["save"],
        companyImg: json["company_img"] == null ? null : json["company_img"],
      );

  Map<String, dynamic> toJson() => {
        "product_id": productId == null ? null : productId,
        "product": product == null ? null : product,
        "short_description": shortDescription == null ? null : shortDescription,
        "search_words": searchWords == null ? null : searchWords,
        "product_code": productCode == null ? null : productCode,
        "min_qty": minQty == null ? null : minQty,
        "max_qty": maxQty == null ? null : maxQty,
        "status": status == null ? null : status,
        "category_id": categoryId == null ? null : categoryId,
        "image_path": imagePath == null ? null : imagePath,
        "image_id": imageId == null ? null : imageId,
        "price": price == null ? null : price,
        "company": company == null ? null : company,
        "company_id": companyId == null ? null : companyId,
        "save": save,
        "company_img": companyImg == null ? null : companyImg,
      };
}

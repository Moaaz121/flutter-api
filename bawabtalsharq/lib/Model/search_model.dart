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
    this.msg,
    this.products,
  });

  int code;
  String status;
  String msg;
  List<Product> products;

  factory SearchModel.fromJson(Map<String, dynamic> json) => SearchModel(
        code: json["code"],
        status: json["status"],
        msg: json["msg"],
        products:
            List<Product>.from(json["data"].map((x) => Product.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "status": status,
        "msg": msg,
        "data": List<dynamic>.from(products.map((x) => x.toJson())),
      };
}

class Product {
  Product({
    this.productId,
    this.product,
    this.shortDescription,
    this.searchWords,
    this.productCode,
    this.minQty,
    this.maxQty,
    this.status,
    this.categoryId,
    this.imagePath,
    this.imageId,
    this.price,
    this.company,
    this.companyId,
    this.companyImg,
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
  String companyImg;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        productId: json["product_id"],
        product: json["product"],
        shortDescription: json["short_description"],
        searchWords: json["search_words"],
        productCode: json["product_code"],
        minQty: json["min_qty"],
        maxQty: json["max_qty"],
        status: json["status"],
        categoryId: json["category_id"],
        imagePath: json["image_path"],
        imageId: json["image_id"],
        price: json["price"],
        company: json["company"],
        companyId: json["company_id"],
        companyImg: json["company_img"],
      );

  Map<String, dynamic> toJson() => {
        "product_id": productId,
        "product": product,
        "short_description": shortDescription,
        "search_words": searchWords,
        "product_code": productCode,
        "min_qty": minQty,
        "max_qty": maxQty,
        "status": status,
        "category_id": categoryId,
        "image_path": imagePath,
        "image_id": imageId,
        "price": price,
        "company": company,
        "company_id": companyId,
        "company_img": companyImg,
      };
}

// To parse this JSON data, do
//
//     final filterModel = filterModelFromJson(jsonString);

import 'dart:convert';

FilterModel filterModelFromJson(String str) =>
    FilterModel.fromJson(json.decode(str));

String filterModelToJson(FilterModel data) => json.encode(data.toJson());

class FilterModel {
  FilterModel({
    this.code,
    this.status,
    this.msg,
    this.data,
  });

  int code;
  String status;
  String msg;
  Data data;

  factory FilterModel.fromJson(Map<String, dynamic> json) => FilterModel(
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
    this.categories,
    this.shipping,
    this.suppliers,
    this.sizes,
    this.colorCode,
  });

  List<Category> categories;
  List<Shipping> shipping;
  List<Supplier> suppliers;
  List<String> sizes;
  List<ColorCode> colorCode;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        categories: json["categories"] == null
            ? null
            : List<Category>.from(
                json["categories"].map((x) => Category.fromJson(x))),
        shipping: json["shipping"] == null
            ? null
            : List<Shipping>.from(
                json["shipping"].map((x) => Shipping.fromJson(x))),
        suppliers: json["suppliers"] == null
            ? null
            : List<Supplier>.from(
                json["suppliers"].map((x) => Supplier.fromJson(x))),
        sizes: json["sizes"] == null
            ? null
            : List<String>.from(json["sizes"].map((x) => x)),
        colorCode: json["color_code"] == null
            ? null
            : List<ColorCode>.from(
                json["color_code"].map((x) => ColorCode.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "categories": categories == null
            ? null
            : List<dynamic>.from(categories.map((x) => x.toJson())),
        "shipping": shipping == null
            ? null
            : List<dynamic>.from(shipping.map((x) => x.toJson())),
        "suppliers": suppliers == null
            ? null
            : List<dynamic>.from(suppliers.map((x) => x.toJson())),
        "sizes": sizes == null ? null : List<dynamic>.from(sizes.map((x) => x)),
        "color_code": colorCode == null
            ? null
            : List<dynamic>.from(colorCode.map((x) => x.toJson())),
      };
}

class Category {
  Category({
    this.category,
    this.categoryId,
    this.image,
  });

  String category;
  String categoryId;
  String image;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        category: json["category"] == null ? null : json["category"],
        categoryId: json["category_id"] == null ? null : json["category_id"],
        image: json["image"] == null ? null : json["image"],
      );

  Map<String, dynamic> toJson() => {
        "category": category == null ? null : category,
        "category_id": categoryId == null ? null : categoryId,
        "image": image == null ? null : image,
      };
}

class ColorCode {
  ColorCode({
    this.name,
    this.color,
  });

  String name;
  String color;

  factory ColorCode.fromJson(Map<String, dynamic> json) => ColorCode(
        name: json["name"] == null ? null : json["name"],
        color: json["color"] == null ? null : json["color"],
      );

  Map<String, dynamic> toJson() => {
        "name": name == null ? null : name,
        "color": color == null ? null : color,
      };
}

class Shipping {
  Shipping({
    this.shippingId,
    this.name,
  });

  String shippingId;
  String name;

  factory Shipping.fromJson(Map<String, dynamic> json) => Shipping(
        shippingId: json["shipping_id"] == null ? null : json["shipping_id"],
        name: json["name"] == null ? null : json["name"],
      );

  Map<String, dynamic> toJson() => {
        "shipping_id": shippingId == null ? null : shippingId,
        "name": name == null ? null : name,
      };
}

class Supplier {
  Supplier({
    this.supplierId,
    this.logo,
  });

  String supplierId;
  String logo;

  factory Supplier.fromJson(Map<String, dynamic> json) => Supplier(
        supplierId: json["supplier_id"] == null ? null : json["supplier_id"],
        logo: json["logo"] == null ? null : json["logo"],
      );

  Map<String, dynamic> toJson() => {
        "supplier_id": supplierId == null ? null : supplierId,
        "logo": logo == null ? null : logo,
      };
}

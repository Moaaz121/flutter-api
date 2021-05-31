import 'dart:convert';

SupplierProfileModel supplierProfileModelFromJson(String str) =>
    SupplierProfileModel.fromJson(json.decode(str));

String supplierProfileModelToJson(SupplierProfileModel data) =>
    json.encode(data.toJson());

class SupplierProfileModel {
  SupplierProfileModel({
    this.code,
    this.status,
    this.msg,
    this.data,
  });

  int code;
  String status;
  String msg;
  List<SupplierData> data;

  factory SupplierProfileModel.fromJson(Map<String, dynamic> json) =>
      SupplierProfileModel(
        code: json["code"],
        status: json["status"],
        msg: json["msg"],
        data: List<SupplierData>.from(
            json["data"].map((x) => SupplierData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "status": status,
        "msg": msg,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class SupplierData {
  SupplierData({
    this.supplierId,
    this.name,
    this.address,
    this.country,
    this.city,
    this.state,
    this.zipcode,
    this.email,
    this.phone,
    this.fax,
    this.url,
    this.year,
    this.logo,
    this.rate,
    this.products,
  });

  String supplierId;
  String name;
  String address;
  String country;
  String city;
  String state;
  String zipcode;
  String email;
  String phone;
  String fax;
  String url;
  String year;
  String logo;
  int rate;
  List<Product> products;

  factory SupplierData.fromJson(Map<String, dynamic> json) => SupplierData(
        supplierId: json["supplier_id"],
        name: json["name"],
        address: json["address"],
        country: json["country"],
        city: json["city"],
        state: json["state"],
        zipcode: json["zipcode"],
        email: json["email"],
        phone: json["phone"],
        fax: json["fax"],
        url: json["url"],
        year: json["year"],
        logo: json["logo"],
        rate: json["rate"],
        products: List<Product>.from(
            json["products"].map((x) => Product.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "supplier_id": supplierId,
        "name": name,
        "address": address,
        "country": country,
        "city": city,
        "state": state,
        "zipcode": zipcode,
        "email": email,
        "phone": phone,
        "fax": fax,
        "url": url,
        "year": year,
        "logo": logo,
        "rate": rate,
        "products": List<dynamic>.from(products.map((x) => x.toJson())),
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
    this.category,
    this.price,
    this.company,
    this.imagePath,
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
  String category;
  String price;
  String company;
  String imagePath;

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
        category: json["category"],
        price: json["price"],
        company: json["company"],
        imagePath: json["image_path"],
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
        "category": category,
        "price": price,
        "company": company,
        "image_path": imagePath,
      };
}

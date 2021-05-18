import 'dart:convert';

IndividualProductModel individualProductModelFromJson(String str) =>
    IndividualProductModel.fromJson(json.decode(str));

String individualProductModelToJson(IndividualProductModel data) =>
    json.encode(data.toJson());

class IndividualProductModel {
  IndividualProductModel({
    this.code,
    this.status,
    this.msg,
    this.data,
  });

  int code;
  String status;
  String msg;
  ProductDetails data;

  factory IndividualProductModel.fromJson(Map<String, dynamic> json) =>
      IndividualProductModel(
        code: json["code"],
        status: json["status"],
        msg: json["msg"],
        data: ProductDetails.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "status": status,
        "msg": msg,
        "data": data.toJson(),
      };
}

class ProductDetails {
  ProductDetails({
    this.productId,
    this.product,
    this.shortDescription,
    this.fullDescription,
    this.searchWords,
    this.companyId,
    this.company,
    this.productCode,
    this.minQty,
    this.maxQty,
    this.status,
    this.categoryId,
    this.category,
    this.imageId,
    this.imagePath,
    this.price,
    this.rating,
    this.color,
    this.faq,
    this.detailedPictures,
    this.packingShipping,
    this.certificates,
    this.supplier,
    this.year,
    this.countryName,
    this.countryImage,
  });

  String productId;
  String product;
  String shortDescription;
  String fullDescription;
  String searchWords;
  String companyId;
  String company;
  String productCode;
  String minQty;
  String maxQty;
  String status;
  String categoryId;
  String category;
  String imageId;
  String imagePath;
  String price;
  String rating;
  List<dynamic> color;
  List<dynamic> faq;
  List<dynamic> detailedPictures;
  List<dynamic> packingShipping;
  List<dynamic> certificates;
  String supplier;
  String year;
  String countryName;
  String countryImage;

  factory ProductDetails.fromJson(Map<String, dynamic> json) => ProductDetails(
        productId: json["product_id"],
        product: json["product"],
        shortDescription: json["short_description"],
        fullDescription: json["full_description"],
        searchWords: json["search_words"],
        companyId: json["company_id"],
        company: json["company"],
        productCode: json["product_code"],
        minQty: json["min_qty"],
        maxQty: json["max_qty"],
        status: json["status"],
        categoryId: json["category_id"],
        category: json["category"],
        imageId: json["image_id"],
        imagePath: json["image_path"],
        price: json["price"],
        rating: json["rating"],
        color: List<dynamic>.from(json["color"].map((x) => x)),
        faq: List<dynamic>.from(json["faq"].map((x) => x)),
        detailedPictures:
            List<dynamic>.from(json["detailed_pictures"].map((x) => x)),
        packingShipping:
            List<dynamic>.from(json["packing_shipping"].map((x) => x)),
        certificates: List<dynamic>.from(json["certificates"].map((x) => x)),
        supplier: json["supplier"],
        year: json["year"],
        countryName: json["country_name"],
        countryImage: json["country_image"],
      );

  Map<String, dynamic> toJson() => {
        "product_id": productId,
        "product": product,
        "short_description": shortDescription,
        "full_description": fullDescription,
        "search_words": searchWords,
        "company_id": companyId,
        "company": company,
        "product_code": productCode,
        "min_qty": minQty,
        "max_qty": maxQty,
        "status": status,
        "category_id": categoryId,
        "category": category,
        "image_id": imageId,
        "image_path": imagePath,
        "price": price,
        "rating": rating,
        "color": List<dynamic>.from(color.map((x) => x)),
        "faq": List<dynamic>.from(faq.map((x) => x)),
        "detailed_pictures": List<dynamic>.from(detailedPictures.map((x) => x)),
        "packing_shipping": List<dynamic>.from(packingShipping.map((x) => x)),
        "certificates": List<dynamic>.from(certificates.map((x) => x)),
        "supplier": supplier,
        "year": year,
        "country_name": countryName,
        "country_image": countryImage,
      };
}

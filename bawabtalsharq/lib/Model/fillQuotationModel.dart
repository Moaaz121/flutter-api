// To parse this JSON data, do
//
//     final fillQuotationModel = fillQuotationModelFromJson(jsonString);

import 'dart:convert';

FillQuotationModel fillQuotationModelFromJson(String str) =>
    FillQuotationModel.fromJson(json.decode(str));

String fillQuotationModelToJson(FillQuotationModel data) =>
    json.encode(data.toJson());

class FillQuotationModel {
  FillQuotationModel({
    this.code,
    this.status,
    this.msg,
    this.data,
  });

  int code;
  String status;
  String msg;
  DataRQF data;

  factory FillQuotationModel.fromJson(Map<String, dynamic> json) =>
      FillQuotationModel(
        code: json["code"],
        status: json["status"],
        msg: json["msg"],
        data: DataRQF.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "status": status,
        "msg": msg,
        "data": data.toJson(),
      };
}

class DataRQF {
  DataRQF({
    this.categories,
    this.certifications,
    this.tradeTerms,
    this.sourcingPurpose,
    this.destination,
    this.shipping,
  });

  List<CategoryRQF> categories;
  List<CertificationRQF> certifications;
  List<TradeTermRQF> tradeTerms;
  List<SourcingPurposeRQF> sourcingPurpose;
  List<DestinationRQF> destination;
  List<ShippingRQF> shipping;

  factory DataRQF.fromJson(Map<String, dynamic> json) => DataRQF(
        categories: List<CategoryRQF>.from(
            json["categories"].map((x) => CategoryRQF.fromJson(x))),
        certifications: List<CertificationRQF>.from(
            json["certifications"].map((x) => CertificationRQF.fromJson(x))),
        tradeTerms: List<TradeTermRQF>.from(
            json["trade_terms"].map((x) => TradeTermRQF.fromJson(x))),
        sourcingPurpose: List<SourcingPurposeRQF>.from(json["sourcing_purpose"]
            .map((x) => SourcingPurposeRQF.fromJson(x))),
        destination: List<DestinationRQF>.from(
            json["destination"].map((x) => DestinationRQF.fromJson(x))),
        shipping: List<ShippingRQF>.from(
            json["shipping"].map((x) => ShippingRQF.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "categories": List<dynamic>.from(categories.map((x) => x.toJson())),
        "certifications":
            List<dynamic>.from(certifications.map((x) => x.toJson())),
        "trade_terms": List<dynamic>.from(tradeTerms.map((x) => x.toJson())),
        "sourcing_purpose":
            List<dynamic>.from(sourcingPurpose.map((x) => x.toJson())),
        "destination": List<dynamic>.from(destination.map((x) => x.toJson())),
        "shipping": List<dynamic>.from(shipping.map((x) => x.toJson())),
      };
}

class CategoryRQF {
  CategoryRQF({
    this.category,
    this.categoryId,
    this.image,
  });

  String category;
  String categoryId;
  String image;

  factory CategoryRQF.fromJson(Map<String, dynamic> json) => CategoryRQF(
        category: json["category"],
        categoryId: json["category_id"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "category": category,
        "category_id": categoryId,
        "image": image,
      };
}

class CertificationRQF {
  CertificationRQF({
    this.cId,
    this.cName,
  });

  String cId;
  String cName;

  factory CertificationRQF.fromJson(Map<String, dynamic> json) =>
      CertificationRQF(
        cId: json["c_id"],
        cName: json["c_name"],
      );

  Map<String, dynamic> toJson() => {
        "c_id": cId,
        "c_name": cName,
      };
}

class DestinationRQF {
  DestinationRQF({
    this.code,
    this.country,
  });

  String code;
  String country;

  factory DestinationRQF.fromJson(Map<String, dynamic> json) => DestinationRQF(
        code: json["code"],
        country: json["country"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "country": country,
      };
}

class ShippingRQF {
  ShippingRQF({
    this.shippingId,
    this.shipping,
    this.image,
  });

  String shippingId;
  String shipping;
  String image;

  factory ShippingRQF.fromJson(Map<String, dynamic> json) => ShippingRQF(
        shippingId: json["shipping_id"],
        shipping: json["shipping"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "shipping_id": shippingId,
        "shipping": shipping,
        "image": image,
      };
}

class SourcingPurposeRQF {
  SourcingPurposeRQF({
    this.sId,
    this.sName,
  });

  String sId;
  String sName;

  factory SourcingPurposeRQF.fromJson(Map<String, dynamic> json) =>
      SourcingPurposeRQF(
        sId: json["s_id"],
        sName: json["s_name"],
      );

  Map<String, dynamic> toJson() => {
        "s_id": sId,
        "s_name": sName,
      };
}

class TradeTermRQF {
  TradeTermRQF({
    this.tId,
    this.tName,
  });

  String tId;
  String tName;

  factory TradeTermRQF.fromJson(Map<String, dynamic> json) => TradeTermRQF(
        tId: json["t_id"],
        tName: json["t_name"],
      );

  Map<String, dynamic> toJson() => {
        "t_id": tId,
        "t_name": tName,
      };
}

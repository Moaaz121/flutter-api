// To parse this JSON data, do
//
//     final countryModel = countryModelFromJson(jsonString);

import 'dart:convert';

CountryModel countryModelFromJson(String str) =>
    CountryModel.fromJson(json.decode(str));

String countryModelToJson(CountryModel data) => json.encode(data.toJson());

class CountryModel {
  CountryModel({
    this.code,
    this.status,
    this.msg,
    this.data,
  });

  int code;
  String status;
  String msg;
  List<CountryData> data;

  factory CountryModel.fromJson(Map<String, dynamic> json) => CountryModel(
        code: json["code"],
        status: json["status"],
        msg: json["msg"],
        data: List<CountryData>.from(
            json["data"].map((x) => CountryData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "status": status,
        "msg": msg,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class CountryData {
  CountryData({
    this.code,
    this.region,
    this.lat,
    this.lon,
    this.country,
  });

  String code;
  Region region;
  String lat;
  String lon;
  String country;

  factory CountryData.fromJson(Map<String, dynamic> json) => CountryData(
        code: json["code"],
        region: regionValues.map[json["region"]],
        lat: json["lat"],
        lon: json["lon"],
        country: json["country"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "region": regionValues.reverse[region],
        "lat": lat,
        "lon": lon,
        "country": country,
      };
}

enum Region { AS, EU, AF, AU, LA, AN, NA, EMPTY }

final regionValues = EnumValues({
  "AF": Region.AF,
  "AN": Region.AN,
  "AS": Region.AS,
  "AU": Region.AU,
  "": Region.EMPTY,
  "EU": Region.EU,
  "LA": Region.LA,
  "NA": Region.NA
});

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

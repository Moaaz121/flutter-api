class CurrencyModel {
  int code;
  String status;
  String msg;
  List<CurrencyData> data;

  CurrencyModel({this.code, this.status, this.msg, this.data});

  CurrencyModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    status = json['status'];
    msg = json['msg'];
    if (json['data'] != null) {
      data = new List<CurrencyData>();
      json['data'].forEach((v) {
        data.add(new CurrencyData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['status'] = this.status;
    data['msg'] = this.msg;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CurrencyData {
  String currencyId;
  String currencyCode;
  String symbol;
  String coefficient;
  String description;

  CurrencyData(
      {this.currencyId,
      this.currencyCode,
      this.symbol,
      this.coefficient,
      this.description});

  CurrencyData.fromJson(Map<String, dynamic> json) {
    currencyId = json['currency_id'];
    currencyCode = json['currency_code'];
    symbol = json['symbol'];
    coefficient = json['coefficient'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['currency_id'] = this.currencyId;
    data['currency_code'] = this.currencyCode;
    data['symbol'] = this.symbol;
    data['coefficient'] = this.coefficient;
    data['description'] = this.description;
    return data;
  }
}

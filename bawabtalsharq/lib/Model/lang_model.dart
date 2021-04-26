class LangModel {
  int code;
  String status;
  List<LangData> langData;

  LangModel({this.code, this.status, this.langData});

  LangModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    status = json['status'];
    if (json['data'] != null) {
      langData = new List<LangData>();
      json['data'].forEach((v) {
        langData.add(new LangData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['status'] = this.status;
    if (this.langData != null) {
      data['data'] = this.langData.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class LangData {
  String langCode;
  String name;

  LangData({this.langCode, this.name});

  LangData.fromJson(Map<String, dynamic> json) {
    langCode = json['lang_code'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['lang_code'] = this.langCode;
    data['name'] = this.name;
    return data;
  }
}

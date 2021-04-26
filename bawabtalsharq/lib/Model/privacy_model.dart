class PrivacyModel {
  int code;
  String status;
  List<PrivacyData> privacyData;

  PrivacyModel({this.code, this.status, this.privacyData});

  PrivacyModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    status = json['status'];
    if (json['data'] != null) {
      privacyData = new List<PrivacyData>();
      json['data'].forEach((v) {
        privacyData.add(new PrivacyData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['status'] = this.status;
    if (this.privacyData != null) {
      data['data'] = this.privacyData.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PrivacyData {
  String page;
  String description;

  PrivacyData({this.page, this.description});

  PrivacyData.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['page'] = this.page;
    data['description'] = this.description;
    return data;
  }
}

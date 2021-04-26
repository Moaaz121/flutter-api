class AboutModel {
  int code;
  String status;
  List<AboutData> aboutData;

  AboutModel({this.code, this.status, this.aboutData});

  AboutModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    status = json['status'];
    if (json['data'] != null) {
      aboutData = new List<AboutData>();
      json['data'].forEach((v) {
        aboutData.add(new AboutData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['status'] = this.status;
    if (this.aboutData != null) {
      data['data'] = this.aboutData.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AboutData {
  String pageTitle;
  String description;

  AboutData({this.pageTitle, this.description});

  AboutData.fromJson(Map<String, dynamic> json) {
    pageTitle = json['page_title'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['page_title'] = this.pageTitle;
    data['description'] = this.description;
    return data;
  }
}

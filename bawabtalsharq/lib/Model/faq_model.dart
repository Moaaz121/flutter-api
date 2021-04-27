class FaqModel {
  int code;
  String status;
  List<FaqData> faqData;

  FaqModel({this.code, this.status, this.faqData});

  FaqModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    status = json['status'];
    if (json['data'] != null) {
      faqData = new List<FaqData>();
      json['data'].forEach((v) {
        faqData.add(new FaqData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['status'] = this.status;
    if (this.faqData != null) {
      data['data'] = this.faqData.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class FaqData {
  String pageId;
  String page;
  String description;

  FaqData({this.pageId, this.page, this.description});

  FaqData.fromJson(Map<String, dynamic> json) {
    pageId = json['page_id'];
    page = json['page'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['page_id'] = this.pageId;
    data['page'] = this.page;
    data['description'] = this.description;
    return data;
  }
}

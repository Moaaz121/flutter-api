class PlanModel {
  int code;
  String status;
  String msg;
  List<Plan> plan;

  PlanModel({this.code, this.status, this.msg, this.plan});

  PlanModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    status = json['status'];
    msg = json['msg'];
    if (json['data'] != null) {
      plan = new List<Plan>();
      json['data'].forEach((v) {
        plan.add(new Plan.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['status'] = this.status;
    data['msg'] = this.msg;
    if (this.plan != null) {
      data['data'] = this.plan.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Plan {
  String packageId;
  String packageName;
  String packagePrice;
  String color;
  List<Details> details;

  Plan(
      {this.packageId,
      this.packageName,
      this.packagePrice,
      this.details,
      this.color});

  Plan.fromJson(Map<String, dynamic> json) {
    packageId = json['package_id'];
    packageName = json['package_name'];
    packagePrice = json['package_price'];
    color = json['color'];
    if (json['details'] != null) {
      details = new List<Details>();
      json['details'].forEach((v) {
        details.add(new Details.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['package_id'] = this.packageId;
    data['package_name'] = this.packageName;
    data['package_price'] = this.packagePrice;
    data['color'] = this.color;
    if (this.details != null) {
      data['details'] = this.details.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Details {
  String attributeName;
  String attributeValue;

  Details({this.attributeName, this.attributeValue});

  Details.fromJson(Map<String, dynamic> json) {
    attributeName = json['attribute_name'];
    attributeValue = json['attribute_value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['attribute_name'] = this.attributeName;
    data['attribute_value'] = this.attributeValue;
    return data;
  }
}

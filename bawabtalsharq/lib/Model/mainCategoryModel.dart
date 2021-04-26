class MainCategory {
  int code;
  String status;
  List<CategoryModel> categoryData;

  MainCategory({this.code, this.status, this.categoryData});

  MainCategory.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    status = json['status'];
    if (json['data'] != null) {
      categoryData = new List<CategoryModel>();
      json['data'].forEach((v) {
        categoryData.add(new CategoryModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['status'] = this.status;
    if (this.categoryData != null) {
      data['data'] = this.categoryData.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CategoryModel {
  String category;
  String categoryId;
  String color;
  bool isSelected = false;

  CategoryModel({this.category, this.categoryId, this.color});

  CategoryModel.fromJson(Map<String, dynamic> json) {
    category = json['category'];
    categoryId = json['category_id'];
    color = json['color'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['category'] = this.category;
    data['category_id'] = this.categoryId;
    data['color'] = this.color;
    return data;
  }
}

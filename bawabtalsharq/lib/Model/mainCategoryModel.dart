class MainCategory {
  int code;
  String status;
  String msg;
  List<CategoryModel> data;

  MainCategory({this.code, this.status, this.msg, this.data});

  MainCategory.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    status = json['status'];
    msg = json['msg'];
    if (json['data'] != null) {
      data = new List<CategoryModel>();
      json['data'].forEach((v) {
        data.add(new CategoryModel.fromJson(v));
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

class CategoryModel {
  String category;
  String categoryId;
  String image;
  String color;
  bool isSelected = false;
  List<SubCatregory> subCatregory;

  CategoryModel(
      {this.category,
      this.categoryId,
      this.image,
      this.color,
      this.subCatregory});

  CategoryModel.fromJson(Map<String, dynamic> json) {
    category = json['category'];
    categoryId = json['category_id'];
    image = json['image'];
    color = json['color'];
    if (json['sub_catregory'] != null) {
      subCatregory = new List<SubCatregory>();
      json['sub_catregory'].forEach((v) {
        subCatregory.add(new SubCatregory.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['category'] = this.category;
    data['category_id'] = this.categoryId;
    data['image'] = this.image;
    data['color'] = this.color;
    if (this.subCatregory != null) {
      data['sub_catregory'] = this.subCatregory.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SubCatregory {
  String category;
  String categoryId;
  String image;
  String color;

  SubCatregory({this.category, this.categoryId, this.image, this.color});

  SubCatregory.fromJson(Map<String, dynamic> json) {
    category = json['category'];
    categoryId = json['category_id'];
    image = json['image'];
    color = json['color'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['category'] = this.category;
    data['category_id'] = this.categoryId;
    data['image'] = this.image;
    data['color'] = this.color;
    return data;
  }
}

// class MainCategory {
//   int code;
//   String status;
//   List<CategoryModel> data;
//
//   MainCategory({this.code, this.status, this.data});
//
//   MainCategory.fromJson(Map<String, dynamic> json) {
//     code = json['code'];
//     status = json['status'];
//     if (json['data'] != null) {
//       data = new List<CategoryModel>();
//       json['data'].forEach((v) {
//         data.add(new CategoryModel.fromJson(v));
//       });
//     }
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['code'] = this.code;
//     data['status'] = this.status;
//     if (this.data != null) {
//       data['data'] = this.data.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }

// class CategoryModel {
//   String category;
//   String categoryId;
//   String color;
//   bool isSelected = false;
//   List<SubCategory> subCatregory;
//
//   CategoryModel(
//       {this.category, this.categoryId, this.color, this.subCatregory});
//
//   CategoryModel.fromJson(Map<String, dynamic> json) {
//     category = json['category'];
//     categoryId = json['category_id'];
//     color = json['color'];
//     if (json['sub_catregory'] != null) {
//       subCatregory = new List<SubCategory>();
//       json['sub_catregory'].forEach((v) {
//         subCatregory.add(new SubCategory.fromJson(v));
//       });
//     }
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['category'] = this.category;
//     data['category_id'] = this.categoryId;
//     data['color'] = this.color;
//     if (this.subCatregory != null) {
//       data['sub_catregory'] = this.subCatregory.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }

// class SubCategory {
//   String category;
//   String categoryId;
//   String colors = '0xFFFFFFFF';
//
//   SubCategory({this.category, this.categoryId});
//
//   SubCategory.fromJson(Map<String, dynamic> json) {
//     category = json['category'];
//     categoryId = json['category_id'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['category'] = this.category;
//     data['category_id'] = this.categoryId;
//     return data;
//   }
// }

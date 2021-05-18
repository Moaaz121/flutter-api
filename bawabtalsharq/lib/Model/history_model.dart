class HistoryModel {
  int code;
  String status;
  String msg;
  List<Product> product;

  HistoryModel({this.code, this.status, this.msg, this.product});

  HistoryModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    status = json['status'];
    msg = json['msg'];
    if (json['data'] != null) {
      product = new List<Product>();
      json['data'].forEach((v) {
        product.add(new Product.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['status'] = this.status;
    data['msg'] = this.msg;
    if (this.product != null) {
      data['data'] = this.product.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Product {
  String productId;
  String product;
  String searchWords;
  String productCode;
  String minQty;
  String maxQty;
  String status;
  String categoryId;
  String imagePath;
  String price;
  String company;

  Product(
      {this.productId,
      this.product,
      this.searchWords,
      this.productCode,
      this.minQty,
      this.maxQty,
      this.status,
      this.categoryId,
      this.imagePath,
      this.price,
      this.company});

  Product.fromJson(Map<String, dynamic> json) {
    productId = json['product_id'];
    product = json['product'];
    searchWords = json['search_words'];
    productCode = json['product_code'];
    minQty = json['min_qty'];
    maxQty = json['max_qty'];
    status = json['status'];
    categoryId = json['category_id'];
    imagePath = json['image_path'];
    price = json['price'];
    company = json['company'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product_id'] = this.productId;
    data['product'] = this.product;
    data['search_words'] = this.searchWords;
    data['product_code'] = this.productCode;
    data['min_qty'] = this.minQty;
    data['max_qty'] = this.maxQty;
    data['status'] = this.status;
    data['category_id'] = this.categoryId;
    data['image_path'] = this.imagePath;
    data['price'] = this.price;
    data['company'] = this.company;
    return data;
  }
}

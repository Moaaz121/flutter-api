class IndividualProduct {
  int code;
  String status;
  IndividualProData data;

  IndividualProduct({this.code, this.status, this.data});

  IndividualProduct.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    status = json['status'];
    data = json['data'] != null
        ? new IndividualProData.fromJson(json['data'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class IndividualProData {
  String productId;
  String product;
  String shortDescription;
  String fullDescription;
  String searchWords;
  String companyId;
  String productCode;
  String minQty;
  String maxQty;
  String status;
  String categoryId;
  String imagePath;
  String price;
  String company;

  IndividualProData(
      {this.productId,
      this.product,
      this.shortDescription,
      this.fullDescription,
      this.searchWords,
      this.companyId,
      this.productCode,
      this.minQty,
      this.maxQty,
      this.status,
      this.categoryId,
      this.imagePath,
      this.price,
      this.company});

  IndividualProData.fromJson(Map<String, dynamic> json) {
    productId = json['product_id'];
    product = json['product'];
    shortDescription = json['short_description'];
    fullDescription = json['full_description'];
    searchWords = json['search_words'];
    companyId = json['company_id'];
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
    data['short_description'] = this.shortDescription;
    data['full_description'] = this.fullDescription;
    data['search_words'] = this.searchWords;
    data['company_id'] = this.companyId;
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

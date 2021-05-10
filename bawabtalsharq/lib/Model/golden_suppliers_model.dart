class GoldenSupplier {
  int code;
  String status;
  List<Suppliers> suppliers;

  GoldenSupplier({this.code, this.status, this.suppliers});

  GoldenSupplier.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    status = json['status'];
    if (json['data'] != null) {
      suppliers = new List<Suppliers>();
      json['data'].forEach((v) {
        suppliers.add(new Suppliers.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['status'] = this.status;
    if (this.suppliers != null) {
      data['data'] = this.suppliers.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Suppliers {
  String name;
  String year;
  String logo;
  int rate;
  List<Products> products;

  Suppliers({this.name, this.year, this.logo, this.rate, this.products});

  Suppliers.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    year = json['year'];
    logo = json['logo'];
    rate = json['rate'];
    if (json['products'] != null) {
      products = new List<Products>();
      json['products'].forEach((v) {
        products.add(new Products.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['year'] = this.year;
    data['logo'] = this.logo;
    data['rate'] = this.rate;
    if (this.products != null) {
      data['products'] = this.products.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Products {
  String productId;
  String product;
  String searchWords;
  String productCode;
  String minQty;
  String maxQty;
  String status;
  String categoryId;
  String category;
  String price;
  String company;
  String imagePath;

  Products(
      {this.productId,
      this.product,
      this.searchWords,
      this.productCode,
      this.minQty,
      this.maxQty,
      this.status,
      this.categoryId,
      this.category,
      this.price,
      this.company,
      this.imagePath});

  Products.fromJson(Map<String, dynamic> json) {
    productId = json['product_id'];
    product = json['product'];
    searchWords = json['search_words'];
    productCode = json['product_code'];
    minQty = json['min_qty'];
    maxQty = json['max_qty'];
    status = json['status'];
    categoryId = json['category_id'];
    category = json['category'];
    price = json['price'];
    company = json['company'];
    imagePath = json['image_path'];
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
    data['category'] = this.category;
    data['price'] = this.price;
    data['company'] = this.company;
    data['image_path'] = this.imagePath;
    return data;
  }
}

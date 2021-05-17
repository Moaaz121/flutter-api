class Superior {
  int code;
  String status;
  List<SuperiorData> data;

  Superior({this.code, this.status, this.data});

  Superior.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    status = json['status'];
    if (json['data'] != null) {
      data = new List<SuperiorData>();
      json['data'].forEach((v) {
        data.add(new SuperiorData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SuperiorData {
  String name;
  String address;
  String country;
  String city;
  String state;
  String zipcode;
  String email;
  String phone;
  String fax;
  String url;
  String year;
  String logo;
  int rate;
  List<Products> products;

  SuperiorData(
      {this.name,
      this.address,
      this.country,
      this.city,
      this.state,
      this.zipcode,
      this.email,
      this.phone,
      this.fax,
      this.url,
      this.year,
      this.logo,
      this.rate,
      this.products});

  SuperiorData.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    address = json['address'];
    country = json['country'];
    city = json['city'];
    state = json['state'];
    zipcode = json['zipcode'];
    email = json['email'];
    phone = json['phone'];
    fax = json['fax'];
    url = json['url'];
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
    data['address'] = this.address;
    data['country'] = this.country;
    data['city'] = this.city;
    data['state'] = this.state;
    data['zipcode'] = this.zipcode;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['fax'] = this.fax;
    data['url'] = this.url;
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

class SupplierProfileModel {
  int code;
  String status;
  String msg;
  SupplierData supplierData;

  SupplierProfileModel({this.code, this.status, this.msg, this.supplierData});

  SupplierProfileModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    status = json['status'];
    msg = json['msg'];
    supplierData =
        json['data'] != null ? new SupplierData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['status'] = this.status;
    data['msg'] = this.msg;
    if (this.supplierData != null) {
      data['data'] = this.supplierData.toJson();
    }
    return data;
  }
}

class SupplierData {
  String supplierId;
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
  String banner;
  List<Categories> categories;

  SupplierData(
      {this.supplierId,
      this.name,
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
      this.banner,
      this.categories});

  SupplierData.fromJson(Map<String, dynamic> json) {
    supplierId = json['supplier_id'];
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
    banner = json['banner'];
    if (json['categories'] != null) {
      categories = new List<Categories>();
      json['categories'].forEach((v) {
        categories.add(new Categories.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['supplier_id'] = this.supplierId;
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
    data['banner'] = this.banner;
    if (this.categories != null) {
      data['categories'] = this.categories.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Categories {
  String name;
  int categoryId;
  int type;
  List<ProductData> productData;

  Categories({this.name, this.categoryId, this.type, this.productData});

  Categories.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    categoryId = json['category_id'];
    type = json['type'];
    if (json['data'] != null) {
      productData = new List<ProductData>();
      json['data'].forEach((v) {
        productData.add(new ProductData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['category_id'] = this.categoryId;
    data['type'] = this.type;
    if (this.productData != null) {
      data['data'] = this.productData.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ProductData {
  String id;
  String name;
  String category;
  int categoryId;
  String price;
  String image;

  ProductData(
      {this.id,
      this.name,
      this.category,
      this.categoryId,
      this.price,
      this.image});

  ProductData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    category = json['category'];
    categoryId = json['category_id'];
    price = json['price'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['category'] = this.category;
    data['category_id'] = this.categoryId;
    data['price'] = this.price;
    data['image'] = this.image;
    return data;
  }
}

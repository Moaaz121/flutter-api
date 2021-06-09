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
  String logo;
  String banner;
  SupplierInfo supplierInfo;
  List<String> companyProfile;
  List<String> certificates;
  List<Categories> categories;

  SupplierData(
      {this.supplierId,
      this.name,
      this.logo,
      this.banner,
      this.supplierInfo,
      this.companyProfile,
      this.certificates,
      this.categories});

  SupplierData.fromJson(Map<String, dynamic> json) {
    supplierId = json['supplier_id'];
    name = json['name'];
    logo = json['logo'];
    banner = json['banner'];
    supplierInfo = json['member_info'] != null
        ? new SupplierInfo.fromJson(json['member_info'])
        : null;
    companyProfile = json['company_profile'].cast<String>();
    certificates = json['certificates'].cast<String>();
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
    data['logo'] = this.logo;
    data['banner'] = this.banner;
    if (this.supplierInfo != null) {
      data['member_info'] = this.supplierInfo.toJson();
    }
    data['company_profile'] = this.companyProfile;
    data['certificates'] = this.certificates;
    if (this.categories != null) {
      data['categories'] = this.categories.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SupplierInfo {
  String company;
  String email;
  String phone;
  String country;
  String city;
  String address;
  String zipcode;
  String state;
  String companySite;
  String mainProduct;
  String businessType;
  String year;
  String paymentCurrency;
  String paymentType;
  String leadTime;
  String sampleOrder;
  String totalEmployees;

  SupplierInfo(
      {this.company,
      this.email,
      this.phone,
      this.country,
      this.city,
      this.address,
      this.zipcode,
      this.state,
      this.companySite,
      this.mainProduct,
      this.businessType,
      this.year,
      this.paymentCurrency,
      this.paymentType,
      this.leadTime,
      this.sampleOrder,
      this.totalEmployees});

  SupplierInfo.fromJson(Map<String, dynamic> json) {
    company = json['company'];
    email = json['email'];
    phone = json['phone'];
    country = json['country'];
    city = json['city'];
    address = json['address'];
    zipcode = json['zipcode'];
    state = json['state'];
    companySite = json['company_site'];
    mainProduct = json['main_product'];
    businessType = json['business_type'];
    year = json['year'];
    paymentCurrency = json['payment_currency'];
    paymentType = json['payment_type'];
    leadTime = json['lead_time'];
    sampleOrder = json['sample_order'];
    totalEmployees = json['total_employees'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['company'] = this.company;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['country'] = this.country;
    data['city'] = this.city;
    data['address'] = this.address;
    data['zipcode'] = this.zipcode;
    data['state'] = this.state;
    data['company_site'] = this.companySite;
    data['main_product'] = this.mainProduct;
    data['business_type'] = this.businessType;
    data['year'] = this.year;
    data['payment_currency'] = this.paymentCurrency;
    data['payment_type'] = this.paymentType;
    data['lead_time'] = this.leadTime;
    data['sample_order'] = this.sampleOrder;
    data['total_employees'] = this.totalEmployees;
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

class IndividualProductModel {
  int code;
  String status;
  String msg;
  ProductDetails data;

  IndividualProductModel({this.code, this.status, this.msg, this.data});

  IndividualProductModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    status = json['status'];
    msg = json['msg'];
    data =
        json['data'] != null ? new ProductDetails.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['status'] = this.status;
    data['msg'] = this.msg;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class ProductDetails {
  String productId;
  String product;
  String shortDescription;
  String fullDescription;
  String searchWords;
  String companyId;
  String company;
  String productCode;
  String minQty;
  String maxQty;
  String status;
  String categoryId;
  String category;
  String imageId;
  String imagePath;
  String price;
  CompanyDetails companyDetails;
  List<String> companyProfile;
  String rating;
  List<String> color;
  List<Faq> faq;
  List<String> detailedPictures;
  List<PackingShipping> packingShipping;
  List<String> certificates;
  String supplier;
  String year;
  String countryName;
  String countryImage;

  ProductDetails(
      {this.productId,
      this.product,
      this.shortDescription,
      this.fullDescription,
      this.searchWords,
      this.companyId,
      this.company,
      this.productCode,
      this.minQty,
      this.maxQty,
      this.status,
      this.categoryId,
      this.category,
      this.imageId,
      this.imagePath,
      this.price,
      this.companyDetails,
      this.companyProfile,
      this.rating,
      this.color,
      this.faq,
      this.detailedPictures,
      this.packingShipping,
      this.certificates,
      this.supplier,
      this.year,
      this.countryName,
      this.countryImage});

  ProductDetails.fromJson(Map<String, dynamic> json) {
    productId = json['product_id'];
    product = json['product'];
    shortDescription = json['short_description'];
    fullDescription = json['full_description'];
    searchWords = json['search_words'];
    companyId = json['company_id'];
    company = json['company'];
    productCode = json['product_code'];
    minQty = json['min_qty'];
    maxQty = json['max_qty'];
    status = json['status'];
    categoryId = json['category_id'];
    category = json['category'];
    imageId = json['image_id'];
    imagePath = json['image_path'];
    price = json['price'];
    companyDetails = json['company_details'] != null
        ? new CompanyDetails.fromJson(json['company_details'])
        : null;
    companyProfile = json['company_profile'].cast<String>();
    rating = json['rating'];
    color = json['color'].cast<String>();
    if (json['faq'] != null) {
      faq = new List<Faq>();
      json['faq'].forEach((v) {
        faq.add(new Faq.fromJson(v));
      });
    }
    detailedPictures = json['detailed_pictures'].cast<String>();
    if (json['packing_shipping'] != null) {
      packingShipping = new List<PackingShipping>();
      json['packing_shipping'].forEach((v) {
        packingShipping.add(new PackingShipping.fromJson(v));
      });
    }
    certificates = json['certificates'].cast<String>();
    supplier = json['supplier'];
    year = json['year'];
    countryName = json['country_name'];
    countryImage = json['country_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product_id'] = this.productId;
    data['product'] = this.product;
    data['short_description'] = this.shortDescription;
    data['full_description'] = this.fullDescription;
    data['search_words'] = this.searchWords;
    data['company_id'] = this.companyId;
    data['company'] = this.company;
    data['product_code'] = this.productCode;
    data['min_qty'] = this.minQty;
    data['max_qty'] = this.maxQty;
    data['status'] = this.status;
    data['category_id'] = this.categoryId;
    data['category'] = this.category;
    data['image_id'] = this.imageId;
    data['image_path'] = this.imagePath;
    data['price'] = this.price;
    if (this.companyDetails != null) {
      data['company_details'] = this.companyDetails.toJson();
    }
    data['company_profile'] = this.companyProfile;
    data['rating'] = this.rating;
    data['color'] = this.color;
    if (this.faq != null) {
      data['faq'] = this.faq.map((v) => v.toJson()).toList();
    }
    data['detailed_pictures'] = this.detailedPictures;
    if (this.packingShipping != null) {
      data['packing_shipping'] =
          this.packingShipping.map((v) => v.toJson()).toList();
    }
    data['certificates'] = this.certificates;
    data['supplier'] = this.supplier;
    data['year'] = this.year;
    data['country_name'] = this.countryName;
    data['country_image'] = this.countryImage;
    return data;
  }
}

class CompanyDetails {
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

  CompanyDetails(
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

  CompanyDetails.fromJson(Map<String, dynamic> json) {
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

class Faq {
  String question;
  String answer;

  Faq({this.question, this.answer});

  Faq.fromJson(Map<String, dynamic> json) {
    question = json['question'];
    answer = json['answer'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['question'] = this.question;
    data['answer'] = this.answer;
    return data;
  }
}

class PackingShipping {
  String image;
  String description;

  PackingShipping({this.image, this.description});

  PackingShipping.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['image'] = this.image;
    data['description'] = this.description;
    return data;
  }
}

class SearchQueryModel {
  String q;
  List<String> Categories = [];
  List<String> expressShipping = [];
  List<String> shippedFrom = [];
  List<String> gender = [];
  List<String> brand = [];
  List<String> sizes = [];
  List<String> colors = [];
  String sort = 'DESC';
  String sortBy = 'popular';
  String rating = '3';
  String countryCode;
  String page;
  int priceFrom;
  int priceTo;
  List<int> discount;

  SearchQueryModel(this.q,
      {this.Categories,
      this.expressShipping,
      this.shippedFrom,
      this.gender,
      this.brand,
      this.sizes,
      this.colors,
      this.sort,
      this.sortBy,
      this.countryCode,
      this.page,
      this.priceFrom,
      this.priceTo,
      this.discount});

  factory SearchQueryModel.fromJson(Map<String, dynamic> parsedJson) {
    return new SearchQueryModel(
      parsedJson['q'] ?? "",
      discount: parsedJson['discount'] ?? "",
      priceFrom: parsedJson['priceFrom'] ?? "",
      priceTo: parsedJson['priceTo'] ?? "",
      shippedFrom: parsedJson['shippedFrom'] ?? "",
      expressShipping: parsedJson['expressShipping'] ?? "",
      sizes: parsedJson['sizes'] ?? "",
      gender: parsedJson['gender'] ?? "",
      sort: parsedJson['sort'] ?? "",
      sortBy: parsedJson['sortBy'] ?? "",
      Categories: parsedJson['Categories'] ?? "",
      countryCode: parsedJson['countryCode'] ?? "",
      brand: parsedJson['brand'] ?? "",
      page: parsedJson['page'] ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "q": this.q,
      "Categories": this.Categories,
      "expressShipping": this.expressShipping,
      "shippedFrom": this.shippedFrom,
      "gender": this.gender,
      "brand": this.brand,
      "sizes": this.sizes,
      "colors": this.colors,
      "sort": this.sort,
      "sortBy": this.sortBy,
      "countryCode": this.countryCode,
      "page": this.page,
      "priceFrom": this.priceFrom,
      "priceTo": this.priceTo,
      "discount": this.discount
    };
  }
}

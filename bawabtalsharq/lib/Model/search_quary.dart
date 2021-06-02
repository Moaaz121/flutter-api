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
  int priceFrom = 0;
  int priceTo = 999999999999999;
  List<int> discount = [];

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
      discount: parsedJson['discount'].cast<int>() ?? "",
      priceFrom: parsedJson['priceFrom'],
      priceTo: parsedJson['priceTo'],
      shippedFrom: parsedJson['shippedFrom'].cast<String>(),
      expressShipping: parsedJson['expressShipping'].cast<String>(),
      sizes: parsedJson['sizes'].cast<String>(),
      colors: parsedJson['colors'].cast<String>(),
      gender: parsedJson['gender'].cast<String>(),
      sort: parsedJson['sort'],
      sortBy: parsedJson['sortBy'],
      Categories: parsedJson['Categories'].cast<String>(),
      countryCode: parsedJson['countryCode'],
      brand: parsedJson['brand'].cast<String>(),
      page: parsedJson['page'],
    );
  }

  Map<String, dynamic> toJson() => {
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

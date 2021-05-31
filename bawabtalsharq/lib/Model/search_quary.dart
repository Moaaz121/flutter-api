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
      this.page});
}

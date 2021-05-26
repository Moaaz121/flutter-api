class SearchQueryModel {
  String q;
  List<String> Categories;
  String gender;
  List<String> brand;
  List<String> sizes;
  List<String> colors;
  String sort = 'DESC';
  String sortBy = 'popular';
  String countryCode;
  String page;

  SearchQueryModel(this.q,
      {this.Categories,
      this.gender,
      this.brand,
      this.sizes,
      this.colors,
      this.sort,
      this.sortBy,
      this.countryCode,
      this.page});
}

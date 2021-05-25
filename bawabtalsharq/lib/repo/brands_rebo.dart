class CategoryRepo {
  static Future<List<CategoryModel>> getCategory() async {
    var response = await http.get(Uri.encodeFull(
        APIS.serverURL + APIS.Category_API + Constants.getLanguage()));
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      //print(data.toString());

      List<CategoryModel> returnData = MainCategory.fromJson(data).data;
      // print(data.toString());

      return returnData;
    } else {
      throw Exception();
    }
  }
}

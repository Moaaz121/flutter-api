import 'dart:convert';

import 'package:bawabtalsharq/Model/search_model.dart';
import 'package:bawabtalsharq/Model/search_quary.dart';
import 'package:bawabtalsharq/Utils/apis.dart';
import 'package:bawabtalsharq/Utils/constants.dart';
import 'package:http/http.dart' as http;

class SearchRepo {
  Future<SearchModel> getSearch(SearchQueryModel searchQueryModel) async {
    Map<String, dynamic> params = {
      "search_text": searchQueryModel.q,
    };
    if (searchQueryModel.Categories != null &&
        searchQueryModel.Categories.length > 0) {
      params['categories'] = searchQueryModel.Categories.toList().toString();
    }
    if (searchQueryModel.page != null && searchQueryModel.page.isNotEmpty) {
      params['page'] = searchQueryModel.page;
    }
    // if (searchQueryModel.gender != null && searchQueryModel.gender.isNotEmpty) {
    //   params['gender'] = searchQueryModel.gender;
    // }
    if (searchQueryModel.brand != null && searchQueryModel.brand.isNotEmpty) {
      params['brand'] = searchQueryModel.brand.toList().toString();
    }
    if (searchQueryModel.sizes != null && searchQueryModel.sizes.isNotEmpty) {
      params['sizes'] = searchQueryModel.sizes.toList().toString();
    }
    if (searchQueryModel.colors != null && searchQueryModel.colors.isNotEmpty) {
      params['colors'] = searchQueryModel.colors.toList().toString();
    }
    if (searchQueryModel.sort != null && searchQueryModel.sort.isNotEmpty) {
      params['sort'] = searchQueryModel.sort;
    }
    if (searchQueryModel.sortBy != null && searchQueryModel.sortBy.isNotEmpty) {
      params['sort_by'] = searchQueryModel.sortBy;
    }
    if (searchQueryModel.countryCode != null &&
        searchQueryModel.countryCode.isNotEmpty) {
      params['country_code'] = searchQueryModel.countryCode;
    }
    if (Constants.getUserInfo2() != null &&
        Constants.getUserInfo2().data.userId != null &&
        Constants.getUserInfo2().data.apiKey != null) {
      params['user_id'] = Constants.getUserInfo2().data.userId;
      params['ApiKey'] = Constants.getUserInfo2().data.apiKey;
    }
    print(params['categories']);

    var response = await http.post(
      Uri.encodeFull(APIS.serverURL + APIS.SEARCH_API),
      body: params,
    );
    print(response.body);
    var decodedResponse = json.decode(response.body);
    print('response .. ${response.body}');
    SearchModel modelResponse = SearchModel.fromJson(decodedResponse);
    return modelResponse;
  }
}

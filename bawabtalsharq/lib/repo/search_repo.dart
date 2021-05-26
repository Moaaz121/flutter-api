import 'dart:convert';

import 'package:bawabtalsharq/Model/search_model.dart';
import 'package:bawabtalsharq/Model/search_quary.dart';
import 'package:bawabtalsharq/Utils/apis.dart';
import 'package:http/http.dart' as http;

class SearchRepo {
  Future<SearchModel> getSearch(SearchQueryModel searchQueryModel) async {
    Map<String, dynamic> params = {
      "search_text": searchQueryModel.q,
    };
    if (searchQueryModel.Categories != null) {
      params['categories'] = '[' + searchQueryModel.Categories[0] + ']';
    }
    if (searchQueryModel.page != null) {
      params['page'] = searchQueryModel.page;
    }
    if (searchQueryModel.gender != null) {
      params['gender'] = searchQueryModel.gender;
    }
    if (searchQueryModel.brand != null) {
      params['brand'] = searchQueryModel.brand;
    }
    if (searchQueryModel.sizes != null) {
      params['sizes'] = searchQueryModel.sizes;
    }
    if (searchQueryModel.colors != null) {
      params['colors'] = searchQueryModel.colors;
    }
    if (searchQueryModel.sort != null) {
      params['sort'] = searchQueryModel.sort;
    }
    if (searchQueryModel.sortBy != null) {
      params['sort_by'] = searchQueryModel.sortBy;
    }
    if (searchQueryModel.countryCode != null) {
      params['country_code'] = searchQueryModel.countryCode;
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

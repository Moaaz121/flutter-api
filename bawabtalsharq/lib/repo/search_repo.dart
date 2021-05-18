import 'dart:convert';

import 'package:bawabtalsharq/Model/search_model.dart';
import 'package:bawabtalsharq/Utils/apis.dart';
import 'package:bawabtalsharq/Utils/constants.dart';
import 'package:http/http.dart' as http;

class SearchRepo {
  Future<SearchModel> getSearch(String q,
      {String page, List<String> categories}) async {
    Map<String, dynamic> params = {
      "search_text": q,
    };
    if (categories != null) {
      params['categories'] = '[' + categories.first + ']';
    }
    if (page != null) {
      params['page'] = page;
    }
    var response = await http.post(
      Uri.encodeFull(
          APIS.serverURL + APIS.SEARCH_API + Constants.getLanguage()),
      body: params,
    );
    print(response.request);
    var decodedResponse = json.decode(response.body);
    print('response .. ${response.body}');
    SearchModel modelResponse = SearchModel.fromJson(decodedResponse);
    return modelResponse;
  }
}
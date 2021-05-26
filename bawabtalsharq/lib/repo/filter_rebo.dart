import 'dart:convert';

import 'package:bawabtalsharq/Model/filter_model.dart';
import 'package:bawabtalsharq/Utils/apis.dart';
import 'package:bawabtalsharq/Utils/constants.dart';
import 'package:http/http.dart' as http;

class FilterRepo {
  Future<FilterModel> getFilter() async {
    var response = await http.get(
      Uri.encodeFull(
          APIS.serverURL + APIS.FILTER_API + Constants.getLanguage()),
    );
    var decodedResponse = json.decode(response.body);
    FilterModel modelResponse = FilterModel.fromJson(decodedResponse);
    return modelResponse;
  }
}

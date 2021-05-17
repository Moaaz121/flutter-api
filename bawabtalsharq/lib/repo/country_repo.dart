import 'dart:convert';

import 'package:bawabtalsharq/Model/country_model.dart';
import 'package:bawabtalsharq/Utils/apis.dart';
import 'package:http/http.dart' as http;

class CountryRepo {
  Future<CountryModel> getCountry() async {
    var response = await http.get(
      Uri.encodeFull(APIS.serverURL + APIS.Country_API),
    );
    var decodedResponse = json.decode(response.body);

    CountryModel modelResponse = CountryModel.fromJson(decodedResponse);
    return modelResponse;
  }
}

import 'package:http/http.dart' as http;
import 'package:bawabtalsharq/Utils/apis.dart';
import 'package:bawabtalsharq/Utils/constants.dart';
import 'package:bawabtalsharq/Model/country_model.dart';
import 'dart:convert';

class CountriesRepo {
  Future<List<CountryData>> getCountries() async {
    var response = await http.get(
      Uri.encodeFull(
          APIS.serverURL + APIS.Country_API + Constants.getLanguage()),
    );
    if (response.statusCode == 200) {
      var decodedResponse = json.decode(response.body);

      CountryModel countries = CountryModel.fromJson(decodedResponse);

      return countries.data;
    } else
      return null;
  }
}

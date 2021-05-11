import 'dart:convert';

import 'package:bawabtalsharq/Model/currency_model.dart';
import 'package:bawabtalsharq/Utils/apis.dart';
import 'package:http/http.dart' as http;

class CurrencyRepo {
  Future<CurrencyModel> getCurrency() async {
    var response = await http.get(
      Uri.encodeFull(APIS.serverURL + APIS.Currency_API),
    );
    var decodedResponse = json.decode(response.body);
    // print('home response .. ${response.body}');
    CurrencyModel modelResponse = CurrencyModel.fromJson(decodedResponse);
    return modelResponse;
  }
}

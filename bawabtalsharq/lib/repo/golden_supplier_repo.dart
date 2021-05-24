import 'package:bawabtalsharq/Utils/constants.dart';
import 'package:bawabtalsharq/Model/golden_suppliers_model.dart';
import 'package:bawabtalsharq/Utils/apis.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class GoldenRepo {
  static Future<List<Suppliers>> getGoldenSuppliers() async {
    var response = await http.get(Uri.encodeFull(APIS.serverURL +
        APIS.GOLDEN_API +
        Constants.getLanguage() +
        Constants.getCurrency()));
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      List<Suppliers> returnData = GoldenSupplier.fromJson(data).suppliers;
      return returnData;
    } else
      throw Exception();
  }
}

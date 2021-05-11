import 'dart:convert';

import 'package:bawabtalsharq/Model/individualProduct_model.dart';
import 'package:bawabtalsharq/Utils/apis.dart';
import 'package:bawabtalsharq/Utils/constants.dart';
import 'package:http/http.dart' as http;

class IndividualProductRepo {
  static Future<ProductDetails> getIndividualProduct() async {
    var response = await http.post(Uri.encodeFull(
        APIS.serverURL + APIS.IndividualProduct_API + Constants.getLanguage()));
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      //print(data.toString());

      ProductDetails returnData = IndividualProductModel.fromJson(data).data;
      // print(data.toString());

      return returnData;
    } else {
      throw Exception();
    }
  }
}

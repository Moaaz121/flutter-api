import 'dart:convert';

import 'package:bawabtalsharq/Model/individualProduct_model.dart';
import 'package:bawabtalsharq/Utils/apis.dart';
import 'package:bawabtalsharq/Utils/constants.dart';
import 'package:http/http.dart' as http;

class IndividualProductRepo {
  static Future<ProductDetails> getIndividualProduct(String productId) async {
    Map<String, dynamic> params = {"product_id": productId};

    var response = await http.post(
      Uri.encodeFull(APIS.serverURL +
          APIS.IndividualProduct_API +
          Constants.getLanguage()),
      body: params,
    );

    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      //print(data.toString());

      ProductDetails returnData = IndividualProductModel.fromJson(data).data;

      return returnData;
    } else {
      throw Exception();
    }
  }
}

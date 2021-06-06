import 'dart:convert';

import 'package:bawabtalsharq/Model/base_model.dart';
import 'package:bawabtalsharq/Model/individualProduct_model.dart';
import 'package:bawabtalsharq/Utils/apis.dart';
import 'package:bawabtalsharq/Utils/constants.dart';
import 'package:http/http.dart' as http;

class IndividualProductRepo {
  static Future<IndividualProductModel> getIndividualProduct(
      String productId) async {
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

      IndividualProductModel returnData = IndividualProductModel.fromJson(data);

      return returnData;
    } else {
      throw Exception();
    }
  }

  static Future<BaseModel> saveHistory(
      String userId, String apiKey, String productId) async {
    Map<String, dynamic> params = {
      "user_id": userId,
      "ApiKey": apiKey,
      "product_id": productId
    };
    var response = await http.post(
      Uri.encodeFull(
          APIS.serverURL + APIS.ADD_HISTORY_API + Constants.getLanguage()),
      body: params,
    );
    if (response.statusCode == 200) {
      var decodedResponse = json.decode(response.body);
      BaseModel modelResponse = BaseModel.fromJson(decodedResponse);

      return modelResponse;
    }
  }
}

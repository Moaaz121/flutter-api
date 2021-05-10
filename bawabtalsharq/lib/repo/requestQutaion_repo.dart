import 'package:bawabtalsharq/Model/base_model.dart';
import 'package:bawabtalsharq/Utils/constants.dart';
import 'package:bawabtalsharq/Utils/apis.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class RequestQuotationsRepo {
  Future<String> postReqQuotation(Map<String, dynamic> data) async {
    BaseModel modelResponse;
    var response = await http.post(
      Uri.encodeFull(
          APIS.serverURL + APIS.Req_Quotation_API + Constants.getLanguage()),
      body: data,
    );
    if (response.statusCode == 200) {
      var decodedResponse = json.decode(response.body);
      modelResponse = BaseModel.fromJson(decodedResponse);
      print("Model Res: $modelResponse");
    }
    return modelResponse.msg;
  }
}

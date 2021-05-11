import 'package:bawabtalsharq/Model/base_model.dart';
import 'package:bawabtalsharq/Utils/apis.dart';
import 'package:bawabtalsharq/Utils/constants.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:bawabtalsharq/Utils/constants.dart';
import 'package:bawabtalsharq/Model/user_model.dart';

class RequestQuotationsRepo {
  Future<BaseModel> postReqQuotation(Map<String, dynamic> data) async {
    UserModel _userModel = await Constants.getUserInfo();

    data = {
      'ApiKey': _userModel.data.apiKey,
      'user_id': _userModel.data.userId
    };
    print('data In Repo: $data');

    BaseModel modelResponse;
    var response = await http.post(
      Uri.encodeFull(
          APIS.serverURL + APIS.Req_Quotation_API + Constants.getLanguage()),
      body: data,
    );
    if (response.statusCode == 200) {
      var decodedResponse = json.decode(response.body);
      BaseModel modelResponse = BaseModel.fromJson(decodedResponse);
      print("Model Res: $modelResponse");
    }
    return modelResponse;
  }
}

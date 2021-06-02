import 'package:bawabtalsharq/Model/base_model.dart';
import 'package:bawabtalsharq/Utils/apis.dart';
import 'package:bawabtalsharq/Utils/constants.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:bawabtalsharq/Model/user_model.dart';
import 'package:bawabtalsharq/Services/checkIntrernetConnectivity.dart';

class RequestQuotationsRepo {
  BaseModel modelResponse;
  InternetConnection connection = new InternetConnection();

  Future<String> postReqQuotation(Map<String, dynamic> data) async {
    UserModel _userModel = await Constants.getUserInfo();

    data['ApiKey'] = _userModel.data.apiKey;
    data['user_id'] = _userModel.data.userId;
    print('Data in Repo : $data');
    bool connected = await connection.isConnected();
    if (connected) {
      var response = await http.post(
        Uri.encodeFull(
            APIS.serverURL + APIS.Req_Quotation_API + Constants.getLanguage()),
        body: data,
      );
      if (response.statusCode == 200) {
        var decodedResponse = json.decode(response.body);
        BaseModel modelResponse = BaseModel.fromJson(decodedResponse);
        return modelResponse.msg;
      } else {
        return null;
      }
    } else {
      return 'Mobile is not Connected';
    }
  }
}

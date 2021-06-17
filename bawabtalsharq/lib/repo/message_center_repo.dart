import 'package:bawabtalsharq/Utils/apis.dart';
import 'package:bawabtalsharq/Utils/constants.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:bawabtalsharq/Model/MessageCenterModel.dart';
import 'package:bawabtalsharq/Model/user_model.dart';

class MessageCenterRepo {
  Map data = {};

  Future<List<Datum>> messageCenter() async {
    UserModel _userModel = await Constants.getUserInfo();

    data['ApiKey'] = _userModel.data.apiKey;
    data['user_id'] = _userModel.data.userId;
    print('data: $data');
    var response = await http.post(
      Uri.encodeFull(
          APIS.serverURL + APIS.Req_Quotation_API + Constants.getLanguage()),
      body: data,
    );
    if (response.statusCode == 200) {
      var decodedResponse = json.decode(response.body);

      MessageCenterModel messageCenterData =
          MessageCenterModel.fromJson(decodedResponse);
      return messageCenterData.data;
    } else {
      return null;
    }
  }
}

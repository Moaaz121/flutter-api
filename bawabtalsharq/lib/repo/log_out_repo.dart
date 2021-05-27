import 'dart:convert';

import 'package:bawabtalsharq/Model/LogOut_model.dart';
import 'package:bawabtalsharq/Utils/apis.dart';
import 'package:http/http.dart' as http;

class LogOutRepo {
  Future<LogOutModel> logOutApi() async {
    var response =
        await http.get(Uri.encodeFull(APIS.serverURL + APIS.LogOut_API));
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      LogOutModel returnData = LogOutModel.fromJson(data);
      print(returnData.toString());
      return returnData;
    } else
      throw Exception();
  }
}

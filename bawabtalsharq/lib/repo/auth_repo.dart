import 'dart:convert';

import 'package:bawabtalsharq/Model/user_model.dart';
import 'package:bawabtalsharq/Utils/apis.dart';
import 'package:http/http.dart' as http;

class AuthRepo {
  // start Bahaa //
  Future<UserModel> doLogin(String email, String password) async {
    Map<String, dynamic> params = {"email": email, "password": password};
    var response = await http.post(
      Uri.encodeFull(APIS.serverURL + APIS.LOGIN_API),
      body: params,
    );
    if (response.statusCode == 200) {
      var decodedResponse = json.decode(response.body);
      UserModel modelResponse = UserModel.fromJson(decodedResponse);

      return modelResponse;
    }
  }

  Future<UserModel> doRegister(String phone, String email, String password,
      String name, String userType) async {
    Map<String, dynamic> params = {
      "phone": phone,
      "email": email,
      "name": name,
      "password": password,
      "user_type": userType,
      "company": '',
      "website": '',
      "plan": '',
    };
    var response = await http.post(
      Uri.encodeFull(APIS.serverURL + APIS.REGISTER_API),
      body: params,
    );

    var decodedResponse = json.decode(response.body);
    print('login response .. ${response.body}');
    UserModel modelResponse = UserModel.fromJson(decodedResponse);
    return modelResponse;
  }
// End Bahaa //

// Start Asmaa //

// End Asmaa //
}

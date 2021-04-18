import 'dart:convert';
import 'package:bawabtalsharq/Model/user_model.dart';
import 'package:bawabtalsharq/Utils/apis.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LoginRepo {
  Future<UserModel> doLogin(String email, String password) async {
    Map<String, dynamic> params = {"email": email, "password": password};
    var response = await http.post(
      Uri.encodeFull(APIS.serverURL + APIS.LOGIN_API),
      body: params,
    );
    var decodedResponse = json.decode(response.body);
    print('login response .. ${response.body}');

    // SharedPreferences prefs = await SharedPreferences.getInstance();
    // prefs.setString('mobileNumber', mobileNumber);
    // prefs.setString('password', password);

    UserModel modelResponse = UserModel.fromJson(decodedResponse);

    return modelResponse;
  }
}

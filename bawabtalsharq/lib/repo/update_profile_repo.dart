import 'package:bawabtalsharq/Model/base_model.dart';
import 'package:bawabtalsharq/Utils/apis.dart';
import 'package:bawabtalsharq/Model/user_model.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class UpdateProfileRepo {
  Future<BaseModel> changePassword(String userId, String apiKey,
      String newPassword, String oldPassword) async {
    Map<String, dynamic> params = {
      "user_id": userId,
      "ApiKey": apiKey,
      "password": newPassword,
      "old_password": oldPassword,
    };
    var response = await http.post(
      Uri.encodeFull(APIS.serverURL + APIS.CHANGE_PASSWORD_API),
      body: params,
    );
    var decodedResponse = json.decode(response.body);
    print('Change Password response .. ${response.body}');
    BaseModel modelResponse = BaseModel.fromJson(decodedResponse);

    return modelResponse;
  }

  Future<BaseModel> updateAccount(
      String userId, String apiKey, String firstName, String lastName) async {
    Map<String, dynamic> params = {
      "user_id": userId,
      "ApiKey": apiKey,
      "firstname": firstName,
      "lastname": lastName,
    };
    var response = await http.post(
      Uri.encodeFull(APIS.serverURL + APIS.UPDATE_ACCOUNT_API),
      body: params,
    );
    var decodedResponse = json.decode(response.body);
    print('Update Profile response .. ${response.body}');
    BaseModel modelResponse = BaseModel.fromJson(decodedResponse);

    return modelResponse;
  }
}

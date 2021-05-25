import 'package:bawabtalsharq/Model/base_model.dart';
import 'package:bawabtalsharq/Utils/apis.dart';
import 'package:bawabtalsharq/Model/user_model.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
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

  Future<BaseModel> updateAccount(UserLocal currentUser) async {
    print(currentUser.country);
    Map<String, dynamic> params = {
      "user_id": currentUser.userId,
      "ApiKey": currentUser.apiKey,
      "firstname": currentUser.firstname,
      "lastname": currentUser.lastname,
      "phone": currentUser.phone,
      "b_country": currentUser.country != null ? currentUser.country : '',
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

  Future<String> refreshKey(String userId, String apiKey) async {
    Map<String, dynamic> params = {
      "user_id": userId,
      "ApiKey": apiKey,
    };
    var response = await http.post(
      Uri.encodeFull(APIS.serverURL + APIS.REFRESH_KEY_API),
      body: params,
    );
    var decodedResponse = json.decode(response.body);
    String userKey = UserModel.fromJson(decodedResponse).data.apiKey;

    return userKey;
  }
}

import 'dart:convert';
import 'dart:io';

import 'package:bawabtalsharq/Model/user_model.dart';
import 'package:bawabtalsharq/Utils/apis.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class UpdateProfileRepo {
  Future<UserModel> changePassword(String userId, String apiKey,
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
    UserModel modelResponse = UserModel.fromJson(decodedResponse);

    if (modelResponse.code == 200) {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('user', jsonEncode(modelResponse));
    }

    return modelResponse;
  }

  Future<UserModel> updateAccount(UserLocal currentUser, {File image}) async {
    var fileName = image.path.split('/').last;

    Map<String, dynamic> params = {
      "user_id": currentUser.userId,
      "ApiKey": currentUser.apiKey,
      "firstname": currentUser.firstname,
      "lastname": currentUser.lastname,
      "phone": currentUser.phone,
      "b_country": currentUser.country,
      "image": MultipartFile.fromString(image.path, filename: fileName),
    };

    print(image.path + ' : ' + fileName);

    FormData formData = new FormData.fromMap(params);

    var response = await Dio()
        .post(APIS.serverURL + APIS.UPDATE_ACCOUNT_API, data: formData);
    print('Update Profile response .. ${response.data}');

    // var response = await http.post(
    //   Uri.encodeFull(APIS.serverURL + APIS.UPDATE_ACCOUNT_API),
    //   body: formData,
    // );

    var decodedResponse = json.decode(response.toString());
    UserModel modelResponse = UserModel.fromJson(decodedResponse);

    if (modelResponse.code == 200) {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('user', jsonEncode(modelResponse));
    }

    return modelResponse;
  }

  Future<UserModel> refreshKey(String userId, String apiKey) async {
    Map<String, dynamic> params = {
      "user_id": userId,
      "ApiKey": apiKey,
    };
    var response = await http.post(
      Uri.encodeFull(APIS.serverURL + APIS.REFRESH_KEY_API),
      body: params,
    );
    var decodedResponse = json.decode(response.body);
    UserModel modelResponse = UserModel.fromJson(decodedResponse);

    if (modelResponse.code == 200) {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('user', jsonEncode(modelResponse));
    }

    return modelResponse;
  }
}

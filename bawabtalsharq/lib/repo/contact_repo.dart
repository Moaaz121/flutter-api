import 'dart:convert';

import 'package:bawabtalsharq/Model/base_model.dart';
import 'package:bawabtalsharq/Model/contactUs_model.dart';
import 'package:bawabtalsharq/Utils/apis.dart';
import 'package:bawabtalsharq/Utils/constants.dart';
import 'package:http/http.dart' as http;

class ContactRepo {
  Future<BaseModel> contactMessage(
    String email,
    String subject,
    String message,
  ) async {
    Map<String, dynamic> params = {
      "email": email,
      "subject": subject,
      "message": message,
    };
    var response = await http.post(
      Uri.encodeFull(APIS.serverURL + APIS.CONTACT_MESSAGE_API),
      body: params,
    );
    var decodedResponse = json.decode(response.body);
    print('Contact response .. ${response.body}');
    BaseModel modelResponse = BaseModel.fromJson(decodedResponse);
    return modelResponse;
  }

  Future<ContactModel> contactLocation() async {
    var response = await http.post(
      Uri.encodeFull(
          APIS.serverURL + APIS.CONTACT_LOCATION_API + Constants.getLanguage()),
    );

    var decodedResponse = json.decode(response.body);
    print('Contact response .. ${response.body}');
    ContactModel modelResponse = ContactModel.fromJson(decodedResponse);
    return modelResponse;
  }
}

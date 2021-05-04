import 'dart:convert';

import 'package:bawabtalsharq/Model/contactUs_model.dart';
import 'package:bawabtalsharq/Utils/apis.dart';
import 'package:bawabtalsharq/Utils/constants.dart';
import 'package:http/http.dart' as http;

class SettingRepo {
  static Future<Contact> getLocation() async {
    var response = await http.get(Uri.encodeFull(
        APIS.serverURL + APIS.CONTACTUs_API + Constants.getLanguage()));
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      Contact returnData = ContactModel.fromJson(data).contact;
      print(returnData.toString());

      return returnData;
    } else
      throw Exception();
  }
}

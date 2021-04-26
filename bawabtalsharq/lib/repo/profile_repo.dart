import 'package:bawabtalsharq/Utils/constants.dart';
import 'package:bawabtalsharq/Model/privacy_model.dart';
import 'package:bawabtalsharq/Model/aboutUs_model.dart';
import 'package:bawabtalsharq/Model/faq_model.dart';
import 'package:bawabtalsharq/Model/lang_model.dart';
import 'package:bawabtalsharq/Model/contactUs_model.dart';
import 'package:bawabtalsharq/Utils/apis.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ProfileRepo {
  static Future<List<PrivacyData>> getPrivacy() async {
    var response = await http.get(Uri.encodeFull(
        APIS.serverURL + APIS.PRIVACY_API + Constants.getLanguage()));
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      List<PrivacyData> returnData =
          PrivacyModel.fromJson(data).privacyData.toList();
      print(returnData.toString());

      return returnData;
    } else
      throw Exception();
  }

  static Future<List<AboutData>> getAbout() async {
    var response = await http.get(Uri.encodeFull(
        APIS.serverURL + APIS.ABOUTUs_API + Constants.getLanguage()));
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      List<AboutData> returnData = AboutModel.fromJson(data).aboutData.toList();
      print(returnData.toString());

      return returnData;
    } else
      throw Exception();
  }

  static Future<List<FaqData>> getFaq() async {
    var response = await http.get(Uri.encodeFull(
        APIS.serverURL + APIS.FAQ_API + Constants.getLanguage()));
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      List<FaqData> returnData = FaqModel.fromJson(data).faqData.toList();
      print(returnData.toString());

      return returnData;
    } else
      throw Exception();
  }

  static Future<List<LangData>> getLanguages() async {
    var response =
        await http.get(Uri.encodeFull(APIS.serverURL + APIS.Lang_API));
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      List<LangData> returnData = LangModel.fromJson(data).langData.toList();
      print(returnData.toString());

      return returnData;
    } else
      throw Exception();
  }

  static Future<Contact> getContact() async {
    var response =
        await http.get(Uri.encodeFull(APIS.serverURL + APIS.CONTACTUs_API));
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      Contact returnData = ContactModel.fromJson(data).contact;
      print(returnData.toString());

      return returnData;
    } else
      throw Exception();
  }
}

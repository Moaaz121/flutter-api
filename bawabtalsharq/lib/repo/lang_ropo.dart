import 'dart:convert';

import 'package:bawabtalsharq/Model/lang_model.dart';
import 'package:bawabtalsharq/Utils/apis.dart';
import 'package:http/http.dart' as http;

class LangRepo {
  Future<LangModel> getLang() async {
    var response = await http.get(
      Uri.encodeFull(APIS.serverURL + APIS.Lang_API),
    );
    var decodedResponse = json.decode(response.body);
    print('home response .. ${response.body}');
    LangModel modelResponse = LangModel.fromJson(decodedResponse);
    return modelResponse;
  }
}

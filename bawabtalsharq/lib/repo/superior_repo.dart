import 'dart:convert';

import 'package:bawabtalsharq/Model/superior_model.dart';
import 'package:bawabtalsharq/Utils/apis.dart';
import 'package:bawabtalsharq/Utils/constants.dart';
import 'package:http/http.dart' as http;

class SuperiorRepo {
  static Future<List<SuperiorData>> getSuperior() async {
    var response = await http.get(Uri.encodeFull(
        APIS.serverURL + APIS.Superior_API + Constants.getLanguage()));
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      //print(data.toString());

      List<SuperiorData> returnData = Superior.fromJson(data).data;
      // print(data.toString());

      return returnData;
    } else {
      throw Exception();
    }
  }
}

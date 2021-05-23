import 'dart:convert';

import 'package:bawabtalsharq/Model/home_model.dart';
import 'package:bawabtalsharq/Utils/apis.dart';
import 'package:http/http.dart' as http;

class HomeRepo {
  Future<HomeModel> getHome() async {
    var response = await http.get(
      Uri.encodeFull(APIS.serverURL + APIS.HOME_API),
    );
    var decodedResponse = json.decode(response.body);
    print('home response .. ${response.body}');
    HomeModel modelResponse = HomeModel.fromJson(decodedResponse);
    return modelResponse;
  }
}

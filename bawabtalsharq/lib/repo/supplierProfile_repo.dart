import 'dart:convert';

import 'package:bawabtalsharq/Model/supplier_model.dart';
import 'package:bawabtalsharq/Utils/apis.dart';
import 'package:bawabtalsharq/Utils/constants.dart';
import 'package:http/http.dart' as http;

class SupplierProfileRepo {
  static Future<SupplierProfileModel> getSupplierProfile(int supplierId) async {
    Map<String, dynamic> params = {"supplier_id": '1'};

    var response = await http.post(
      Uri.encodeFull(
          APIS.serverURL + APIS.SupplierProfile_API + Constants.getCurrency()),
      body: params,
    );

    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      // print('supplier' + data.toString());

      SupplierProfileModel returnData = SupplierProfileModel.fromJson(data);
      return returnData;
    } else {
      throw Exception();
    }
  }
}

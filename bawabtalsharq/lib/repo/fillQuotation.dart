import 'package:bawabtalsharq/Utils/apis.dart';
import 'package:bawabtalsharq/Utils/constants.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:bawabtalsharq/Model/fillQuotationModel.dart';

class FillQuotationRepo {
  Future<DataRQF> fillQuotation() async {
    var fillResponse = await http.get(
      Uri.encodeFull(
          APIS.serverURL + APIS.Fill_Quotation_API + Constants.getLanguage()),
    );

    if (fillResponse.statusCode == 200) {
      var decodedResponse = json.decode(fillResponse.body);

      FillQuotationModel fillQuotationModel =
          FillQuotationModel.fromJson(decodedResponse);
      return fillQuotationModel.data;
    } else {
      return null;
    }
  }
}

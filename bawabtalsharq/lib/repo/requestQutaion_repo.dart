import 'package:bawabtalsharq/Model/base_model.dart';
import 'package:bawabtalsharq/Utils/apis.dart';
import 'package:bawabtalsharq/Utils/constants.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:bawabtalsharq/Model/user_model.dart';
import 'package:bawabtalsharq/Services/checkIntrernetConnectivity.dart';
import 'package:http_parser/http_parser.dart';
import 'package:mime/mime.dart';
import 'package:numberpicker/numberpicker.dart';

class RequestQuotationsRepo {
  BaseModel modelResponse;
  InternetConnection connection = new InternetConnection();

  Future<String> postReqQuotation(Map<String, dynamic> data) async {
    UserModel _userModel = await Constants.getUserInfo();

    data['ApiKey'] = _userModel.data.apiKey;
    data['user_id'] = _userModel.data.userId;

    bool connected = await connection.isConnected();
    if (connected) {
      if (data['document'] != null) {
        print('sendFile');
        print('document:${data['document']}');
        sendFile(data['document'], data);
      } else {
        var response = await http.post(
          Uri.encodeFull(APIS.serverURL +
              APIS.Req_Quotation_API +
              Constants.getLanguage()),
          body: data,
        );
        if (response.statusCode == 200) {
          var decodedResponse = json.decode(response.body);
          BaseModel modelResponse = BaseModel.fromJson(decodedResponse);
          return modelResponse.msg;
        } else {
          return null;
        }
      }
    } else {
      return 'Mobile is not Connected';
    }
  }

  Future<dynamic> sendFile(String filePath, Map data) async {
    String name = DateTime.now().millisecondsSinceEpoch.toString();
    print('sendingFile');
    final mimeTypeData =
        lookupMimeType(filePath, headerBytes: [0xFF, 0xD8]).split('/');
    var request = http.MultipartRequest(
        'POST',
        Uri.parse(
            APIS.serverURL + APIS.Req_Quotation_API + Constants.getLanguage()));
    request.files.add(await http.MultipartFile.fromPath('file', filePath,
        filename: name,
        contentType: MediaType(mimeTypeData[0], mimeTypeData[1])));

    request.fields.addAll(data);
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      print('File Sent');

      print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
    }
  }
}

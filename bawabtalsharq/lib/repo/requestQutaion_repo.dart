import 'package:bawabtalsharq/Model/base_model.dart';
import 'package:bawabtalsharq/Utils/apis.dart';
import 'package:bawabtalsharq/Utils/constants.dart';
import 'package:bawabtalsharq/Model/user_model.dart';
import 'package:bawabtalsharq/Services/checkIntrernetConnectivity.dart';
import 'package:dio/dio.dart';
import 'package:flutter_absolute_path/flutter_absolute_path.dart';

class RequestQuotationsRepo {
  BaseModel modelResponse;
  InternetConnection connection = new InternetConnection();

  Future<String> postReqQuotation(
      Map<String, dynamic> data, Map<String, dynamic> dataIdentifier) async {
    UserModel _userModel = await Constants.getUserInfo();

    data['ApiKey'] = _userModel.data.apiKey;
    data['user_id'] = _userModel.data.userId;

    for (int i = 0; i < 3; i++) {
      if (data['document[$i]'] != 'null') {
        String path = await getPath(dataIdentifier['document[$i]']);
        data['document[$i]'] =
            MultipartFile.fromString(path, filename: data['document[$i]']);
      }
    }
    FormData formData = new FormData.fromMap(data);

    var response = await Dio().post(
        APIS.serverURL + APIS.Req_Quotation_API + Constants.getLanguage(),
        data: formData);
    print('RQF response .. ${response.statusCode}');
    print('RQF response .. ${response.data}');

    if (response.statusCode == 200) {
      BaseModel modelResponse = BaseModel.fromJson(response.data);
      return modelResponse.msg;
    } else {
      return null;
    }
  }

  Future<String> getPath(imageIdentifier) async {
    String path = await FlutterAbsolutePath.getAbsolutePath(imageIdentifier);
    return path;
  }
}

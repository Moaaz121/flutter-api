import 'dart:convert';

import 'package:bawabtalsharq/Model/notification_model.dart';
import 'package:bawabtalsharq/Model/user_model.dart';
import 'package:bawabtalsharq/Utils/apis.dart';
import 'package:bawabtalsharq/Utils/constants.dart';
import 'package:http/http.dart' as http;

class NotificationRepo {
  Future<NotificationsModel> getNotifications() async {
    User _user;
    await Constants.getUserInfo().then((value) => _user = value.data);

    Map<String, dynamic> params = {
      "user_id": '1',
      "ApiKey": '1621349819',
    };
    var response = await http.post(
      Uri.encodeFull(APIS.serverURL +
          APIS.NOTIFICATIONS_API +
          '&lang=' +
          Constants.getLanguage()),
      body: params,
    );
    var decodedResponse = json.decode(response.body);
    print('Contact response .. ${response.body}');
    NotificationsModel modelResponse =
        NotificationsModel.fromJson(decodedResponse);
    return modelResponse;
  }
}

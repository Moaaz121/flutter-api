import 'dart:convert';

import 'package:bawabtalsharq/Model/notification_model.dart';
import 'package:bawabtalsharq/Utils/apis.dart';
import 'package:bawabtalsharq/Utils/constants.dart';
import 'package:http/http.dart' as http;

class NotificationRepo {
  Future<NotificationsModel> getNotifications() async {
    Map<String, dynamic> params = {
      // "user_id": Constants.getUserInfo2().data.userId,
      // "ApiKey": Constants.getUserInfo2().data.apiKey,
      "user_id": '1',
      "ApiKey": '1621783066',
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

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:flutter/material.dart';

class AnalyticsService {
  final FirebaseAnalytics _analytics = new FirebaseAnalytics();
  FirebaseAnalyticsObserver getAnalyticsOberver() =>
      FirebaseAnalyticsObserver(analytics: _analytics);

  Future setUserProperties({@required String userId}) async {
    await _analytics.setUserId(userId);
  }

  Future setScreenName({@required String name}) async {
    await _analytics
        .setCurrentScreen(screenName: name)
        .then((value) => print('ScreenName is $name'));
  }

  Future<void> sendAnalyticsEvent(
      {@required String eventName,
      @required Map<String, dynamic> param}) async {
    //tested
    await _analytics
        .logEvent(
          name: eventName, // name that will be show in the debuge console
          parameters: param,

          //  <String, dynamic>{
          //   'id': 14524896,
          //   'name': 'Hello_in_Analytics',
          //   'bool': true,
          //   'screen': name
          // }
          // ,
        )
        .whenComplete(() => print('logEvent succeeded'))
        .catchError((e) => print('Error in LogEvent: $e'));
  }

  Future logging({@required String method}) async {
    await _analytics.logLogin(loginMethod: method);
  }
}

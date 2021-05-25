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

  setScreenName({@required String name}) async {
    await _analytics
        .setCurrentScreen(screenName: name)
        .then((value) => print('Name is $name'));
  }

  //  Navigator.of(context).push(MaterialPageRoute(
  //       builder: (context) => HomeView(),
  //       //this name will be in the frebase Analytics console
  //       settings: RouteSettings(name: 'HomeView'),
  //     ));
}

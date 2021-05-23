import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:flutter/material.dart';

class AnalyticsService {
  final FirebaseAnalytics _anylytics = new FirebaseAnalytics();
  FirebaseAnalyticsObserver getAnalyticsOberver() =>
      FirebaseAnalyticsObserver(analytics: _anylytics);

  Future setUserProperties({@required String userId}) async {
    await _anylytics.setUserId(userId);
  }

  setScreenName({@required String name}) async {
    await _anylytics
        .setCurrentScreen(screenName: name)
        .then((value) => print('Name is $name'));
  }

  //  Navigator.of(context).push(MaterialPageRoute(
  //       builder: (context) => HomeView(),
  //       //this name will be in the frebase Analytics console
  //       settings: RouteSettings(name: 'HomeView'),
  //     ));
}

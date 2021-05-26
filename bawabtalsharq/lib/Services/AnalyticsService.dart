import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:flutter/material.dart';

class AnalyticsService {
  final FirebaseAnalytics _analytics = new FirebaseAnalytics();
  FirebaseAnalyticsObserver getAnalyticsOberver() =>
      FirebaseAnalyticsObserver(analytics: _analytics);

  Future logLoggin({@required String method}) async {
    //tested
    await _analytics.logLogin(loginMethod: method);
  }

  Future<void> setUserId({@required String userId}) async {
    // will appear on the rigt side of the debug console as 'USER PROPERTIES ACTIVE NOW history'
    //Intialized Only Once to take the ID
    await _analytics.setUserId(userId);
    print('Set User Id: $userId');
  }

  Future<void> sendAnalyticsEvent(
      {@required String name, @required Map params}) async {
    await _analytics
        .logEvent(
          name: name, // name that will be show in the debuge console
          parameters: params,
        )
        .whenComplete(() => print('logEvent $name succeeded'))
        .catchError((e) => print('Error in LogEvent: $e'));
  }

  ///

  //Map paramas= {  'id': 14524896,
  // 'name': 'Hello_in_Analytics',
  // 'bool': true,
  // 'screen': name}
}

//  Navigator.of(context).push(MaterialPageRoute(
//       builder: (context) => HomeView(),
//       //this name will be in the frebase Analytics console
//       settings: RouteSettings(name: 'HomeView'),
//     ));

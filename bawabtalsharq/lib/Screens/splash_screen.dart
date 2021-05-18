import 'dart:async';

import 'package:bawabtalsharq/Utils/images.dart';
import 'package:bawabtalsharq/main.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:bawabtalsharq/Utils/constants.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer _timer;
  int t;
  bool onBoarding = Constants.getDate(key: 'onBoarding');

  startTime() async {
    var _duration = new Duration(seconds: 3);
    return new Timer(_duration, navigationPage);
  }

  void navigationPage() async {
    Navigator.pushReplacementNamed(context,
        onBoarding ? ScreenRoutes.mainScreen : ScreenRoutes.introScreen);
  }

  @override
  void initState() {
    if (onBoarding == null) onBoarding = false;
    super.initState();
    print(onBoarding);
    startTime();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(splashImage),
          fit: BoxFit.fill,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(logo),
          SizedBox(
            height: 20,
          ),
          Image.asset(companyName),
        ],
      ),
    );
  }
}

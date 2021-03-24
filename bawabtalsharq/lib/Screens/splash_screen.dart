import 'dart:async';

import 'package:bawabtalsharq/Utils/images.dart';
import 'package:bawabtalsharq/main.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer _timer;
  int t;

  startTime() async {
    var _duration = new Duration(seconds: 3);
    return new Timer(_duration, navigationPage);
  }

  void navigationPage() async {
    Navigator.pushReplacementNamed(context, ScreenRoutes.introScreen);
  }

  @override
  void initState() {
    super.initState();
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

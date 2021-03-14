import 'dart:async';

import 'package:bawabtalsharq/Utils/strings.dart';
import 'package:bawabtalsharq/Utils/styles.dart';
import 'package:flutter/material.dart';



class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => new _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer _timer;
  int t;

  startTime() async {
    var _duration = new Duration(seconds: 3);
    return new Timer(_duration, navigationPage);
  }

  void navigationPage() async {
    // Navigator.of(context)
    //     .pushReplacement(MaterialPageRoute(builder: (context) => LoginScreen()));
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
    return new Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Container(
            // decoration: BoxDecoration(
            //   image: DecorationImage(
            //       image: AssetImage(SplashBG), fit: BoxFit.cover),
            // ),
            // child: Center(
            //   child: Center(
            //     child: Image.asset(Icon_Logo),
            //   ),
            // ),
          ),
          Container(
            height: 100,
          ),
          Container(
            alignment: Alignment.bottomCenter,
            margin: EdgeInsets.only(bottom: 20),
            child: Text(
              Strings().appName(),
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: regularFontFamily,
                  color: Colors.white,
                  fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
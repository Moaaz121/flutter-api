import 'dart:async';

import 'package:bawabtalsharq/Utils/constants.dart';
import 'package:bawabtalsharq/Utils/images.dart';
import 'package:bawabtalsharq/main.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  VideoPlayerController _controller;
  Timer _timer;
  int t;
  bool onBoarding;

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
    _controller =
        VideoPlayerController.asset('assets/animation_gif/bawaba_1.mp4');
    _controller.play();
    _controller.setLooping(true);
    _controller.setVolume(0.0);
    _controller.play();

    if (Constants.getDate(key: 'onBoarding') == null)
      onBoarding = false;
    else
      onBoarding = true;
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
          SizedBox(
            width: _controller.value.size?.width ?? 0,
            height: _controller.value.size?.height ?? 0,
            child: VideoPlayer(_controller),
          ),
          // Image.asset(companyName),
        ],
      ),
    );
  }
}

import 'dart:async';

import 'package:bawabtalsharq/Utils/constants.dart';
import 'package:bawabtalsharq/main.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer _timer;
  int t;
  bool onBoarding;

  ChewieController chewieController;
  VideoPlayerController videoPlayerController =
      VideoPlayerController.asset('assets/animation_gif/bawaba_1.mp4');

  startTime(int time) async {
    var _duration = new Duration(milliseconds: time * 1000 + 150);
    return new Timer(_duration, navigationPage);
  }

  void navigationPage() async {
    if (videoPlayerController != null &&
        !videoPlayerController.value.isPlaying) {
      Navigator.pushReplacementNamed(context,
          onBoarding ? ScreenRoutes.mainScreen : ScreenRoutes.introScreen);
    } else {
      startTime(1);
    }
  }

  @override
  initState() {
    super.initState();
    if (Constants.getDate(key: 'onBoarding') == null)
      onBoarding = false;
    else
      onBoarding = true;
    print(onBoarding);
    startTime(4);
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    chewieController = ChewieController(
      allowFullScreen: true,
      showControls: false,
      aspectRatio: MediaQuery.of(context).size.width /
          MediaQuery.of(context).size.height,
      videoPlayerController: videoPlayerController,
      autoPlay: true,
      looping: false,
    );
    return Expanded(
      child: Chewie(
        controller: chewieController,
      ),
    );
  }
}

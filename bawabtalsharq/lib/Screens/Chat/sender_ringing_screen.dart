import 'dart:async';

import 'package:bawabtalsharq/Model/chat/partner_model.dart';
import 'package:bawabtalsharq/Repos/ChatRepos/chat_sound.dart';
import 'package:bawabtalsharq/Utils/images.dart';
import 'package:bawabtalsharq/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class SenderRingingScreen extends StatefulWidget {
  final PartnerData partnerData;
  final bool isVideo;
  final String roomID;
  SenderRingingScreen(this.partnerData, this.isVideo, this.roomID);
  @override
  _SenderRingingScreenState createState() => _SenderRingingScreenState();
}

class _SenderRingingScreenState extends State<SenderRingingScreen> {
  @override
  void initState() {
    super.initState();
    startTime();
    ChatSound.instance.playRingTone(true);
  }

  startTime() async {
    var _duration = new Duration(seconds: 4);
    return new Timer(_duration, close);
  }

  void close() async {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      Navigator.pop(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(splashImage), fit: BoxFit.fill),
          ),
          child: Stack(
            children: [
              callInfo(
                  context, widget.isVideo, widget.partnerData.user.name, true),
              answerButtons(),
            ],
          ),
        ),
      ),
    );
  }

  Positioned answerButtons() {
    return Positioned(
      bottom: 100,
      right: 60,
      left: 60,
      child: Center(
        child: RawMaterialButton(
          onPressed: () {
            ChatSound.instance.stopRingTone();
            SchedulerBinding.instance.addPostFrameCallback((_) {
              Navigator.pop(context);
            });
          },
          fillColor: Colors.white,
          elevation: 2,
          child: Icon(
            Icons.call_end,
            color: Colors.red,
            size: 40,
          ),
          padding: EdgeInsets.all(20.0),
          shape: CircleBorder(),
        ),
      ),
    );
  }
}

import 'package:bawabtalsharq/Model/chat/partner_model.dart';
import 'package:bawabtalsharq/Repos/ChatRepos/jitsi_config.dart';
import 'package:bawabtalsharq/Utils/Localization/Language/Languages.dart';
import 'package:bawabtalsharq/Utils/images.dart';
import 'package:bawabtalsharq/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';

class RingingScreen extends StatefulWidget {
  final PartnerData partnerData;
  final bool isVideo;
  final String roomID;
  RingingScreen(this.partnerData, this.isVideo, this.roomID);
  @override
  _RingingScreenState createState() => _RingingScreenState();
}

class _RingingScreenState extends State<RingingScreen> {
  @override
  void initState() {
    super.initState();
    playRingTone();
  }

  @override
  void dispose() {
    // stopRingTone();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        SchedulerBinding.instance.addPostFrameCallback((_) {
          Navigator.pop(context);
        });
        return true;
      },
      child: Scaffold(
        body: Center(
          child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(splashImage), fit: BoxFit.fill),
              ),
              child: Stack(
                children: [
                  callInfo(),
                  answerButtons(),
                ],
              )),
        ),
      ),
    );
  }

  Widget callInfo() {
    return Container(
      margin: EdgeInsets.only(top: 100),
      child: Column(
        children: [
          Center(
            child: buildText(
                widget.isVideo
                    ? Languages.of(context).incomingVideoCall
                    : Languages.of(context).incomingCall,
                18.0,
                color: Colors.black,
                fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: 50,
          ),
          Center(
            child: buildText(widget.partnerData.user.name, 30.0,
                color: Colors.black, fontWeight: FontWeight.w800),
          ),
        ],
      ),
    );
  }

  Positioned answerButtons() {
    return Positioned(
      bottom: 100,
      right: 60,
      left: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          RawMaterialButton(
            onPressed: () {
              stopRingTone();
              JitsiConfig.instance.joinMeeting(
                  context, widget.isVideo, widget.roomID, widget.partnerData);
            },
            fillColor: Colors.white,
            elevation: 2,
            child: Icon(
              Icons.call,
              color: Colors.green,
              size: 40,
            ),
            padding: EdgeInsets.all(20.0),
            shape: CircleBorder(),
          ),
          RawMaterialButton(
            onPressed: () {
              stopRingTone();
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
        ],
      ),
    );
  }

  void playRingTone() {
    FlutterRingtonePlayer.play(
      android: AndroidSounds.ringtone,
      ios: IosSounds.horn,
      looping: true, // Android only - API >= 28
      volume: 0.1, // Android only - API >= 28
      asAlarm: false, // Android only - all APIs
    );
  }

  void stopRingTone() {
    FlutterRingtonePlayer.stop();
  }
}

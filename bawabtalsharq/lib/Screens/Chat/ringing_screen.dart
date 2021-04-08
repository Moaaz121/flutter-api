import 'package:bawabtalsharq/Model/chat/partner_model.dart';
import 'package:bawabtalsharq/Utils/Localization/Language/Languages.dart';
import 'package:bawabtalsharq/Utils/images.dart';
import 'package:bawabtalsharq/widgets/widgets.dart';
import 'package:flutter/material.dart';

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
                callInfo(),
                answerButtons(),
              ],
            )),
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
            onPressed: () {},
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
            onPressed: () {},
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
}

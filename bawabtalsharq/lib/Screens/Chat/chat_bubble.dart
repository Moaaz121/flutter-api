import 'dart:async';

import 'package:bawabtalsharq/Model/chat/partner_model.dart';
import 'package:bawabtalsharq/Utils/constants.dart';
import 'package:bawabtalsharq/Utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:intl/intl.dart';
import 'package:rocket_chat_connector_flutter/models/message.dart';

class ChatBubble extends StatefulWidget {
  final Message message;
  final bool isMe;
  final String roomID;
  final PartnerData partnerData;
  final Key key;

  ChatBubble(
      {@required this.message,
      @required this.isMe,
      @required this.partnerData,
      @required this.roomID,
      this.key});

  String currentUserId;
  var document;
  FlutterSound flutterSound = FlutterSound();
  int index;
  List listMessage;

  @override
  _ChatBubbleState createState() => _ChatBubbleState();
}

class _ChatBubbleState extends State<ChatBubble> {
  List colors = Colors.primaries;
  double maxDuration = 1.0;
  String playerTxt = '00:00:00';
  double sliderCurrentPosition = 0.0;
  StreamSubscription _playerSubscription;

  Color chatBubbleColor() {
    if (widget.isMe) {
      return defaultOrangeColor;
    } else {
      return Color(0xFFF5F5F5);
    }
  }

  @override
  Widget build(BuildContext context) {
    final align =
        widget.isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start;
    final radius = widget.isMe
        ? BorderRadius.only(
            topLeft: Radius.circular(5.0),
            bottomLeft: Radius.circular(5.0),
            bottomRight: Radius.circular(10.0),
          )
        : BorderRadius.only(
            topRight: Radius.circular(5.0),
            bottomLeft: Radius.circular(10.0),
            bottomRight: Radius.circular(5.0),
          );
    return Column(
      crossAxisAlignment: align,
      children: <Widget>[
        Container(
          margin: const EdgeInsets.all(3.0),
          padding: const EdgeInsets.all(5.0),
          decoration: BoxDecoration(
            color: widget.message.msg.isNotEmpty
                ? chatBubbleColor()
                : Colors.grey[200],
            borderRadius: radius,
          ),
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width / 1.3,
            minWidth: 20.0,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(),
              widget.isMe ? SizedBox() : SizedBox(height: 5),
              SizedBox(width: 2.0),
              SizedBox(),
              Padding(
                padding: EdgeInsets.all(widget.message.msg.isNotEmpty ? 5 : 0),
                child: widget.message.msg.isNotEmpty
                    ? buildTextMessage()
                    : (widget.message.attachments.first.title == 'RECORD'
                        ? _voiceContainer(
                            widget.message.attachments.first.titleLink,
                            widget.message.attachments.first.title)
                        : SizedBox()),
                // :  AjanuwImage(
                //     image: AjanuwNetworkImage(APIS.chatBaseURL +
                //         widget.message.attachments.first.titleLink),
                //     fit: BoxFit.cover,
                //     loadingWidget: AjanuwImage.defaultLoadingWidget,
                //     loadingBuilder: AjanuwImage.defaultLoadingBuilder,
                //     errorBuilder: AjanuwImage.defaultErrorBuilder,
                //     color: orangeColor,
                //   ),
              ),
            ],
          ),
        ),
        Padding(
          padding: widget.isMe
              ? EdgeInsets.only(right: 10, bottom: 10.0)
              : EdgeInsets.only(left: 10, bottom: 10.0),
          child: Text(
            widget.message.ts.toString(),
            style: TextStyle(
              color: Theme.of(context).textTheme.headline6.color,
              fontSize: 10.0,
            ),
          ),
        ),
      ],
    );
  }

  Widget buildTextMessage() {
    var splitedMessage = widget.message.msg.split('_');
    String messageTxt = '';
    if (splitedMessage[0] == audioCall) {
      messageTxt = 'Audio call';
    } else if (splitedMessage[0] == videoCall) {
      messageTxt = 'Video call';
    } else {
      messageTxt = widget.message.msg;
    }
    return Text(
      messageTxt,
      style: TextStyle(
        color: widget.isMe ? Colors.white : Colors.orange,
      ),
    );
  }

  _voiceContainer(String voiceUrl, String recorderTime) {
    return Container(
      // width: MediaQuery.of(context).size.width * 0.55,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: textColor,
      ),
      child: Row(
        children: <Widget>[
          IconButton(
              icon: Icon(
                widget.flutterSound.audioState == t_AUDIO_STATE.IS_PLAYING
                    ? Icons.stop
                    : Icons.play_arrow,
                color: Colors.white,
                size: 35.0,
              ),
              onPressed: () => onStartPlayerPressed(voiceUrl)),
          Container(
              child: SliderTheme(
            data: SliderTheme.of(context).copyWith(
              activeTrackColor: orangeColor,
              inactiveTrackColor: Colors.grey,
              thumbColor: orangeColor,
              thumbShape: RoundSliderThumbShape(
                enabledThumbRadius: 7.0,
              ),
            ),
            child: Container(
              width: 200.0,
              child: Column(
                children: <Widget>[
                  Slider(
                      value: sliderCurrentPosition,
                      // inactiveColor: thirdColor,
                      // activeColor: primaryColor,
                      max: maxDuration,
                      onChanged: (double value) => seekToPlayer(value.toInt()),
                      divisions: maxDuration.toInt()),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          '$playerTxt',
                          style: TextStyle(color: orangeColor),
                        ),
                        Text(
                          '$recorderTime',
                          style: TextStyle(color: orangeColor),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 5.0,
                  )
                ],
              ),
            ),
          )),
        ],
      ),
    );
  }

  void startPlayer(String recordUrl) async {
    try {
      String path =
          await widget.flutterSound.startPlayer(recordUrl); // From file

      if (path == null) {
        print('Error starting player');
        return;
      }
      print('startPlayer: $path');
      await widget.flutterSound.setVolume(1.0);

      _playerSubscription =
          widget.flutterSound.onPlayerStateChanged.listen((e) {
        if (e != null) {
          sliderCurrentPosition = e.currentPosition;
          maxDuration = e.duration;

          DateTime date = new DateTime.fromMillisecondsSinceEpoch(
              e.currentPosition.toInt(),
              isUtc: true);
          String txt = DateFormat('mm:ss:SS', 'en_GB').format(date);
          this.setState(() {
            this.playerTxt = txt.substring(0, 8);
          });
        }
      });
    } catch (err) {
      print('error: $err');
    }
    // setState(() {});
  }

  void stopPlayer() async {
    try {
      String result = await widget.flutterSound.stopPlayer();
      print('stopPlayer: $result');
      if (_playerSubscription != null) {
        _playerSubscription.cancel();
        _playerSubscription = null;
      }
      this.setState(() {
        sliderCurrentPosition = 0.0;
      });
    } catch (err) {
      print('error: $err');
    }
  }

  void pausePlayer() async {
    String result;
    try {
      if (widget.flutterSound.audioState == t_AUDIO_STATE.IS_PAUSED) {
        result = await widget.flutterSound.resumePlayer();
        print('resumePlayer: $result');
      } else {
        result = await widget.flutterSound.pausePlayer();
        print('pausePlayer: $result');
      }
    } catch (err) {
      print('error: $err');
    }
    setState(() {});
  }

  void seekToPlayer(int milliSecs) async {
    if (widget.flutterSound.audioState == t_AUDIO_STATE.IS_PLAYING) {
      await widget.flutterSound.seekToPlayer(milliSecs);
      // print('seekToPlayer: $result');
    }
  }

  onPausePlayerPressed() {
    return widget.flutterSound.audioState == t_AUDIO_STATE.IS_PLAYING ||
            widget.flutterSound.audioState == t_AUDIO_STATE.IS_PAUSED
        ? pausePlayer()
        : null;
  }

  onStopPlayerPressed() {
    return widget.flutterSound.audioState == t_AUDIO_STATE.IS_PLAYING ||
            widget.flutterSound.audioState == t_AUDIO_STATE.IS_PAUSED
        ? stopPlayer()
        : null;
  }

  onStartPlayerPressed(String voiceUrl) {
    if (voiceUrl == null) return null;
    return widget.flutterSound.audioState == t_AUDIO_STATE.IS_STOPPED
        ? startPlayer(voiceUrl)
        : pausePlayer();
  }
}

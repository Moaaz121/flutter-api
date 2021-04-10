import 'package:bawabtalsharq/Model/chat/partner_model.dart';
import 'package:bawabtalsharq/Repos/ChatRepos/jitsi_config.dart';
import 'package:bawabtalsharq/Utils/apis.dart';
import 'package:bawabtalsharq/Utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_imagenetwork/flutter_imagenetwork.dart';
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

  @override
  _ChatBubbleState createState() => _ChatBubbleState();
}

class _ChatBubbleState extends State<ChatBubble> {
  JitsiConfig _jitsiConfig = JitsiConfig();
  List colors = Colors.primaries;

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
                  padding:
                      EdgeInsets.all(widget.message.msg.isNotEmpty ? 5 : 0),
                  child: widget.message.msg.isNotEmpty
                      ? Text(
                          widget.message.msg,
                          style: TextStyle(
                            color: widget.isMe ? Colors.white : Colors.orange,
                          ),
                        )
                      : AjanuwImage(
                          image: AjanuwNetworkImage(APIS.chatBaseURL +
                              widget.message.attachments.first.titleLink),
                          fit: BoxFit.cover,
                          loadingWidget: AjanuwImage.defaultLoadingWidget,
                          loadingBuilder: AjanuwImage.defaultLoadingBuilder,
                          errorBuilder: AjanuwImage.defaultErrorBuilder,
                          color: orangeColor,
                        )),
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

  // Widget socketMessage() {
  //   String messageTxt = '';
  //   if (widget.message.msg == audioCall) {
  //     messageTxt = 'Audio call';
  //     _jitsiConfig.joinMeeting(
  //         context, false, widget.roomID, widget.partnerData);
  //   } else if (widget.message.msg == videoCall) {
  //     messageTxt = 'Video call';
  //     _jitsiConfig.joinMeeting(
  //         context, true, widget.roomID, widget.partnerData);
  //   } else {
  //     messageTxt = widget.message.msg;
  //   }
  //   return Text(
  //     messageTxt,
  //     style: TextStyle(
  //       color: widget.isMe ? Colors.white : Colors.orange,
  //     ),
  //   );
  // }
}

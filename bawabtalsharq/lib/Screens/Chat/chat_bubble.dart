import 'package:bawabtalsharq/Utils/images.dart';
import 'package:bawabtalsharq/Utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:rocket_chat_connector_flutter/models/message.dart';

class ChatBubble extends StatefulWidget {
  final Message message;
  final bool isMe;

  ChatBubble({@required this.message, @required this.isMe});

  @override
  _ChatBubbleState createState() => _ChatBubbleState();
}

class _ChatBubbleState extends State<ChatBubble> {
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
                padding: EdgeInsets.all(widget.message.msg.isNotEmpty ? 5 : 0),
                child: widget.message.msg.isNotEmpty
                    ? Text(
                        widget.message.msg,
                        style: TextStyle(
                          color: widget.isMe ? Colors.white : Colors.orange,
                        ),
                      )
                    : Image.asset(
                        logo,
                        height: 130,
                        width: MediaQuery.of(context).size.width / 1.3,
                        fit: BoxFit.cover,
                      ),
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
}

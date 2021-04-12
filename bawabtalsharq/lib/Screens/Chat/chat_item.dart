import 'package:bawabtalsharq/Model/chat/partner_model.dart';
import 'package:bawabtalsharq/Model/chat/room_model.dart';
import 'package:bawabtalsharq/Repos/ChatRepos/chat_repo.dart';
import 'package:bawabtalsharq/Screens/Chat/conversation_screen.dart';
import 'package:bawabtalsharq/Utils/styles.dart';
import 'package:bawabtalsharq/main.dart';
import 'package:flutter/material.dart';

class ChatItem extends StatefulWidget {
  final Im chatMessage;
  final int counter = 1;
  ChatItem(this.chatMessage);

  @override
  _ChatItemState createState() => _ChatItemState();
}

class _ChatItemState extends State<ChatItem> {
  PartnerData partner = PartnerData();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<PartnerData>(
        future: RocketChatApi().getPartnerData(getUPartnerID()),
        builder: (context, AsyncSnapshot<PartnerData> snapshot) {
          if (snapshot.hasData) {
            partner = snapshot.data;
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: ListTile(
                contentPadding: EdgeInsets.all(0),
                leading: Stack(
                  children: <Widget>[
                    CircleAvatar(
                      backgroundImage: NetworkImage(
                        "http://www.gstatic.com/tv/thumb/persons/171234/171234_v9_bc.jpg",
                      ),
                      radius: 25,
                    ),
                    Positioned(
                      bottom: 0.0,
                      left: 6.0,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        height: 11,
                        width: 11,
                        child: Center(
                          child: Container(
                            decoration: BoxDecoration(
                              color: partner.user.status == 'online'
                                  ? Colors.greenAccent
                                  : Colors.grey,
                              borderRadius: BorderRadius.circular(6),
                            ),
                            height: 7,
                            width: 7,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                title: Text(
                  partner.user.name,
                  maxLines: 1,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  "${widget.chatMessage.lastMessage.msg}",
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
                trailing: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    SizedBox(height: 10),
                    Text(
                      "${widget.chatMessage.lastMessage.ts}",
                      style: TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: 11,
                      ),
                    ),
                    SizedBox(height: 5),
                    widget.counter == 0
                        ? SizedBox()
                        : Container(
                            padding: EdgeInsets.all(1),
                            decoration: BoxDecoration(
                              color: defaultOrangeColor,
                              borderRadius: BorderRadius.circular(6),
                            ),
                            constraints: BoxConstraints(
                              minWidth: 11,
                              minHeight: 11,
                            ),
                            child: Padding(
                              padding:
                                  EdgeInsets.only(top: 1, left: 5, right: 5),
                              child: Text(
                                "${1}",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 10,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                  ],
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            ConversationScreen(widget.chatMessage.id, partner),
                        settings: RouteSettings(
                            name: ScreenRoutes.conversationScreen)),
                  );
                },
              ),
            );
          } else {
            return Container();
          }
        });
  }

  String getUPartnerID() {
    return widget.chatMessage.uids
        .where((user) => user != rocketUser.data.me.id)
        .first;
  }
}

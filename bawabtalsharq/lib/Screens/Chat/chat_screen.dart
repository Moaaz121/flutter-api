import 'package:bawabtalsharq/Model/chat_model.dart';
import 'package:bawabtalsharq/Utils/Localization/Language/Languages.dart';
import 'package:bawabtalsharq/Utils/styles.dart';
import 'package:bawabtalsharq/widgets/widgets.dart';
import 'package:flutter/material.dart';

import 'chat_item.dart';

class ChatsScreen extends StatefulWidget {
  @override
  _ChatsScreenState createState() => _ChatsScreenState();
}

class _ChatsScreenState extends State<ChatsScreen> {
  bool _isSearchPressed = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarBuilder(
        titleWidget: _isSearchPressed
            ? TextField(
                decoration: InputDecoration.collapsed(
                  hintText: 'Search',
                ),
              )
            : buildText(Languages.of(context).chats, 18.0,
                fontFamily: boldFontFamily,
                color: Colors.white,
                fontWeight: FontWeight.bold),
        onBackPressed: () {
          Navigator.pop(context);
        },
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                _isSearchPressed = !_isSearchPressed;
              });
            },
            icon: Icon(
              Icons.search,
              size: 25,
              color: Colors.white,
            ),
          ),
          SizedBox(
            width: 10,
          ),
        ],
      ),
      body: ListView.separated(
        padding: EdgeInsets.all(10),
        separatorBuilder: (BuildContext context, int index) {
          return Align(
            alignment: Alignment.centerRight,
            child: Container(
              height: 0.5,
              width: MediaQuery.of(context).size.width / 1.3,
              child: Divider(),
            ),
          );
        },
        itemCount: chats.length,
        itemBuilder: (BuildContext context, int index) {
          Map chat = chats[index];
          return ChatItem(
            dp: chat['dp'],
            name: chat['name'],
            isOnline: chat['isOnline'],
            counter: chat['counter'],
            msg: chat['msg'],
            time: chat['time'],
          );
        },
      ),
    );
  }

  //start Asmaa

//end Asmaa

//start Karem

//end Karem
}

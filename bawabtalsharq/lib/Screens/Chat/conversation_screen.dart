import 'dart:io';
import 'dart:math';

import 'package:bawabtalsharq/Repos/ChatRepos/chat_repo.dart';
import 'package:bawabtalsharq/Repos/ChatRepos/socket_chat.dart';
import 'package:bawabtalsharq/Screens/Chat/chat_bubble.dart';
import 'package:bawabtalsharq/Utils/Localization/Language/Languages.dart';
import 'package:bawabtalsharq/Utils/Localization/LanguageHelper.dart';
import 'package:bawabtalsharq/Utils/images.dart';
import 'package:bawabtalsharq/Utils/styles.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
//import 'package:image_pickers/image_pickers.dart';
import 'package:rocket_chat_connector_flutter/models/message.dart';

class ConversationScreen extends StatefulWidget {
  final String roomID;
  ConversationScreen(this.roomID);

  @override
  _ConversationScreenState createState() => _ConversationScreenState();
}

class _ConversationScreenState extends State<ConversationScreen>
    with TickerProviderStateMixin {
  AnimationController _animationController;
  TextEditingController _textEditingController = TextEditingController();

  SocketChat _socketChat = SocketChat();
  File _image;
  final picker = ImagePicker();
  FilePickerResult resultFile;
  List<Message> _messages;

  static const List<IconData> icons = const [
    Icons.insert_drive_file_rounded,
    Icons.videocam_rounded,
    Icons.image_rounded,
    Icons.camera_alt_rounded,
  ];

  @override
  void initState() {
    super.initState();
    _socketChat.connectToSocket(widget.roomID);
    _animationController = new AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: RocketChatApi().getRoomMessages(widget.roomID),
        builder: (context, AsyncSnapshot<List<Message>> snapshot) {
          if (snapshot.hasData) {
            _messages = snapshot.data;
            return buildScaffold();
          } else {
            return Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        });
  }

  Scaffold buildScaffold() {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: new List.generate(icons.length, (int index) {
          Widget child = new Container(
            height: 55.0,
            width: 56.0,
            alignment: FractionalOffset.topCenter,
            child: new ScaleTransition(
              scale: new CurvedAnimation(
                parent: _animationController,
                curve: new Interval(0.0, 1.0 - index / icons.length / 2.0,
                    curve: Curves.linear),
              ),
              child: new FloatingActionButton(
                mini: true,
                backgroundColor: backgroundColor,
                heroTag: 'btn$index',
                child: new Icon(icons[index], color: orangeColor),
                onPressed: () {
                  switch (index) {
                    case 0:
                      getFile();
                      break;
                    case 1:
                      getVideo();
                      break;
                    case 2:
//  getImage(roomID);
                      break;
                    case 3:
                      getCamera();
                      break;
                  }
                },
              ),
            ),
          );
          return child;
        }).toList()
          ..add(
            SizedBox(
              width: 40,
              height: 40,
              child: new FloatingActionButton(
                backgroundColor: Colors.white,
                elevation: 0,
                highlightElevation: 0,
                focusElevation: 0,
                hoverElevation: 0,
                heroTag: 'btn',
                child: new AnimatedBuilder(
                  animation: _animationController,
                  builder: (BuildContext context, Widget child) {
                    return new Transform(
                      transform: new Matrix4.rotationZ(
                          _animationController.value * 0.5 * pi),
                      alignment: FractionalOffset.center,
                      child: new Icon(
                        _animationController.isDismissed
                            ? Icons.attach_file_rounded
                            : Icons.close,
                        color: orangeColor,
                      ),
                    );
                  },
                ),
                onPressed: () {
                  if (_animationController.isDismissed) {
                    _animationController.forward();
                  } else {
                    _animationController.reverse();
                  }
                },
              ),
            ),
          ),
      ),
      appBar: AppBar(
        backgroundColor: defaultOrangeColor,
        elevation: 3,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: CircleAvatar(
            radius: 12,
            backgroundColor: Colors.white,
            child: Icon(
              LanguageHelper.isEnglish
                  ? Icons.keyboard_arrow_left_outlined
                  : Icons.keyboard_arrow_right_outlined,
              size: 20,
              color: defaultOrangeColor,
            ),
          ),
        ),
        titleSpacing: 0,
        title: InkWell(
          child: Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: 0.0, right: 10.0),
                child: CircleAvatar(
                  backgroundImage: AssetImage(
                    profile_image,
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Asmaa',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                    SizedBox(height: 5),
                    Visibility(
                      visible: true,
                      child: Text(
                        Languages.of(context).online,
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 11,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          onTap: () {},
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.call,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(
              Icons.videocam,
            ),
            onPressed: () {},
          ),
          SizedBox(
            width: 10,
          ),
        ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: <Widget>[
            Flexible(
              child: ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 10),
                itemCount: _messages.length,
                reverse: true,
                itemBuilder: (BuildContext context, int index) {
                  return ChatBubble(
                      message: _messages[index],
                      isMe: checkMessageSender(index));
                },
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: BottomAppBar(
                elevation: 10,
                color: Colors.white,
                child: Container(
                  constraints: BoxConstraints(
                    maxHeight: 100,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                          width: 50,
                        ),
                        Flexible(
                          child: TextField(
                            controller: _textEditingController,
                            style: TextStyle(
                              fontSize: 15.0,
                              color:
                                  Theme.of(context).textTheme.headline6.color,
                            ),
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(10.0),
                              border: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              hintText: "Write your message...",
                              hintStyle: TextStyle(
                                fontSize: 15.0,
                                color:
                                    Theme.of(context).textTheme.headline6.color,
                              ),
                            ),
                            maxLines: null,
                          ),
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.send,
                            color: defaultOrangeColor,
                          ),
                          onPressed: () {
                            sendMessage();
                          },
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  bool checkMessageSender(int index) {
    return _messages[index].user.id == rocketUser.data.userId;
  }
  // Future getImage() async {
  //   List<Media> _listImagePaths = await ImagePickers.pickerPaths(
  //       galleryMode: GalleryMode.image,
  //       selectCount: 1,
  //       showGif: false,
  //       showCamera: true,
  //       compressSize: 500,
  //       uiConfig: UIConfig(uiThemeColor: orangeColor),
  //       cropConfig: CropConfig(enableCrop: false, width: 2, height: 1));
  //   if (_listImagePaths.first != null) {
  //     RocketChatApi().sendFile(widget.roomID, _listImagePaths.first.path);
  //   }
  // }

  Future getCamera() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);
    setState(() {
      if (pickedFile != null) {
        RocketChatApi().sendFile(widget.roomID, pickedFile.path);
      } else {}
    });
  }

  Future getVideo() async {
    final pickedFile = await picker.getVideo(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        RocketChatApi().sendFile(widget.roomID, pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  Future getFile() async {
    resultFile = await FilePicker.platform.pickFiles(allowMultiple: false);
    FilePickerResult result = await FilePicker.platform.pickFiles();
    if (result != null) {
      // File file = File(result.files.single.path);
      RocketChatApi()
          .sendFile(widget.roomID, File(result.files.single.path).path);
    } else {
      // User canceled the picker0
    }
  }

  void sendMessage() {
    if (_textEditingController.text.isNotEmpty) {
      _socketChat.sendMessage(widget.roomID, _textEditingController.text);
      _textEditingController.text = '';
    }
  }
}

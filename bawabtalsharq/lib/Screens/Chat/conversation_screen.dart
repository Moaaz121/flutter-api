import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:math';

//import 'package:audio_recorder/audio_recorder.dart';
import 'package:bawabtalsharq/Model/chat/partner_model.dart';
import 'package:bawabtalsharq/Model/chat/socket_message.dart';
import 'package:bawabtalsharq/Repos/ChatRepos/chat_repo.dart';
import 'package:bawabtalsharq/Repos/ChatRepos/jitsi_config.dart';
import 'package:bawabtalsharq/Repos/ChatRepos/socket_chat.dart';
import 'package:bawabtalsharq/Screens/Chat/chat_bubble.dart';
import 'package:bawabtalsharq/Screens/Chat/receiver_ringing_screen.dart';
import 'package:bawabtalsharq/Screens/Chat/sender_ringing_screen.dart';
import 'package:bawabtalsharq/Utils/Localization/LanguageHelper.dart';
import 'package:bawabtalsharq/Utils/constants.dart';
import 'package:bawabtalsharq/Utils/images.dart';
import 'package:bawabtalsharq/Utils/styles.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_pickers/image_pickers.dart';
import 'package:intl/intl.dart';
import 'package:jitsi_meet/jitsi_meet.dart';
import 'package:jitsi_meet/jitsi_meeting_listener.dart';
import 'package:mime/mime.dart';
import 'package:rocket_chat_connector_flutter/models/message.dart';
import 'package:rocket_chat_connector_flutter/models/user.dart' as UUser;

class ConversationScreen extends StatefulWidget {
  final String roomID;
  final PartnerData partner;

  // Recording _recording;
  final Random random = new Random();

  ConversationScreen(this.roomID, this.partner);

  @override
  _ConversationScreenState createState() => _ConversationScreenState();
}

class _ConversationScreenState extends State<ConversationScreen>
    with TickerProviderStateMixin {
  AnimationController _animationController;
  TextEditingController _textEditingController = TextEditingController();
  FlutterSound flutterSound = FlutterSound();
  StreamSubscription _recorderSubscription;
  StreamSubscription _dbPeakSubscription;
  final picker = ImagePicker();
  FilePickerResult resultFile;
  bool _isRecording = false;

  static const List<IconData> icons = const [
    Icons.insert_drive_file_rounded,
    Icons.videocam_rounded,
    Icons.image_rounded,
    Icons.camera_alt_rounded,
  ];
  List<Message> _messages = new List<Message>();
  bool _s = false;

  var localFileSystem;

  String _recorderTxt = '00:00:00';

  String _path = '';
  bool _isVideo = false;
  bool _hasMeeting = false;

  @override
  void initState() {
    super.initState();
    SocketChat.instance.connectToSocket(widget.roomID);
    SocketChat.instance.subscribeToRoom(widget.roomID);
    _animationController = new AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    jitsiListener();
    //  _textEditingController.addListener(() {
    // setState(() {
    //   _s = false;
    // });
    // });
  }

  @override
  void dispose() {
    SocketChat.instance.closeSocket(widget.roomID);
    JitsiMeet.removeAllListeners();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: RocketChatApi.instance.getRoomMessages(widget.roomID),
        builder: (context, snapshot) {
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
      floatingActionButton: !_isRecording
          ? Column(
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
                            getImage();
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
            )
          : null,
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
                      widget.partner.user.name,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                    SizedBox(height: 5),
                    Visibility(
                      visible: true,
                      child: Text(
                        widget.partner.user.status,
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
            onPressed: () {
              _isVideo = false;
              String callRoom = audioCall +
                  '_${rocketUser.data.userId}' +
                  '_${widget.partner.user.id}';
              SocketChat.instance.sendMessage(widget.roomID, callRoom);
              print('Pressed');

              SchedulerBinding.instance.addPostFrameCallback((_) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SenderRingingScreen(
                            widget.partner, false, widget.roomID)));
              });
            },
          ),
          IconButton(
            icon: Icon(
              Icons.videocam,
            ),
            onPressed: () {
              _isVideo = true;
              String callRoom = videoCall +
                  '_${rocketUser.data.userId}' +
                  '_${widget.partner.user.id}';
              SocketChat.instance.sendMessage(widget.roomID, callRoom);
              SchedulerBinding.instance.addPostFrameCallback((_) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SenderRingingScreen(
                            widget.partner, true, widget.roomID)));
              });
            },
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
              child: StreamBuilder(
                stream: SocketChat.instance.webSocketChannel.stream,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    var responseJSON = jsonDecode(snapshot.data);
                    if (responseJSON['msg'] == 'changed') {
                      print(snapshot);
                      SocketMessage sMessage =
                          SocketMessage.fromJson(responseJSON);
                      _messages.insert(
                          0,
                          Message(
                              user: new UUser.User(
                                id: sMessage.fields.args.first.u.id,
                              ),
                              msg: sMessage.fields.args.first.msg,
                              ts: DateTime(
                                  sMessage.fields.args.first.updatedAt.date)));
                      checkSocketMessage(sMessage.fields.args.first.msg);
                    }
                  }
                  return ListView.builder(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      itemCount: _messages.length,
                      reverse: true,
                      itemBuilder: (context, index) {
                        return ChatBubble(
                          message: _messages[index],
                          isMe: checkMessageSender(index, _messages[index]),
                          roomID: widget.roomID,
                          partnerData: widget.partner,
                        );
                      });
                },
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: BottomAppBar(
                elevation: 10,
                color: Colors.white,
                child: Container(
                  height: 60,
                  constraints: BoxConstraints(
                    maxHeight: 100,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Stack(
                      children: [
                        Row(
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
                                  color: Theme.of(context)
                                      .textTheme
                                      .headline6
                                      .color,
                                ),
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(10.0),
                                  border: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  hintText: "Write your message...",
                                  hintStyle: TextStyle(
                                    fontSize: 15.0,
                                    color: Theme.of(context)
                                        .textTheme
                                        .headline6
                                        .color,
                                  ),
                                ),
                                maxLines: null,
                              ),
                            ),
                            FlatButton(
                              child: Icon(
                                !_textEditingController.value.text.isNotEmpty
                                    ? Icons.keyboard_voice
                                    : Icons.send,
                                color: defaultOrangeColor,
                              ),
                              onPressed: () {
                                if (_textEditingController
                                    .value.text.isNotEmpty) {
                                  sendMessage();
                                } else {
                                  _onRecorderPreesed();
                                }
                              },
                            ),
                          ],
                        ),
                        _isRecording ? _buildRecordingView() : SizedBox()
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

  Widget _buildRecordingView() {
    return Container(
      width: double.infinity,
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          FlatButton(
              child: Text(
                'Cancel',
                style: Theme.of(context)
                    .textTheme
                    .body2
                    .copyWith(color: orangeColor),
              ),
              onPressed: () {
                _onRecordCancel();
              }),
          Container(
            child: Text(
              this._recorderTxt,
              style: TextStyle(
                fontSize: 27.0,
                color: Colors.grey.shade800,
              ),
            ),
          ),
          _buildMsgBtn(onPreesed: () {
            _onSendRecord();
          })
        ],
      ),
    );
  }

  _buildMsgBtn({Function onPreesed}) {
    return Material(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 8.0),
        child: IconButton(
          icon: Icon(Icons.send),
          onPressed: onPreesed,
          color: orangeColor,
        ),
      ),
      color: Colors.white,
    );
  }

  // _stop() async {
  //   setState(() {
  //     widget._isRecording = false;
  //   });
  //   var recording = await AudioRecorder.stop();
  //   print("Stop recording: ${recording.path}");
  //   bool isRecording = await AudioRecorder.isRecording;
  //   File file = File(recording.path);
  //   RocketChatApi().sendFile(widget.roomID, file.path);
  //   print("  File length: ${await file.length()}");
  // }

  void _onRecorderPreesed() async {
    try {
      String result = await flutterSound.startRecorder(
        codec: t_CODEC.CODEC_AAC,
      );

      print('startRecorder: $result');

      _recorderSubscription = flutterSound.onRecorderStateChanged.listen((e) {
        DateTime date =
            new DateTime.fromMillisecondsSinceEpoch(e.currentPosition.toInt());
        String txt = DateFormat('mm:ss:SS', 'en_US').format(date);
        this.setState(() {
          this._isRecording = true;
          this._recorderTxt = txt.substring(0, 8);
          this._path = result;
        });
      });
    } catch (err) {
      print('startRecorder error: $err');
      setState(() {
        this._isRecording = false;
      });
    }
  }

  void stopRecorder() async {
    try {
      String result = await flutterSound.stopRecorder();
      print('stopRecorder: $result');

      if (_recorderSubscription != null) {
        _recorderSubscription.cancel();
        _recorderSubscription = null;
      }
      if (_dbPeakSubscription != null) {
        _dbPeakSubscription.cancel();
        _dbPeakSubscription = null;
      }
    } catch (err) {
      print('stopRecorder error: $err');
    }

    this.setState(() {
      this._isRecording = false;
    });
  }

  _onRecordCancel() {
    stopRecorder();
  }

  _onSendRecord() async {
    stopRecorder();
    File recordFile = File(_path);
    bool isExist = await recordFile.exists();
    if (isExist) {
      String fileName = DateTime.now().millisecondsSinceEpoch.toString();
      RocketChatApi.instance.sendFile(widget.roomID, recordFile.path,
          _recorderTxt, MediaType('audio', 'mpeg'));
    }
  }

  Future getImage() async {
    List<Media> _listImagePaths = await ImagePickers.pickerPaths(
        galleryMode: GalleryMode.image,
        selectCount: 1,
        showGif: false,
        showCamera: true,
        compressSize: 500,
        uiConfig: UIConfig(uiThemeColor: orangeColor),
        cropConfig: CropConfig(enableCrop: false, width: 2, height: 1));
    if (_listImagePaths.first != null) {
      RocketChatApi.instance.sendFile(widget.roomID, _listImagePaths.first.path,
          "IMAGE", MediaType('audio', 'mpeg'));
    }
  }

  Future getCamera() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);
    setState(() {
      if (pickedFile != null) {
        var mimeTypeData =
            lookupMimeType(pickedFile.path, headerBytes: [0xFF, 0xD8])
                .split('/');
        RocketChatApi.instance.sendFile(widget.roomID, pickedFile.path, 'IMAGE',
            MediaType(mimeTypeData[0], mimeTypeData[1]));
      } else {}
    });
  }

  Future getVideo() async {
    final pickedFile = await picker.getVideo(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        var mimeTypeData =
            lookupMimeType(pickedFile.path, headerBytes: [0xFF, 0xD8])
                .split('/');
        RocketChatApi.instance.sendFile(widget.roomID, pickedFile.path, 'VIDEO',
            MediaType(mimeTypeData[0], mimeTypeData[1]));
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
      var mimeTypeData =
          lookupMimeType(result.files.single.path, headerBytes: [0xFF, 0xD8])
              .split('/');
      RocketChatApi.instance.sendFile(
          widget.roomID,
          File(result.files.single.path).path,
          'FILE',
          MediaType(mimeTypeData[0], mimeTypeData[1]));
    } else {
      // User canceled the picker0
    }
  }

  void sendMessage() {
    if (_textEditingController.text.isNotEmpty) {
      SocketChat.instance
          .sendMessage(widget.roomID, _textEditingController.text);
      _messages.add(new Message(msg: _textEditingController.text));
      _textEditingController.text = '';
    }
  }

  bool checkMessageSender(int index, Message _message) {
    return _message.user.id == rocketUser.data.userId;
  }

  void checkSocketMessage(String message) {
    var splitMessage = message.split("_");

    if (splitMessage[0].startsWith('--')) {
      if (splitMessage[1] != rocketUser.data.userId) {
        if (splitMessage[0] == audioCall) {
          SchedulerBinding.instance.addPostFrameCallback((_) {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ReceiverRingingScreen(widget.partner,
                      false, splitMessage[1] + '_' + splitMessage[2])),
            );
            //     .then((value) => {
            //   SocketChat.instance.sendMessage(
            //       widget.roomID,
            //       closeMeet +
            //           '_${widget.partner.user.id}' +
            //           '_${rocketUser.data.userId}')
            // });
          });
        } else if (splitMessage[0] == videoCall) {
          SchedulerBinding.instance.addPostFrameCallback((_) {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ReceiverRingingScreen(widget.partner,
                      true, splitMessage[1] + '_' + splitMessage[2])),
            );
            //     .then((value) => {
            //   SocketChat.instance.sendMessage(
            //       widget.roomID,
            //       closeMeet +
            //           '_${widget.partner.user.id}' +
            //           '_${rocketUser.data.userId}')
            // });
          });
        }
      } else {
        if (splitMessage[0] == joinAudioMeet) {
          _isVideo = false;
          JitsiConfig.instance.joinMeeting(context, false,
              splitMessage[1] + '_' + splitMessage[2], widget.partner);
        } else if (splitMessage[0] == joinVideoMeet) {
          _isVideo = true;
          JitsiConfig.instance.joinMeeting(context, true,
              splitMessage[1] + '_' + splitMessage[2], widget.partner);
        } else if (splitMessage[0] == closeMeet) {
          if (_hasMeeting) {
            if (_hasMeeting) {
              JitsiConfig.instance.closeMeeting(context);
            }
          }
        }
      }
    }
  }

  void jitsiListener() {
    JitsiMeet.addListener(JitsiMeetingListener(
        onConferenceWillJoin: _onConferenceWillJoin,
        onConferenceJoined: _onConferenceJoined,
        onConferenceTerminated: _onConferenceTerminated,
        onError: _onError));
  }

  void _onConferenceWillJoin({message}) {
    _hasMeeting = true;
    SocketChat.instance.sendMessage(
        widget.roomID,
        _isVideo
            ? joinVideoMeet
            : joinAudioMeet +
                '_${widget.partner.user.id}' +
                '_${rocketUser.data.userId}');
    debugPrint("_onConferenceWillJoin broadcasted with message: $message");
  }

  void _onConferenceJoined({message}) {
    debugPrint("_onConferenceJoined broadcasted with message: $message");
  }

  void _onConferenceTerminated({message}) {
    debugPrint("_onConferenceTerminated broadcasted with message: $message");
    if (_hasMeeting) {
      SocketChat.instance.sendMessage(
          widget.roomID,
          closeMeet +
              '_${widget.partner.user.id}' +
              '_${rocketUser.data.userId}');
    }
    _hasMeeting = false;
  }

  _onError(error) {
    debugPrint("_onError broadcasted: $error");
  }
}

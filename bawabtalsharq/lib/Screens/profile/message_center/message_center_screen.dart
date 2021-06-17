import 'package:bawabtalsharq/Utils/Localization/Language/Languages.dart';
import 'package:bawabtalsharq/Utils/Localization/LanguageHelper.dart';
import 'package:bawabtalsharq/Utils/images.dart';
import 'package:bawabtalsharq/main.dart';
import 'package:bawabtalsharq/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bawabtalsharq/bloc/MessageCenterBloc/messagecenter_bloc.dart';
import 'package:bawabtalsharq/bloc/MessageCenterBloc/messagecenter_state.dart';
import 'package:bawabtalsharq/bloc/MessageCenterBloc/messagecenter_event.dart';

import 'package:bawabtalsharq/Utils/loader.dart';
import 'package:bawabtalsharq/Model/MessageCenterModel.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MessageCenter extends StatefulWidget {
  @override
  _MessageCenterState createState() => _MessageCenterState();
}

class _MessageCenterState extends State<MessageCenter> {
  MessagecenterBloc msgCenterBloc;
  ScrollController _scrollController = ScrollController();
  List<Datum> msgList;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    msgCenterBloc = MessagecenterBloc();
    msgCenterBloc.add(GetMessagesData());
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    msgCenterBloc.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: buildFloatingActionBtn(
            icon: Icons.arrow_upward_rounded,
            onPressed: () {
              _scrollController.animateTo(0.0,
                  duration: Duration(seconds: 1), curve: Curves.easeOut);
            }),
        resizeToAvoidBottomInset: false,
        appBar: appBarBuilder(
          title: Languages.of(context).messageCenter,
          onBackPressed: () {
            Navigator.pop(context);
          },
        ),
        body: BlocProvider(
          create: (context) => msgCenterBloc,
          child: BlocListener<MessagecenterBloc, MessagecenterState>(
            listener: (context, state) {
              // TODO: implement listener
            },
            child: BlocBuilder<MessagecenterBloc, MessagecenterState>(
              builder: (context, state) {
                if (state is LoadingState) {
                  return LoadingLogo();
                } else if (state is LoadedMessagesState) {
                  msgList = state.msgList;
                  return _buildBody();
                } else if (state is MsgCenterNetworkErrorState) {
                  return Center(
                    child: Text(Languages.of(context).noNetwork),
                  );
                }
                return Container();
              },
            ),
          ),
        ));
  }

  Widget _buildBody() {
    return Column(
      children: [
        Flexible(
          child: ListView.builder(
              controller: _scrollController,
              padding: EdgeInsets.only(top: 32, bottom: 2),
              physics: AlwaysScrollableScrollPhysics(),
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemCount: 44,
              itemBuilder: (context, i) {
                return GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(
                        context, ScreenRoutes.listMessageScreen);
                  },
                  child: Container(
                    margin: EdgeInsets.only(
                        top: 4, left: 23, right: 23, bottom: 18),
                    width: 329,
                    decoration: new BoxDecoration(
                      color: Color(0xffffffff),
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [makeShadow()],
                    ),
                    child: Column(
                      children: [
                        imagesProduct(msgList[i].images),
                        buildRichText(msgList[i].text),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    buildText(
                                      Languages.of(context).seeAll,
                                      9,
                                      fontFamily: 'SegoeUI',
                                      color: Color(0xff6d6d6d),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Icon(
                                      LanguageHelper.isEnglish
                                          ? Icons.arrow_forward_rounded
                                          : Icons.arrow_back_rounded,
                                      size: 18,
                                      color: Colors.black.withOpacity(0.7),
                                    ),
                                  ],
                                ),
                              ),
                            ])
                      ],
                    ),
                  ),
                );
              }),
        ),
      ],
    );
  }

  Padding imagesProduct(List<String> img) {
    return Padding(
      padding: const EdgeInsets.only(top: 17),
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                bottomLeft: Radius.circular(15),
                bottomRight: Radius.circular(0),
                topRight: Radius.circular(0),
              ),
              child: Image(
                image: AssetImage(dominikMarti1),
                width: 69,
                height: 63,
              ),
            ),
            SizedBox(
              width: 4,
            ),
            Image(
              image: AssetImage(dominikMarti1),
              width: 69,
              height: 63,
            ),
            SizedBox(
              width: 4,
            ),
            ClipRRect(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(15),
                bottomRight: Radius.circular(15),
              ),
              child: Image(
                image: AssetImage(dominikMarti1),
                width: 69,
                height: 63,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Padding buildRichText(String text) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 25,
        right: 25,
        top: 18,
      ),
      child: RichText(
          text: TextSpan(children: [
        TextSpan(
            text: "Hi Ahmed, you have received",
            style: TextStyle(
              fontFamily: 'SegoeUI',
              color: Colors.black,
              fontSize: 10,
              fontWeight: FontWeight.w400,
              fontStyle: FontStyle.normal,
            )),
        TextSpan(
            text: " 20",
            style: TextStyle(
              fontFamily: 'SegoeUI',
              color: Colors.red,
              fontSize: 10,
              fontWeight: FontWeight.w400,
              fontStyle: FontStyle.normal,
            )),
        TextSpan(
            text: " quote reply for your RFQ",
            style: TextStyle(
              fontFamily: 'SegoeUI',
              color: Colors.black,
              fontSize: 10,
              fontWeight: FontWeight.w400,
              fontStyle: FontStyle.normal,
            )),
      ])),
    );
  }
}

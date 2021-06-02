import 'package:bawabtalsharq/Utils/Localization/Language/Languages.dart';
import 'package:bawabtalsharq/Utils/Localization/LanguageHelper.dart';
import 'package:bawabtalsharq/Utils/images.dart';
import 'package:bawabtalsharq/main.dart';
import 'package:bawabtalsharq/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MessageCenter extends StatefulWidget {
  @override
  _MessageCenterState createState() => _MessageCenterState();
}

class _MessageCenterState extends State<MessageCenter> {
  ScrollController _scrollController = ScrollController();
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
      body: Column(
        children: [
          Flexible(
            child: ListView.builder(
                controller: _scrollController,
                padding: EdgeInsets.only(top: 32, bottom: 2),
                physics: AlwaysScrollableScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: 44,
                itemBuilder: (context, position) {
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
                          imagesProduct(),
                          buildRichText('Hi Ahmed, you have received'),
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
      ),
    );
  }

  Padding imagesProduct() {
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

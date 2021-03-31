import 'dart:ui';

import 'package:bawabtalsharq/Utils/Localization/Language/Languages.dart';
import 'package:bawabtalsharq/Utils/images.dart';
import 'package:bawabtalsharq/Utils/map_util.dart';
import 'package:bawabtalsharq/Utils/styles.dart';
import 'package:bawabtalsharq/main.dart';
import 'package:bawabtalsharq/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      child: Scaffold(
        backgroundColor: defaultOrangeColor.withOpacity(0.15),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(14, 14, 14, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, ScreenRoutes.settingsScreen);
                    },
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 18,
                      child: Image.asset(
                        settings,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 14,
                  ),
                  GestureDetector(
                    onTap: () {
                      showLanguagesDialog(context);
                    },
                    child: buildText(
                      Languages.of(context).language,
                      16,
                      fontWeight: FontWeight.bold,
                      color: defaultOrangeColor,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(14, 0, 14, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 86,
                    height: 86,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage(profile_image),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      buildText('Bahaa Robert', 16,
                          fontWeight: FontWeight.w600),
                      SizedBox(
                        height: 2,
                      ),
                      buildText('Beauty & Personal Care', 14,
                          color: Colors.grey[500]),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 14, right: 14),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  cardProfile(
                    onPressed: () {
                      print('Notification');
                    },
                    text: Languages.of(context).notification,
                    subText: '33 ' + Languages.of(context).items,
                    icon: Icons.notifications_none,
                    colorIcon: Colors.blue[300],
                  ),
                  cardProfile(
                    onPressed: () {
                      print('Saved');
                    },
                    text: Languages.of(context).saved,
                    subText: '33 ' + Languages.of(context).items,
                    icon: Icons.bookmark_rounded,
                    colorIcon: Colors.deepOrange[300],
                  ),
                  cardProfile(
                    onPressed: () {
                      print('Compares');
                    },
                    text: Languages.of(context).compares,
                    subText: '33 ' + Languages.of(context).items,
                    icon: Icons.add_to_photos_rounded,
                    colorIcon: Colors.deepPurpleAccent,
                  ),
                  cardProfile(
                    onPressed: () {
                      print('History');
                    },
                    text: Languages.of(context).history,
                    icon: Icons.av_timer_rounded,
                    colorIcon: Colors.green[400],
                  ),
                ],
              ),
            ),
            profileListBuilder(context)
          ],
        ),
      ),
    );
  }

  Column cardProfile(
      {Function onPressed,
      IconData icon,
      Color colorIcon,
      String text,
      String subText = ''}) {
    return Column(
      children: [
        GestureDetector(
          onTap: onPressed,
          child: Container(
            padding: EdgeInsets.all(14),
            decoration: boxDecorationBuilder(20),
            child: Icon(
              icon,
              color: colorIcon,
              size: 36,
            ),
          ),
        ),
        SizedBox(
          height: 7,
        ),
        buildText(
          text,
          12,
          fontWeight: FontWeight.w600,
          fontFamily: semiBoldFontFamily,
        ),
        buildText(
          subText,
          11,
          color: Color(0xFF303030),
        ),
      ],
    );
  }

  BoxDecoration boxDecorationBuilder(double radius) {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(radius),
      boxShadow: [makeShadow()],
    );
  }

  Widget profileListBuilder(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.only(top: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20),
            topLeft: Radius.circular(20),
          ),
          color: Colors.white,
        ),
        child: SingleChildScrollView(
          padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).size.height * 0.13),
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Container(
                margin: EdgeInsets.only(right: 15, left: 15),
                decoration: boxDecorationBuilder(20),
                child: Column(
                  children: [
                    unExpansionProfileItem(
                      quotation,
                      Languages.of(context).quotation,
                      () {
                        print('Quotation Pressed');
                      },
                    ),
                    unExpansionProfileItem(
                      message,
                      Languages.of(context).messageCenter,
                      () {
                        print('Message Pressed');
                      },
                    ),
                    unExpansionProfileItem(
                      user,
                      Languages.of(context).userGuide,
                      () {
                        print('User Guide Pressed');
                      },
                      drawDivider: false,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                margin: EdgeInsets.only(right: 15, left: 15),
                decoration: boxDecorationBuilder(20),
                child: Column(
                  children: [
                    unExpansionProfileItem(
                      quotation,
                      Languages.of(context).accountInfo,
                      () {
                        print('Account Info');
                      },
                    ),
                    expansionProfileItem(
                      title: Languages.of(context).contactUs,
                      image: message,
                      onClick: () {},
                      children: [
                        unExpansionProfileItem(
                            message, Languages.of(context).phoneNumber, () {
                          showCustomDialog(
                            Container(
                              height: 50,
                              width: MediaQuery.of(context).size.width,
                              child: Center(
                                child: GestureDetector(
                                  onTap: () {
                                    launch("tel://+215453");
                                  },
                                  child: buildText(
                                      Languages.of(context).phone, 14,
                                      color: orangeColor,
                                      fontWeight: FontWeight.w600,
                                      textDecoration: TextDecoration.underline,
                                      decorationColor: orangeColor),
                                ),
                              ),
                              margin: EdgeInsets.only(
                                  bottom: 50, left: 16, right: 16),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                          );
                        },
                            fontWeight: FontWeight.normal,
                            drawDivider: false,
                            textSize: 14),
                        unExpansionProfileItem(
                            message, Languages.of(context).sendMessage, () {
                          showCustomDialog(
                            Center(
                              child: ListView(
                                shrinkWrap: true,
                                children: [
                                  Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        color: Colors.white,
                                        boxShadow: [
                                          BoxShadow(
                                              color: Color(0x26e16036),
                                              offset: Offset(0, 1),
                                              blurRadius: 6,
                                              spreadRadius: 0),
                                        ],
                                      ),
                                      margin:
                                          EdgeInsets.only(right: 20, left: 20),
                                      child: Padding(
                                        padding: const EdgeInsets.all(20.0),
                                        child: Material(
                                          child: Column(
                                            children: [
                                              textFiledMessage(context,
                                                  text: Languages.of(context)
                                                      .email),
                                              textFiledMessage(context,
                                                  text: Languages.of(context)
                                                      .subject),
                                              textFiledMessage(context,
                                                  text: Languages.of(context)
                                                      .writeAMessage,
                                                  keyboardType:
                                                      TextInputType.multiline,
                                                  lines: 5),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              submitButton(() {}, context)
                                            ],
                                          ),
                                        ),
                                      )),
                                ],
                              ),
                            ),
                          );
                        },
                            fontWeight: FontWeight.normal,
                            drawDivider: false,
                            textSize: 14),
                        unExpansionProfileItem(
                            message, Languages.of(context).location, () {
                          showCustomDialog(
                            Container(
                              height: 70,
                              width: MediaQuery.of(context).size.width,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.location_on_rounded,
                                        size: 14,
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      buildText(
                                        Languages.of(context).address,
                                        12,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      MapUtils.openMap(
                                        30.063216,
                                        31.341721,
                                      );
                                    },
                                    child: buildText(
                                        Languages.of(context).getLocation, 12,
                                        color: orangeColor,
                                        fontWeight: FontWeight.w600,
                                        textDecoration:
                                            TextDecoration.underline,
                                        decorationColor: orangeColor),
                                  ),
                                ],
                              ),
                              margin: EdgeInsets.only(
                                  bottom: 50, left: 16, right: 16),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                          );
                        },
                            fontWeight: FontWeight.normal,
                            drawDivider: false,
                            textSize: 14),
                      ],
                    ),
                    unExpansionProfileItem(
                      user,
                      Languages.of(context).aboutUs,
                      () {
                        print('About Us');
                      },
                      drawDivider: false,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                margin: EdgeInsets.only(right: 15, left: 15, bottom: 10),
                decoration: boxDecorationBuilder(10),
                child: unExpansionProfileItem(
                  logout,
                  Languages.of(context).logOut,
                  () {
                    print('Logout Pressed');
                  },
                  drawDivider: false,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  GestureDetector expansionProfileItem(
      {@required String title,
      @required String image,
      @required List<Widget> children,
      @required Function onClick}) {
    return GestureDetector(
      onTap: onClick,
      child: Column(
        children: [
          ExpansionTile(
            tilePadding: EdgeInsetsDirectional.fromSTEB(0, 0, 15, 0),
            title: unExpansionProfileItem(image, title, () {
              print('Contact Us');
            }, drawDivider: false, isParent: true),
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.only(left: 20, right: 20, bottom: 20),
                decoration: BoxDecoration(
                  color: Colors.blue[100],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(children: children),
              )
            ],
          ),
          Divider(
            indent: 15,
            endIndent: 15,
            thickness: 1,
            height: 1,
          ),
        ],
      ),
    );
  }

  Widget unExpansionProfileItem(String image, String title, Function onPressed,
      {bool drawDivider = true,
      bool isParent = false,
      double textSize = 16.0,
      FontWeight fontWeight = FontWeight.w700}) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
        ),
        margin: EdgeInsets.only(top: 10, left: 15, right: 15),
        child: Column(
          children: [
            Row(
              children: [
                Image.asset(
                  image,
                  width: 40,
                  height: 40,
                ),
                SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: buildText(title, textSize,
                      fontFamily: semiBoldFontFamily, fontWeight: fontWeight),
                ),
                isParent ? SizedBox() : Icon(Icons.navigate_next),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            drawDivider
                ? Divider(
                    thickness: 1,
                    height: 1,
                  )
                : SizedBox(
                    height: 0,
                  ),
          ],
        ),
      ),
    );
  }

  void showCustomDialog(Widget widget) {
    showGeneralDialog(
      barrierLabel: "Barrier",
      barrierDismissible: true,
      barrierColor: Color(0xffcfcece).withOpacity(0.5),
      transitionDuration: Duration(milliseconds: 700),
      context: context,
      pageBuilder: (_, __, ___) {
        return Align(alignment: Alignment.center, child: widget);
      },
      transitionBuilder: (_, anim, __, child) {
        return SlideTransition(
          position: Tween(begin: Offset(0, 1), end: Offset(0, 0)).animate(anim),
          child: child,
        );
      },
    );
  }
}

Widget textFiledMessage(BuildContext context,
    {String text,
    TextInputType keyboardType = TextInputType.text,
    int lines = 1}) {
  return Column(
    children: [
      TextField(
        minLines: 1,
        maxLines: lines,
        keyboardType: keyboardType,
        enabled: true,
        decoration: InputDecoration(
          isDense: true,
          border: OutlineInputBorder(
            borderRadius: const BorderRadius.all(
              const Radius.circular(15.0),
            ),
          ),
          labelText: text,
        ),
      ),
      SizedBox(height: 24)
    ],
  );
}

Widget submitButton(Function _function, BuildContext context) {
  return FlatButton(
    onPressed: _function,
    child: Padding(
      padding: const EdgeInsets.all(12),
      child: Text(
        Languages.of(context).submit,
        style: TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.bold,
          color: orangeColor,
        ),
      ),
    ),
    shape: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25),
        borderSide: BorderSide(width: 3, color: orangeColor)),
    highlightColor: orangeColor.withOpacity(0.2),
    splashColor: orangeColor.withOpacity(0.5),
  );
}

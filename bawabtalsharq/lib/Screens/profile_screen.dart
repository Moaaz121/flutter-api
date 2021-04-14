import 'dart:ui';

import 'package:bawabtalsharq/Utils/Localization/Language/Languages.dart';
import 'package:bawabtalsharq/Utils/images.dart';
import 'package:bawabtalsharq/Utils/styles.dart';
import 'package:bawabtalsharq/main.dart';
import 'package:bawabtalsharq/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
                    width: 76,
                    height: 76,
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
            // Padding(
            //   padding: const EdgeInsets.only(left: 14, right: 14),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     children: [
            //       cardProfile(
            //         onPressed: () {
            //           print('Notification');
            //         },
            //         text: Languages.of(context).notification,
            //         subText: '33 ' + Languages.of(context).items,
            //         icon: Icons.notifications_none,
            //         colorIcon: Colors.blue[300],
            //       ),
            //       cardProfile(
            //         onPressed: () {
            //           print('Saved');
            //         },
            //         text: Languages.of(context).saved,
            //         subText: '33 ' + Languages.of(context).items,
            //         icon: Icons.bookmark_rounded,
            //         colorIcon: Colors.deepOrange[300],
            //       ),
            //       cardProfile(
            //         onPressed: () {
            //           print('Compares');
            //         },
            //         text: Languages.of(context).compares,
            //         subText: '33 ' + Languages.of(context).items,
            //         icon: Icons.add_to_photos_rounded,
            //         colorIcon: Colors.deepPurpleAccent,
            //       ),
            //       cardProfile(
            //         onPressed: () {
            //           print('History');
            //         },
            //         text: Languages.of(context).history,
            //         icon: Icons.av_timer_rounded,
            //         colorIcon: Colors.green[400],
            //       ),
            //     ],
            //   ),
            // ),
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
                      Icon(
                        Icons.person,
                        color: Colors.lightBlueAccent,
                      ),
                      Languages.of(context).myAccount,
                      () {
                        Navigator.pushNamed(context, ScreenRoutes.myAccount);
                      },
                    ),
                    unExpansionProfileItem(
                      Icon(
                        Icons.bookmark_border_outlined,
                        color: Colors.orange,
                      ),
                      Languages.of(context).saved,
                      () {
                        Navigator.pushNamed(context, ScreenRoutes.savedScreen);
                      },
                    ),
                    unExpansionProfileItem(
                      Icon(
                        Icons.av_timer,
                        color: Colors.black54,
                      ),
                      Languages.of(context).history,
                      () {
                        Navigator.pushNamed(
                            context, ScreenRoutes.historyScreen);
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
                      Icon(
                        Icons.message,
                        color: Colors.lightBlueAccent[200],
                      ),
                      Languages.of(context).messageCenter,
                      () {
                        Navigator.pushNamed(
                            context, ScreenRoutes.messageCenter);
                      },
                    ),
                    unExpansionProfileItem(
                      Icon(
                        Icons.question_answer_outlined,
                        color: Colors.deepPurpleAccent[200],
                      ),
                      Languages.of(context).faq,
                      () {
                        Navigator.pushNamed(context, ScreenRoutes.faqScreen);
                      },
                    ),
                    unExpansionProfileItem(
                      Icon(
                        Icons.security,
                        color: Colors.green[200],
                      ),
                      Languages.of(context).privacy,
                      () {
                        Navigator.pushNamed(
                            context, ScreenRoutes.privacyScreen);
                      },
                      drawDivider: false,
                    ),
                    // expansionProfileItem(
                    //   title: Languages.of(context).contactUs,
                    //   image: message,
                    //   onClick: () {},
                    //   children: [
                    //     unExpansionProfileItem(
                    //         message, Languages.of(context).phoneNumber, () {
                    //       showAnimatedDialog(
                    //         context,
                    //         phoneNumberDialog(context),
                    //       );
                    //     },
                    //         fontWeight: FontWeight.normal,
                    //         drawDivider: false,
                    //         textSize: 14),
                    //     unExpansionProfileItem(
                    //         message, Languages.of(context).sendMessage, () {
                    //       showAnimatedDialog(
                    //         context,
                    //         sendMessageDialog(context),
                    //       );
                    //     },
                    //         fontWeight: FontWeight.normal,
                    //         drawDivider: false,
                    //         textSize: 14),
                    //     unExpansionProfileItem(
                    //         message, Languages.of(context).location, () {
                    //       showAnimatedDialog(
                    //         context,
                    //         locationDialog(context),
                    //       );
                    //     },
                    //         fontWeight: FontWeight.normal,
                    //         drawDivider: false,
                    //         textSize: 14),
                    //   ],
                    // ),
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
                  Icon(
                    Icons.exit_to_app_rounded,
                    color: Colors.lightBlueAccent[200],
                  ),
                  Languages.of(context).signIn,
                  () {
                    print('Sign In');
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

  // GestureDetector expansionProfileItem(
  //     {@required String title,
  //     @required String image,
  //     @required List<Widget> children,
  //     @required Function onClick}) {
  //   return GestureDetector(
  //     onTap: onClick,
  //     child: Column(
  //       children: [
  //         ExpansionTile(
  //           tilePadding: EdgeInsetsDirectional.fromSTEB(0, 0, 15, 0),
  //           title: unExpansionProfileItem(image, title, () {
  //             print('Contact Us');
  //           }, drawDivider: false, isParent: true),
  //           children: [
  //             Container(
  //               width: MediaQuery.of(context).size.width,
  //               margin: EdgeInsets.only(left: 20, right: 20, bottom: 20),
  //               decoration: BoxDecoration(
  //                 color: Colors.blue[100],
  //                 borderRadius: BorderRadius.circular(10),
  //               ),
  //               child: Column(children: children),
  //             )
  //           ],
  //         ),
  //         Divider(
  //           indent: 15,
  //           endIndent: 15,
  //           thickness: 1,
  //           height: 1,
  //         ),
  //       ],
  //     ),
  //   );
  // }

}

Widget unExpansionProfileItem(Icon icon, String title, Function onPressed,
    {bool drawDivider = true,
    bool isParent = false,
    double textSize = 16.0,
    FontWeight fontWeight = FontWeight.w600}) {
  return GestureDetector(
    onTap: onPressed,
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
      ),
      margin: EdgeInsets.only(top: 10, left: 15, right: 15, bottom: 12),
      child: Column(
        children: [
          Row(
            children: [
              icon,
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

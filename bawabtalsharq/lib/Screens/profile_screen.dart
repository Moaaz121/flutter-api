import 'package:bawabtalsharq/Utils/Localization/Language/Languages.dart';
import 'package:bawabtalsharq/Utils/images.dart';
import 'package:bawabtalsharq/Utils/strings.dart';
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

//end bahaa

//start asmaa

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
                    profileItemBuilder(
                      quotation,
                      Languages.of(context).quotation,
                      () {
                        print('Quotation Pressed');
                      },
                    ),
                    profileItemBuilder(
                      message,
                      Languages.of(context).messageCenter,
                      () {
                        print('Message Pressed');
                      },
                    ),
                    profileItemBuilder(
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
                    profileItemBuilder(
                      quotation,
                      Languages.of(context).quotation,
                      () {
                        print('Quotation Pressed');
                      },
                    ),
                    profileItemBuilder(
                      message,
                      Languages.of(context).messageCenter,
                      () {
                        print('Message Pressed');
                      },
                    ),
                    profileItemBuilder(
                      user,
                      Languages.of(context).userGuide,
                      () {
                        print('User guide Pressed');
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
                child: profileItemBuilder(
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

  Widget profileItemBuilder(String image, String title, Function onPressed,
      {bool drawDivider = true}) {
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
                  width: 20,
                ),
                Expanded(
                  child: buildText(title, 16.0,
                      fontFamily: semiBoldFontFamily,
                      fontWeight: FontWeight.w700),
                ),
                Icon(Icons.navigate_next),
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
// end asmaa
}

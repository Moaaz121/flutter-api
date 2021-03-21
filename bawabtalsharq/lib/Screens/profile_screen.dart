import 'package:bawabtalsharq/Utils/images.dart';
import 'package:bawabtalsharq/Utils/styles.dart';
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
      child: Container(
        color: defaultOrangeColor.withOpacity(0.15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 14, top: 14),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 18,
                    child: Image.asset(
                      settings,
                    ),
                  ),
                  SizedBox(
                    width: 14,
                  ),
                  buildText('EN', 16,
                      fontWeight: FontWeight.bold, color: defaultOrangeColor),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 14),
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
                          image: AssetImage(bahaa_image), fit: BoxFit.fill),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      buildText('Jessie Robert', 16,
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
                    text: 'Notifications',
                    subText: '33 items',
                    icon: Icons.notifications_none,
                    colorIcon: Colors.blue[300],
                  ),
                  cardProfile(
                    text: 'Saved',
                    subText: '33 items',
                    icon: Icons.bookmark_rounded,
                    colorIcon: Colors.deepOrange[300],
                  ),
                  cardProfile(
                    text: 'Compares',
                    subText: '33 items',
                    icon: Icons.add_to_photos_rounded,
                    colorIcon: Colors.deepPurpleAccent,
                  ),
                  cardProfile(
                    text: 'History',
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
      {IconData icon, Color colorIcon, String text, String subText = ''}) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(14),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), color: Colors.white),
          child: Icon(
            icon,
            color: colorIcon,
            size: 36,
          ),
        ),
        SizedBox(
          height: 7,
        ),
        buildText(text, 12),
        buildText(subText, 11, color: Colors.grey[500]),
      ],
    );
  }
// start bahaa

//end bahaa

//start asmaa
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
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Container(
                margin: EdgeInsets.only(right: 15, left: 15),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xFF727272).withOpacity(0.2),
                        blurRadius: 6,
                        offset: Offset(0, 2),
                        spreadRadius: 0,
                      )
                    ]),
                child: Column(
                  children: [
                    profileItemBuilder(message, 'Message Center', () {}),
                    profileItemBuilder(message, 'Message Center', () {}),
                    profileItemBuilder(message, 'Message Center', () {}),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                margin: EdgeInsets.only(right: 15, left: 15),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xFF727272).withOpacity(0.2),
                        blurRadius: 6,
                        offset: Offset(0, 2),
                        spreadRadius: 0,
                      )
                    ]),
                child: Column(
                  children: [
                    profileItemBuilder(message, 'Message Center', () {}),
                    profileItemBuilder(message, 'Message Center', () {}),
                    profileItemBuilder(message, 'Message Center', () {}),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                margin: EdgeInsets.only(right: 15, left: 15),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xFF727272).withOpacity(0.2),
                        blurRadius: 6,
                        offset: Offset(0, 2),
                        spreadRadius: 0,
                      )
                    ]),
                child: profileItemBuilder(message, 'Log out', () {}),
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget profileItemBuilder(String image, String title, Function onPressed) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
        ),
        margin: EdgeInsets.all(15),
        child: Row(
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
                  fontFamily: semiBoldFontFamily, fontWeight: FontWeight.w700),
            ),
            Icon(Icons.navigate_next),
          ],
        ),
      ),
    );
  }
// end asmaa
}

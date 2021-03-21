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
    return Container(
      color: defaultOrangeColor.withOpacity(0.15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: 20,
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
                    buildText('Jessie Robert', 16, fontWeight: FontWeight.w600),
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
        ],
      ),
    );
  }
}

// start bahaa
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
//end bahaa

//start asmaa

// end asmaa

import 'package:bawabtalsharq/Utils/Strings%20Data/strings_en.dart';
import 'package:bawabtalsharq/Utils/images.dart';
import 'package:bawabtalsharq/Utils/strings.dart';
import 'package:bawabtalsharq/Utils/styles.dart';
import 'package:bawabtalsharq/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:bawabtalsharq/Utils/constants.dart';

class NotificationScreen extends StatefulWidget {
  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  ScrollController _mainScrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xfff8f8f8),
      child: SafeArea(
          bottom: false,

          child: Stack(

            children: [

              SingleChildScrollView(
                physics: const BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics()),
                child: Column(

                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 15),
                        child: Text(
                          Strings().notifications(),
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 35,
                              color: orangeColor),
                        ),
                      ),
                      notification(context, _mainScrollController),
                    ]),
              ),

              Positioned(
                right: 20,
                bottom: 110,
                child: buildFloatingActionBtn(
                  icon: Icons.arrow_upward,
                  onPressed: () {
                    _mainScrollController.animateTo(0.0,
                        duration: Duration(seconds: 1), curve: Curves.easeOut);
                  },
                ),
              ),
            ],
          )),
    );
  }
}

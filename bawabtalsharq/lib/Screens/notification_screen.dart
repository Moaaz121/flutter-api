import 'package:bawabtalsharq/Utils/images.dart';
import 'package:bawabtalsharq/Utils/strings.dart';
import 'package:bawabtalsharq/Utils/styles.dart';
import 'package:bawabtalsharq/widgets/widgets.dart';
import 'package:flutter/material.dart';

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
                physics: BouncingScrollPhysics(
                  parent: NeverScrollableScrollPhysics(),
                ),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 15),
                        child: buildText(
                          Strings().notifications(),
                          35.0,
                          fontWeight: FontWeight.bold,
                          color: orangeColor,
                        ),
                      ),
                      notification(context),
                    ]),
              ),
              Positioned(
                right: 20,
                bottom: MediaQuery.of(context).size.height * 0.15,
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

  Widget notification(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      child: ListView.builder(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).size.height * 0.23),
        controller: _mainScrollController,
        scrollDirection: Axis.vertical,
        itemCount: 15,
        itemBuilder: (context, position) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
            ),
            margin: EdgeInsets.only(top: 10, right: 14, left: 14, bottom: 10),
            child: notificationItems(
              onPress: () {},
              title: position.isOdd
                  ? '50Off In Ultra boost All Terrain Ltd Shoes'
                  : 'check Out Quality Products From Global Star Suppliers',
              imageView: AssetImage(
                position.isOdd ? productImage : productImage,
              ),
            ),
          );
        },
      ),
    );
  }

  Widget notificationItems({
    Function onPress,
    String title,
    AssetImage imageView,
  }) {
    return GestureDetector(
      onTap: onPress,
      child: Row(
        children: [
          Image(
            image: imageView,
            width: 90,
            height: 90,
          ),
          Expanded(
              child: buildText(
            title,
            14,
            fontWeight: FontWeight.w500,
          )),
          Icon(
            Icons.navigate_next,
            size: 30,
          )
        ],
      ),
    );
  }
}

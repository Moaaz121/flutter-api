import 'package:bawabtalsharq/Utils/Localization/Language/Languages.dart';
import 'package:bawabtalsharq/Utils/images.dart';
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
      color: Colors.white,
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
                        margin: EdgeInsetsDirectional.only(start: 15),
                        child: buildText(
                          Languages.of(context).notification,
                          35.0,
                          fontWeight: FontWeight.bold,
                          color: orangeColor,
                        ),
                      ),
                      notification(context),
                    ]),
              ),
              Positioned.directional(
                textDirection: Directionality.of(context),
                end: 20,
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
      color: Colors.white,
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
              boxShadow: [makeShadow()],
              color: Colors.white,
            ),
            margin: EdgeInsetsDirectional.only(
                top: 10, start: 14, end: 14, bottom: 10),
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

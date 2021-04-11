import 'package:bawabtalsharq/Utils/Localization/Language/Languages.dart';
import 'package:bawabtalsharq/Utils/styles.dart';
import 'package:bawabtalsharq/widgets/widgets.dart';
import 'package:flutter/material.dart';

class FeatureScreen extends StatefulWidget {
  @override
  _FeatureScreenState createState() => _FeatureScreenState();
}

class _FeatureScreenState extends State<FeatureScreen> {
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
                      margin: EdgeInsetsDirectional.only(start: 15),
                      child: buildText(
                        Languages.of(context).superior,
                        35.0,
                        fontWeight: FontWeight.bold,
                        color: orangeColor,
                      ),
                    ),
                    supplierItem()
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
        ),
      ),
    );
  }

  Widget supplierItem() {
    return Container(
      child: Container(
          width: 400,
          height: 150,
          decoration: new BoxDecoration(
            color: Color(0xffffffff),
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                  color: Color(0x29000000),
                  offset: Offset(0, 1),
                  blurRadius: 6,
                  spreadRadius: 0)
            ],
          )),
    );
  }
}

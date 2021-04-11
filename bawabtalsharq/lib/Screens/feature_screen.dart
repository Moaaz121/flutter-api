import 'package:bawabtalsharq/Utils/Localization/Language/Languages.dart';
import 'package:bawabtalsharq/Utils/images.dart';
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
                    rocketList(context)
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

  Widget rocketList(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: ListView.builder(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).size.height * 0.23),
        controller: _mainScrollController,
        scrollDirection: Axis.vertical,
        itemCount: 15,
        itemBuilder: (context, position) {
          return supplierItem();
        },
      ),
    );
  }

  Widget supplierItem() {
    return Container(
      child: Column(
        children: [
          Container(
            height: 250,
            child: Stack(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 50, left: 20, right: 20),
                  child: Container(
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
                    ),
                  ),
                ),
                Positioned(
                  top: 20,
                  left: 50,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 86,
                        height: 86,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            color: Colors.white,
                          ),
                          shape: BoxShape.rectangle,
                          image: DecorationImage(
                            image: AssetImage(mosadaq_img),
                            fit: BoxFit.fill,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 300, top: 10),
                          child: Icon(Icons.arrow_forward),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      buildText('Bahaa Robert', 12),
                      Row(
                        children: [
                          Icon(
                            Icons.access_time_rounded,
                            size: 12,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          buildText(
                            'Member since: 2020',
                            8,
                            fontWeight: FontWeight.w400,
                          ),
                          SizedBox(
                            height: 15,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.star,
                            size: 20,
                            color: Colors.yellow,
                          ),
                          buildText('4.5', 12)
                        ],
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: MediaQuery.of(context).size.width * 0.24,
                  right: MediaQuery.of(context).size.width * 0.19,
                  child: Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Colors.white,
                      ),
                      shape: BoxShape.rectangle,
                      image: DecorationImage(
                        image: AssetImage(kareem_img),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: MediaQuery.of(context).size.width * 0.22,
                  right: MediaQuery.of(context).size.width * 0.22,
                  child: Container(
                    width: 90,
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Colors.white,
                      ),
                      shape: BoxShape.rectangle,
                      image: DecorationImage(
                        image: AssetImage(kareem_img),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: MediaQuery.of(context).size.width * 0.2,
                  right: MediaQuery.of(context).size.width * 0.26,
                  child: Container(
                    width: 100,
                    height: 120,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Colors.white,
                      ),
                      shape: BoxShape.rectangle,
                      image: DecorationImage(
                        image: AssetImage(kareem_img),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

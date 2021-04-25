import 'package:bawabtalsharq/Utils/Localization/Language/Languages.dart';
import 'package:bawabtalsharq/Utils/images.dart';
import 'package:bawabtalsharq/Utils/styles.dart';
import 'package:bawabtalsharq/main.dart';
import 'package:bawabtalsharq/widgets/widgets.dart';
import 'package:flutter/material.dart';

class SuperiorScreen extends StatefulWidget {
  @override
  _SuperiorScreenState createState() => _SuperiorScreenState();
}

class _SuperiorScreenState extends State<SuperiorScreen> {
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
            height: MediaQuery.of(context).size.width * 0.6,
            child: Stack(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    top: 50,
                    left: 20,
                    right: 20,
                  ),
                  child: Container(
                    decoration: new BoxDecoration(
                      color: Colors.white,
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

                Positioned.directional(
                  textDirection: Directionality.of(context),
                  top: 60,
                  end: 40,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(
                          context, ScreenRoutes.supplierProfileScreen);
                    },
                    child: Icon(
                      Icons.arrow_forward,
                      size: 20,
                    ),
                  ),
                ),

                Positioned.directional(
                  textDirection: Directionality.of(context),
                  top: 20,
                  start: 50,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(
                              context, ScreenRoutes.supplierProfileScreen);
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.3,
                          height: MediaQuery.of(context).size.height * 0.15,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(mosadaq_img),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      buildText('Bahaa Robert', 12),
                      SizedBox(
                        height: 5,
                      ),
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
                      SizedBox(
                        height: 5,
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
                //Last image
                Positioned.directional(
                  textDirection: Directionality.of(context),
                  top: MediaQuery.of(context).size.width * 0.28,
                  end: MediaQuery.of(context).size.width * 0.1,
                  child: productImage(0.10, 0.16),
                ),
                //center image
                Positioned.directional(
                  textDirection: Directionality.of(context),
                  top: MediaQuery.of(context).size.width * 0.25,
                  end: MediaQuery.of(context).size.width * 0.15,
                  child: productImage(0.11, 0.24),
                ),
                //top image
                Positioned.directional(
                  textDirection: Directionality.of(context),
                  top: MediaQuery.of(context).size.width * 0.23,
                  end: MediaQuery.of(context).size.width * 0.22,
                  child: productImage(0.12, 0.3),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container productImage(double width, double height) {
    return Container(
      width: MediaQuery.of(context).size.height * width,
      height: MediaQuery.of(context).size.width * height,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(kareem_img),
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}

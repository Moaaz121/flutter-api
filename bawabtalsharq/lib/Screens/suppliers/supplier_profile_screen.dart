import 'package:bawabtalsharq/Screens/home_screen.dart';
import 'package:bawabtalsharq/Utils/Localization/LanguageHelper.dart';
import 'package:bawabtalsharq/Utils/images.dart';
import 'package:bawabtalsharq/Utils/styles.dart';
import 'package:bawabtalsharq/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SupplierProfile extends StatefulWidget {
  @override
  _SupplierProfileState createState() => _SupplierProfileState();
}

class _SupplierProfileState extends State<SupplierProfile>
    with TickerProviderStateMixin {
  final Map<int, Widget> myTabs = const <int, Widget>{
    0: Text("All Products",
        style: TextStyle(
          color: Colors.black,
          fontSize: 16,
          fontWeight: FontWeight.w700,
        )),
    1: Text("Info",
        style: TextStyle(
          color: Colors.black,
          fontSize: 16,
          fontWeight: FontWeight.w700,
        ))
  };
  final Map<int, Widget> categorys = <int, Widget>{
    0: Center(child: listOfCateWidgetSupplier()),
    1: Center(
      child: FlutterLogo(
        textColor: Colors.teal,
        size: 200.0,
      ),
    ),
  };

  int segmentedControlGroupValue = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            SizedBox(
              height: 240,
              child: Stack(
                children: [
                  Container(
                    height: 120,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(supplierBanner),
                        colorFilter: new ColorFilter.mode(
                            Colors.black.withOpacity(0.5), BlendMode.darken),
                        fit: BoxFit.fill,
                      ),
                    ),
                    child: Positioned(
                      child: Column(
                        children: [
                          Divider(
                            indent: 80,
                            endIndent: 85,
                            thickness: 1.5,
                            color: Colors.white,
                          ),
                          buildText(
                            'Bawabt Al-Sharq',
                            30,
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                          ),
                          Divider(
                            indent: 80,
                            endIndent: 85,
                            thickness: 1.5,
                            color: Colors.white,
                          ),
                          buildText(
                            'Furniture & Decor',
                            20,
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: 20,
                    left: 10,
                    child: CircleAvatar(
                      radius: 9,
                      backgroundColor: Colors.white,
                      child: Icon(
                        LanguageHelper.isEnglish
                            ? Icons.keyboard_arrow_left_outlined
                            : Icons.keyboard_arrow_right_outlined,
                        size: 15,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 70,
                    left: 30,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
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
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
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
                                )
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 155,
                    left: 20,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        icon(Icons.location_on),
                        icon(Icons.phone),
                        icon(Icons.email_outlined),
                        SizedBox(
                          width: 150,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            chatButton(() {},
                                size: 50, sizeIcon: 8, padOfIcon: 6),
                            buildText(
                              'Start chat now!',
                              11,
                              fontWeight: FontWeight.w700,
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              height: 65,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.vertical(bottom: Radius.circular(25)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                  ),
                  BoxShadow(
                      color: Colors.white,
                      spreadRadius: 2.0,
                      blurRadius: 10.0,
                      offset: Offset(0, -10)),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: detailsSupplierTabBar(),
              ),
            ),
            Flexible(child: categorys[segmentedControlGroupValue]),
          ],
        ),
      ),
    );
  }

  Container icon(IconData icon) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      width: 30,
      height: 30,
      decoration: new BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
              color: Color(0x297a7a7a),
              offset: Offset(0, 1),
              blurRadius: 6,
              spreadRadius: 0)
        ],
      ),
      child: Icon(
        icon,
        color: BaseOrange,
        size: 20,
      ),
    );
  }

  Widget detailsSupplierTabBar() {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.8,
          child: CupertinoSlidingSegmentedControl(
            groupValue: segmentedControlGroupValue,
            backgroundColor: orangeColor.withOpacity(0.15),
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 7),
            children: myTabs,
            onValueChanged: (i) {
              setState(() {
                segmentedControlGroupValue = i;
              });
            },
          ),
        ),
      ),
    );
  }
}

Widget listOfCateWidgetSupplier() {
  return ListView.builder(
    physics: AlwaysScrollableScrollPhysics(),
    reverse: false,
    scrollDirection: Axis.vertical,
    shrinkWrap: true,
    itemCount: 10,
    itemBuilder: (context, position) {
      return SizedBox(
          width: MediaQuery.of(context).size.width / 3 - 5,
          child: mostPopularByCategoryStable(context, () {}));
    },
  );
}

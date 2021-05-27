import 'package:bawabtalsharq/Screens/suppliers/Waves.dart';
import 'package:bawabtalsharq/Utils/Localization/Language/Languages.dart';
import 'package:bawabtalsharq/Utils/Localization/LanguageHelper.dart';
import 'package:bawabtalsharq/Utils/images.dart';
import 'package:bawabtalsharq/Utils/styles.dart';
import 'package:bawabtalsharq/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'CirclPainter.dart';

class SupplierProfile extends StatefulWidget {
  const SupplierProfile({
    Key key,
    this.size = 80.0,
    this.color = Colors.red,
    this.onPressed,
    @required this.child,
  }) : super(key: key);
  final double size;
  final Color color;
  final Widget child;
  final VoidCallback onPressed;

  @override
  _SupplierProfileState createState() => _SupplierProfileState();
}

class _SupplierProfileState extends State<SupplierProfile>
    with TickerProviderStateMixin {
  AnimationController _controller;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Map<int, Widget> seqmentBulid(BuildContext context) {
    final Map<int, Widget> myTabs = <int, Widget>{
      0: Text(
        Languages.of(context).allProducts,
        style: TextStyle(
          color: Colors.black,
          fontSize: 16,
          fontWeight: FontWeight.w700,
        ),
      ),
      1: Text(Languages.of(context).info,
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ))
    };
    return myTabs;
  }

  Map<int, Widget> info(BuildContext context) {
    final Map<int, Widget> info = <int, Widget>{
      0: Center(child: listOfCateWidgetSupplier()),
      1: Center(child: infoList()),
    };
    return info;
  }

  int segmentedControlGroupValue = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            SizedBox(
              height: 220,
              child: CustomPaint(
                painter: CirclePainter(
                  _controller,
                  color: widget.color,
                ),
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
                              Languages.of(context).bawabtAlsharq,
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
                              Languages.of(context).feature,
                              20,
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned.directional(
                      textDirection: Directionality.of(context),
                      top: 20,
                      start: 10,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
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
                    ),
                    Positioned.directional(
                      textDirection: Directionality.of(context),
                      top: 70,
                      start: 30,
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
                    Positioned.directional(
                      textDirection: Directionality.of(context),
                      top: 170,
                      start: 20,
                      child: Row(
                        children: [
                          iconOfSupplier(Icons.location_on, () {}),
                          SizedBox(
                            width: 30,
                          ),
                          iconOfSupplier(Icons.phone, () {}),
                          SizedBox(
                            width: 30,
                          ),
                          iconOfSupplier(Icons.email_outlined, () {}),
                        ],
                      ),
                    ),
                    Positioned.directional(
                      textDirection: Directionality.of(context),
                      top: 135,
                      end: 30,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          chatButtonAnimation(() {},
                              size: MediaQuery.of(context).size.width * 0.1,
                              sizeIcon: 8,
                              padOfIcon: 6),
                          buildText(
                            Languages.of(context).startChat,
                            10,
                            fontWeight: FontWeight.w700,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              height: 70,
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
                      spreadRadius: 1.0,
                      blurRadius: 8.0,
                      offset: Offset(0, -8)),
                ],
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 14),
                child: detailsSupplierTabBar(),
              ),
            ),
            Flexible(child: info(context)[segmentedControlGroupValue]),
          ],
        ),
      ),
    );
  }

  Widget chatButtonAnimation(Function _function,
      {double size = 45, double sizeIcon = 10, double padOfIcon = 16}) {
    return Padding(
      padding: EdgeInsets.all(padOfIcon),
      child: SizedBox(
        width: size,
        height: size,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(widget.size),
          child: DecoratedBox(
            decoration: BoxDecoration(
              gradient: RadialGradient(
                colors: <Color>[
                  widget.color,
                  Color.lerp(widget.color, Colors.black, .05)
                ],
              ),
            ),
            child: ScaleTransition(
                scale: Tween(begin: 0.95, end: 1.0).animate(
                  CurvedAnimation(
                    parent: _controller,
                    curve: CurveWave(),
                  ),
                ),
                child: Icon(
                  Icons.speaker_phone,
                  size: 44,
                )),
          ),
        ),
        // Container(
        //   decoration: BoxDecoration(
        //     shape: BoxShape.circle,
        //     boxShadow: [
        //       BoxShadow(
        //         color: const Color(0x2ee16036),
        //         offset: Offset(0, 1),
        //         blurRadius: 6,
        //       ),
        //     ],
        //   ),
        //   child: ClipOval(
        //     child: Material(
        //       shadowColor: orangeShadowColor,
        //       color: Colors.white,
        //       child: InkWell(
        //         onTap: _function,
        //         splashColor: orangeColor.withOpacity(0.4),
        //         highlightColor: orangeShadowColor,
        //         child: Padding(
        //           padding: EdgeInsets.all(sizeIcon),
        //           child: Image.asset(
        //             chat,
        //             width: 30,
        //             height: 30,
        //             fit: BoxFit.fill,
        //           ),
        //         ),
        //       ),
        //     ),
        //   ),
        // ),
      ),
    );
  }

  Widget iconOfSupplier(IconData icon, Function onPress) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
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
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 6),
            children: seqmentBulid(context),
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
            // child: mostPopularByCategoryStable(context, () {
            //   setState(() {
            //     Navigator.pushNamed(context, ScreenRoutes.searchResultScreen);
            //   });
            // })
          );
        });
  }

  Widget infoList() {
    return SingleChildScrollView(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).size.height * 0.1),
      child: Padding(
        padding: const EdgeInsets.only(left: 30, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20,
            ),
            buildText('Member info:', 13, fontWeight: FontWeight.w600),
            SizedBox(
              height: 100,
            ),
            buildText('Contact Detail:', 13, fontWeight: FontWeight.w600),
            SizedBox(
              height: 100,
            ),
            buildText('Company Profile', 13, fontWeight: FontWeight.w600),
            SizedBox(
              height: 20,
            ),
            mainSlider(),
            buildText(
                'It is our passion to make people forget their daily stress while indulging in one of our many exclusive pieces...It is our passion to make people forget their daily stress while indulging in one of our many exclusive pieces...It is our passion to make people forget their daily stress while indulging in one of our many exclusive pieces...It is our passion to make people forget their daily stress while indulging in one of our many exclusive piecesIt is our passion to make people forget their daily stress while indulging in one of our many exclusive piecesIt is our passion to make people forget their daily stress while indulging in one of our many exclusive piecesIt is our passion to make people forget their daily stress while indulging in one of our many exclusive piecesIt is our passion to make people forget their daily stress while indulging in one of our many exclusive pieces...',
                11,
                fontWeight: FontWeight.w600)
          ],
        ),
      ),
    );
  }
}

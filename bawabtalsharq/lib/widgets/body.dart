import 'dart:ui';
import 'package:bawabtalsharq/Screens/splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
// import 'package:intro/constants.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int imageIndex = 0;
  PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/Background$imageIndex.png'),
          fit: BoxFit.fill,
        ),
      ),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 40,
            ),
            Container(
              width: 70,
              height: 30,
              margin: EdgeInsets.only(bottom: 10, right: 12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'EN',
                    style: TextStyle(color: Colors.black54, fontSize: 18),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Icon(
                      Icons.arrow_drop_down,
                      size: 25,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                // margin: EdgeInsets.only(top: 90, left: 35, right: 35),
                width: MediaQuery.of(context).size.width * 0.85,

                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(37),
                    topRight: Radius.circular(37),
                  ),
                ),
                child: Stack(
                  children: [
                    PageView(
                      controller: _pageController,
                      pageSnapping: true,
                      scrollDirection: Axis.horizontal,
                      onPageChanged: (page) {
                        setState(() {
                          // print(page);
                          imageIndex = page;
                        });
                      },
                      children: [
                        pageOne(),
                        pageTwo(),
                        pageThree(),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          alignment: Alignment.center,
                          child: AnimatedSmoothIndicator(
                            activeIndex: imageIndex,
                            count: 3,
                            effect: ExpandingDotsEffect(
                                activeDotColor: imageIndex == 0
                                    ? Colors.green
                                    : (imageIndex == 1
                                        ? Colors.blueAccent
                                        : Colors.redAccent),
                                dotColor: imageIndex == 0
                                    ? Colors.green.withOpacity(0.3)
                                    : (imageIndex == 1
                                        ? Colors.blueAccent.withOpacity(0.3)
                                        : Colors.redAccent.withOpacity(0.3))),
                          ),
                        ),
                      ],
                    ),
                    Positioned(
                      right: 10,
                      bottom: 10,
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              bottom: 20,
                              left: 25,
                            ),
                            child: GestureDetector(
                              onTap: () {
                                imageIndex < 2
                                    ? _pageController.jumpToPage(imageIndex + 1)
                                    : print('login');
                              },
                              child: Text(
                                'next',
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 15),
                            child: Icon(
                              Icons.arrow_forward,
                              size: 17,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container pageOne() {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset(
            "assets/images/intro.png",
            fit: BoxFit.fill,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.5,
          ),
          Container(
            margin: EdgeInsets.only(top: 20),
            child: Text(
              'Discover',
              style: TextStyle(
                  fontFamily: "Segoe UI",
                  fontWeight: FontWeight.w700,
                  fontSize: 30),
            ),
          ),
          Container(
            margin: EdgeInsets.all(20),
            child: Text(
              'Welcome to Bawbt Alsharq,We wish to fullfill all your needs',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: "Segoe UI",
                fontWeight: FontWeight.w400,
                fontSize: 18,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container pageTwo() {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset(
            "assets/images/intro1.png",
            fit: BoxFit.fill,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.5,
          ),
          Container(
            margin: EdgeInsets.only(top: 20),
            child: Text(
              'Discover',
              style: TextStyle(
                  fontFamily: "Segoe UI",
                  fontWeight: FontWeight.w700,
                  fontSize: 30),
            ),
          ),
          Container(
            margin: EdgeInsets.all(20),
            child: Text(
              'Welcome to Bawbt Alsharq,We wish to fullfill all your needs',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: "Segoe UI",
                fontWeight: FontWeight.w400,
                fontSize: 18,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container pageThree() {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset(
            "assets/images/intro2.png",
            fit: BoxFit.fill,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.5,
          ),
          Container(
            margin: EdgeInsets.only(top: 20),
            child: Text(
              'Discover',
              style: TextStyle(
                  fontFamily: "Segoe UI",
                  fontWeight: FontWeight.w700,
                  fontSize: 30),
            ),
          ),
          Container(
            margin: EdgeInsets.all(20),
            child: Text(
              'Welcome to Bawbt Alsharq,We wish to fullfill all your needs',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: "Segoe UI",
                fontWeight: FontWeight.w400,
                fontSize: 18,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

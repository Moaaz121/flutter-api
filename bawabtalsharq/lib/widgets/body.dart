import 'dart:ui';

import 'package:bawabtalsharq/Utils/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int imageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/intro-$imageIndex.png'),
          fit: BoxFit.fill,
        ),
      ),
      child: Container(
        margin: EdgeInsets.only(top: 90, left: 35, right: 35),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: Stack(
          children: [
            PageView(
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
            Positioned(
              right: 100,
              bottom: 80,
              child: AnimatedSmoothIndicator(
                activeIndex: imageIndex,
                count: 3,
                effect: ExpandingDotsEffect(dotColor: BaseOrange),
              ),
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
                    child: Text(
                      'next',
                      style: TextStyle(fontSize: 20),
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
    );
  }

  Container pageOne() {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset(
            "assets/images/intro.png",
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

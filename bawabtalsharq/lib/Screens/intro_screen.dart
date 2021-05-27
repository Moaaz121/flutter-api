import 'dart:ui';

import 'package:bawabtalsharq/Utils/Localization/Language/Languages.dart';
import 'package:bawabtalsharq/Utils/Localization/LanguageHelper.dart';
import 'package:bawabtalsharq/Utils/images.dart';
import 'package:bawabtalsharq/Utils/size_config.dart';
import 'package:bawabtalsharq/main.dart';
import 'package:bawabtalsharq/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:cached_network_image/cached_network_image.dart';

class IntroScreen extends StatefulWidget {
  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  int imageIndex = 0;
  PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: GestureDetector(
        child: Container(
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
                  height: 50,
                ),
                Container(
                  width: 70,
                  height: 30,
                  margin: EdgeInsetsDirectional.only(
                      top: 10, bottom: 10, start: 12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: GestureDetector(
                    onTap: () {
                      showLanguagesDialog(context);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          Languages.of(context).language,
                          style: TextStyle(color: Colors.black54, fontSize: 18),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.only(end: 5),
                          child: Icon(
                            Icons.arrow_drop_down,
                            size: 25,
                            color: Colors.black54,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.85,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(37),
                        topRight: Radius.circular(37),
                      ),
                    ),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Positioned(
                          top: MediaQuery.of(context).size.height * 0.54 + 10,
                          child: Container(
                            alignment: Alignment.center,
                            child: AnimatedSmoothIndicator(
                              activeIndex: imageIndex,
                              count: 3,
                              effect: ExpandingDotsEffect(
                                  spacing: 5.0,
                                  radius: 8.0,
                                  dotWidth: 8.0,
                                  dotHeight: 8.0,
                                  expansionFactor: 2.7,
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
                        ),
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
                            pageBuilder(
                                intro1,
                                Languages.of(context).intro1Title,
                                Languages.of(context).intro1SubTitle),
                            pageBuilder(
                                intro2,
                                Languages.of(context).intro2Title,
                                Languages.of(context).intro2SubTitle),
                            pageBuilder(
                                intro3,
                                Languages.of(context).intro3Title,
                                Languages.of(context).intro3SubTitle)
                          ],
                        ),
                        Positioned.directional(
                          textDirection: Directionality.of(context),
                          bottom: 30,
                          child: Column(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  print('aa');
                                  imageIndex < 2
                                      ? _pageController
                                          .jumpToPage(imageIndex + 1)
                                      : submit();
                                },
                                child: Container(
                                  width: 150,
                                  height: 40,
                                  decoration: BoxDecoration(
                                      color: imageIndex == 0
                                          ? Colors.green
                                          : (imageIndex == 1
                                              ? Colors.blueAccent
                                              : Colors.redAccent),
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        Languages.of(context).next,
                                        style: TextStyle(
                                            fontSize: 20, color: Colors.white),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Icon(
                                        LanguageHelper.isEnglish
                                            ? Icons.arrow_forward_rounded
                                            : Icons.arrow_back_rounded,
                                        color: Colors.white,
                                        size: 17,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              GestureDetector(
                                onTap: () {
                                  submit();
                                },
                                child: Text(
                                  'Skip',
                                  style: TextStyle(
                                      decoration: TextDecoration.underline),
                                ),
                              ),
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
        ),
      ),
    );
  }

  Container pageBuilder(String imageName, String title, String subTitle) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.4,
            child: CachedNetworkImage(
              fit: BoxFit.fill,
              imageUrl: imageName,
              placeholder: (context, url) => Padding(
                padding: EdgeInsets.all(5),
                child: Container(
                  child: Image.asset(placeHolder),
                ),
              ),
              errorWidget: (context, url, error) => Padding(
                padding: EdgeInsets.all(5),
                child: Container(
                  child: Image.asset(placeHolder),
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            child: Text(
              title,
              style: TextStyle(
                  fontFamily: "Segoe UI",
                  fontWeight: FontWeight.w700,
                  fontSize: 20),
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: Text(
              subTitle,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: "Segoe UI",
                fontWeight: FontWeight.w400,
                fontSize: 15,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void submit() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('onBoarding', true).then((value) => {
          if (value)
            {Navigator.pushReplacementNamed(context, ScreenRoutes.mainScreen)}
        });
  }
}

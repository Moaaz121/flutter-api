import 'package:bawabtalsharq/Model/user_model.dart';
import 'package:bawabtalsharq/Services/checkIntrernetConnectivity.dart';
import 'package:bawabtalsharq/Utils/Localization/Language/Languages.dart';
import 'package:bawabtalsharq/Utils/constants.dart';
import 'package:bawabtalsharq/Utils/images.dart';
import 'package:bawabtalsharq/Utils/styles.dart';
import 'package:bawabtalsharq/main.dart';
import 'package:bawabtalsharq/widgets/widgets.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:bawabtalsharq/Services/AnalyticsService.dart';

class RequestForQScreen extends StatefulWidget {
  @override
  _RequestForQScreenState createState() => _RequestForQScreenState();
}

class _RequestForQScreenState extends State<RequestForQScreen> {
  CarouselController control = CarouselController();
  int position = 0;
  UserModel currentUser = Constants.getUserInfo2();
  InternetConnection connection;
  bool connected;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    connection = new InternetConnection();

    AnalyticsService().setScreenName(name: 'RQF_Screen');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarBuilderWithWidget(
          titleWidget: buildText(
              Languages.of(context).requestForQuotation, 18.0,
              fontFamily: boldFontFamily,
              color: Colors.white,
              fontWeight: FontWeight.bold),
          onBackPressed: () {
            Navigator.pop(context);
          }),
      body: SafeArea(
        child: Column(
          children: [
            requestForQuotationSlider(),
            postSourcingRequestNowButton(() async {
              bool connected = await connection.isConnected();

              if (currentUser == null) {
                Navigator.pushNamed(context, ScreenRoutes.loginScreen);
              } else {
                if (!connected)
                  Navigator.pushNamed(context, ScreenRoutes.noInternet);
                else {
                  AnalyticsService()
                      .setUserProperties(userId: currentUser.data.userId);
                  Navigator.pushNamed(
                      context, ScreenRoutes.postQuotationRequest);
                }
              }
            }),
          ],
        ),
      ),
    );
  }

  Widget requestForQuotationSlider() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: SizedBox(
        width: MediaQuery.of(context).size.width + 100,
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width + 100,
                  child: CarouselSlider(
                      carouselController: control,
                      items: [
                        requestForQuotationSliderItem(context, rFqSlider1),
                        requestForQuotationSliderItem(context, rFqSlider2),
                        requestForQuotationSliderItem(context, rFqSlider3),
                      ],
                      options: CarouselOptions(
                        onPageChanged:
                            (int page, CarouselPageChangedReason reason) {
                          setState(() {
                            position = page;
                          });
                        },
                        height: MediaQuery.of(context).size.height * .6,
                        aspectRatio: 1,
                        viewportFraction: .88,
                        pauseAutoPlayInFiniteScroll: true,
                        pauseAutoPlayOnTouch: true,
                        initialPage: 0,
                        disableCenter: true,
                        enableInfiniteScroll: false,
                        reverse: false,
                        autoPlay: true,
                        autoPlayInterval: Duration(seconds: 3),
                        autoPlayAnimationDuration: Duration(milliseconds: 800),
                        autoPlayCurve: Curves.fastOutSlowIn,
                        enlargeCenterPage: false,
                        scrollDirection: Axis.horizontal,
                      )),
                ),
                requestForQuotationSliderIndicator(position)
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget requestForQuotationSliderItem(BuildContext context, String image) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: SizedBox(
        width: MediaQuery.of(context).size.width + 100,
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(15)),
          child: Image.asset(
            image,
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }

  Widget requestForQuotationSliderIndicator(int page) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 55),
      child: AnimatedSmoothIndicator(
        activeIndex: page,
        count: 3,
        axisDirection: Axis.horizontal,
        effect: ExpandingDotsEffect(
            spacing: 5.0,
            radius: 8.0,
            dotWidth: 8.0,
            dotHeight: 8.0,
            expansionFactor: 2.7,
            dotColor: orangeShadowColor,
            activeDotColor: orangeColor),
      ),
    );
  }

  Widget postSourcingRequestNowButton(Function _function) {
    return FlatButton(
      onPressed: _function,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Text(
          Languages.of(context).postSourcingRequestNow,
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.bold,
            color: orangeColor,
          ),
        ),
      ),
      shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: BorderSide(width: 3, color: orangeColor)),
      highlightColor: orangeColor.withOpacity(0.2),
      splashColor: orangeColor.withOpacity(0.5),
    );
  }
}

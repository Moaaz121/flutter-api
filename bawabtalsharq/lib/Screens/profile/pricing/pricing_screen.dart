import 'package:bawabtalsharq/Utils/Localization/LanguageHelper.dart';
import 'package:bawabtalsharq/Utils/styles.dart';
import 'package:bawabtalsharq/Utils/Localization/Language/Languages.dart';
import 'package:flutter/material.dart';
import 'package:bawabtalsharq/widgets/widgets.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';

class PricingScreen extends StatefulWidget {
  @override
  _PricingScreenState createState() => _PricingScreenState();
}

class _PricingScreenState extends State<PricingScreen> {
  CarouselController buttonCarouselController = CarouselController();
  int sliderPosition = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          title: buildText(Languages.of(context).pricingPlan, 22,
              color: orangeColor, fontWeight: FontWeight.bold),
          leading: IconButton(
            icon: CircleAvatar(
              radius: 9,
              backgroundColor: orangeColor,
              child: Icon(
                LanguageHelper.isEnglish
                    ? Icons.keyboard_arrow_left_outlined
                    : Icons.keyboard_arrow_right_outlined,
                size: 17,
                color: Colors.white,
              ),
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CarouselSlider(
              carouselController: buttonCarouselController,
              items: [
                pricingItem(
                    context: context,
                    text: 'Free',
                    price: '0',
                    color: Colors.blue[300]),
                pricingItem(
                    context: context,
                    text: 'Bronze',
                    price: '600',
                    color: Colors.brown[400]),
                pricingItem(
                    context: context,
                    text: 'Silver',
                    price: '1000',
                    color: Colors.black26),
                pricingItem(
                    context: context,
                    text: 'Gold',
                    price: '1500',
                    color: Colors.orange[400]),
                pricingItem(
                    context: context,
                    text: 'Vip',
                    price: '3000',
                    color: orangeColor),
              ],
              options: CarouselOptions(
                onPageChanged: (index, reason) {
                  setState(() {
                    sliderPosition = index;
                  });
                },
                autoPlay: false,
                height: MediaQuery.of(context).size.height * 0.75,
                autoPlayCurve: Curves.fastOutSlowIn,
                scrollDirection: Axis.horizontal,
                aspectRatio: 16 / 9,
                viewportFraction: 0.8,
                pauseAutoPlayInFiniteScroll: true,
                pauseAutoPlayOnTouch: true,
                initialPage: 0,
                disableCenter: true,
                enableInfiniteScroll: false,
                reverse: false,
                enlargeCenterPage: true,
              ),
            ),
            sliderIndicator(sliderPosition, noPadding: true, count: 5),
          ],
        ),
      ),
    );
  }

  Widget pricingItem(
      {BuildContext context, Color color, String text, String price}) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      height: MediaQuery.of(context).size.height * 0.75,
      width: MediaQuery.of(context).size.width * 0.9,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [makeShadow()],
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      child: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.14,
            width: MediaQuery.of(context).size.width * 0.55,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(140),
                bottomLeft: Radius.circular(140),
              ),
              boxShadow: [makeShadow()],
              color: color,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                buildText(text, 22,
                    color: Colors.white, fontWeight: FontWeight.w600),
                buildText('\$' + price, 26,
                    color: Colors.white, fontWeight: FontWeight.w600),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemCount: 12,
              padding: EdgeInsets.only(top: 10, left: 20, right: 20),
              itemBuilder: (context, position) {
                return Padding(
                  padding: const EdgeInsets.all(6),
                  child: Row(
                    children: [
                      Icon(
                        position.isOdd ? Icons.check : Icons.close,
                        size: 16,
                        color: color,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      buildText(
                          position.isOdd ? 'Video Chat' : 'Online Support', 14),
                    ],
                  ),
                );
              },
            ),
          ),
          RaisedButton(
            child: Text(Languages.of(context).selectPlan),
            onPressed: null,
            padding: EdgeInsets.only(left: 36, right: 36),
            disabledTextColor: Colors.white,
            disabledColor: color,
            shape: RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(30.0),
            ),
          ),
        ],
      ),
    );
  }
}

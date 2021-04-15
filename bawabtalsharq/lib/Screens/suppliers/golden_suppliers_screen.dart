import 'package:bawabtalsharq/Utils/Localization/Language/Languages.dart';
import 'package:bawabtalsharq/Utils/images.dart';
import 'package:bawabtalsharq/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GoldenSuppliers extends StatefulWidget {
  @override
  _GoldenSuppliersState createState() => _GoldenSuppliersState();
}

class _GoldenSuppliersState extends State<GoldenSuppliers> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: appBarBuilder(
        title: Languages.of(context).ourGoldenSupplier,
        onBackPressed: () {
          Navigator.pop(context);
        },
      ),
      body: ListView.builder(
          padding: EdgeInsets.only(
            top: 60,
            left: 11,
            bottom: 33,
          ),
          physics: AlwaysScrollableScrollPhysics(),
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemCount: 22,
          itemBuilder: (context, position) {
            return Stack(children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Container(
                  margin: EdgeInsets.only(left: 12, right: 23, bottom: 15),
                  // width: 333,
                  height: 190,
                  decoration: new BoxDecoration(
                    color: Color(0xfffbfbfb),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                          color: Color(0x29000000),
                          offset: Offset(0, 1),
                          blurRadius: 6,
                          spreadRadius: 0)
                    ],
                  ),
                  child: Column(
                    children: [
                      firstRow(),
                      secondRow(),
                      thirdRow(),
                    ],
                  ),
                ),
              ),
              Positioned.directional(
                textDirection: Directionality.of(context),
                top: 5,
                start: 5,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: Image(
                    image: AssetImage(kareem_img),
                    width: 70,
                  ),
                ),
              ),
            ]);
          }),
    );
  }

  Padding thirdRow() {
    return Padding(
      padding: const EdgeInsets.only(top: 16, left: 1, right: 11),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          imagesProduct(Languages.of(context).sportShoes,
              Languages.of(context).sportShoes),
          imagesProduct(Languages.of(context).sportShoes,
              Languages.of(context).sportShoes),
          imagesProduct(Languages.of(context).sportShoes,
              Languages.of(context).sportShoes)
        ],
      ),
    );
  }

  Column imagesProduct(
    String text,
    String subText,
  ) {
    double height = MediaQuery.of(context).size.height;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      // mainAxisAlignment: MainAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image(
            image: AssetImage(dominikMarti1),
            width: 85,
            height: 70,
          ),
        ),
        SizedBox(
          height: 3,
        ),
        buildText(
          text,
          10,
          fontWeight: FontWeight.w700,
        ),
        SizedBox(
          height: 3,
        ),
        buildText(
          subText,
          8,
          fontWeight: FontWeight.w400,
        ),
      ],
    );
  }

  Padding secondRow() {
    return Padding(
      padding: const EdgeInsetsDirectional.only(
        end: 11,
        start: 90,
      ),
      child: Row(
        children: [
          Icon(
            Icons.access_time,
            size: 15,
          ),
          buildText(
            Languages.of(context).memberSince,
            7,
            color: Color(0xff646464),
            fontWeight: FontWeight.w400,
          ),
        ],
      ),
    );
  }

  Padding firstRow() {
    return Padding(
      padding: const EdgeInsetsDirectional.only(top: 4, start: 90, end: 11),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          buildText(
            Languages.of(context).eslamAlaa,
            15,
            fontWeight: FontWeight.w700,
          ),
          Image(
            image: AssetImage(medalImage),
            width: 14,
            height: 14,
          ),
          SizedBox(
            width: 33,
          ),
          Icon(Icons.arrow_forward),
        ],
      ),
    );
  }
}

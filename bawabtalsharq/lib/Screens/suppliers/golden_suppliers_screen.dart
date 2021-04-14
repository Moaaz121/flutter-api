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
            bottom: 44,
          ),
          physics: AlwaysScrollableScrollPhysics(),
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemCount: 22,
          itemBuilder: (context, position) {
            return Column(
              children: [
                Container(
                  padding: EdgeInsets.only(bottom: 20, left: 10, right: 10),
                  margin: EdgeInsets.only(left: 12, right: 23, bottom: 32),
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
              ],
            );
          }),
    );
  }

  Widget thirdRow() {
    return Padding(
      padding: const EdgeInsets.only(top: 11, left: 15, right: 11),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          imagesProduct('Sport Shoes', 'Sport Shoes'),
          imagesProduct('Sport Shoes', 'Sport Shoes'),
          imagesProduct('Sport Shoes', 'Sport Shoes')
        ],
      ),
    );
  }

  Column imagesProduct(
    String text,
    String subText,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      // mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          width: 79,
          height: 83,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
            image: DecorationImage(
              image: AssetImage(dominikMarti1),
            ),
          ),
          // child: Image(
          //   image: AssetImage(dominikMarti1),
          // ),
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
      padding: const EdgeInsets.only(left: 70, right: 11),
      child: Row(
        children: [
          Icon(
            Icons.access_time,
            size: 15,
          ),
          buildText(
            'Member since: 2020',
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
      padding: const EdgeInsets.only(top: 4, left: 70, right: 11),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          buildText(
            'Alaa Maher',
            15,
            fontWeight: FontWeight.w700,
          ),
          Icon(
            Icons.widgets,
            color: Colors.red,
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

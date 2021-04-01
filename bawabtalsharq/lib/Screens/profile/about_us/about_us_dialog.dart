import 'dart:ui';

import 'package:bawabtalsharq/Utils/Localization/Language/Languages.dart';
import 'package:bawabtalsharq/Utils/images.dart';
import 'package:bawabtalsharq/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget aboutUsDialog(BuildContext context) {
  return Container(
    padding: EdgeInsetsDirectional.only(
      top: 16,
      start: 29,
      end: 30,
    ),
    width: MediaQuery.of(context).size.height * .4,
    height: MediaQuery.of(context).size.height * .6,
    margin: EdgeInsets.only(top: 178, left: 27, right: 27, bottom: 178),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(33),
      boxShadow: [
        makeShadow(),
      ],
    ),
    child: SingleChildScrollView(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        buildColumn(Languages.of(context).aboutUs,
            'Lorem ipsum dolor sit consetetur sadipscing elitr sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet'),
        SizedBox(height: 18),
        buildColumn(Languages.of(context).ourGroup,
            'Lorem ipsum dolor sit consetetur sadipscing elitr sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet'),
        SizedBox(height: 18),
        buildText(
          Languages.of(context).ourGroupCompanies,
          16,
          fontWeight: FontWeight.w600,
        ),
        SizedBox(height: 10),
        Container(
          height: 79,
          decoration: new BoxDecoration(
            color: Color(0xffffffff),
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                  color: Color(0x26e16036),
                  offset: Offset(0, 0),
                  blurRadius: 20,
                  spreadRadius: 0),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Row(
              children: [
                Icon(
                  Icons.arrow_back_ios,
                  size: 13,
                ),
                Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: 10,
                    itemBuilder: (context, position) {
                      return buildListItem(
                          'snappy Lauch', 'Programming Company', snappyLaunch);
                    },
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 13,
                ),
              ],
            ),
          ),
        )
      ]),
    ),
  );
}

Column buildListItem(
    String textImage, String textLabel, String imageContainer) {
  return Column(
    children: [
      Container(
          margin: EdgeInsetsDirectional.only(
            start: 15,
            top: 8,
            end: 15,
          ),
          width: 48,
          height: 46,
          decoration: new BoxDecoration(
            image: DecorationImage(
              image: AssetImage(imageContainer),
              fit: BoxFit.fill,
            ),
          )),
      Text(textImage,
          style: TextStyle(
            fontFamily: 'SegoeUI',
            color: Colors.black,
            fontSize: 7,
            fontWeight: FontWeight.w600,
            fontStyle: FontStyle.normal,
          )),
      Text(textLabel,
          style: TextStyle(
            fontFamily: 'SegoeUI',
            color: Colors.black,
            fontSize: 6,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
          ))
    ],
  );
}

Column buildColumn(String title, String subTitle) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        title,
        style: TextStyle(
          fontFamily: 'SegoeUI',
          color: Colors.red,
          fontSize: 16,
          fontWeight: FontWeight.w600,
          fontStyle: FontStyle.normal,
          letterSpacing: 0.192,
        ),
      ),
      SizedBox(
        height: 5,
      ),
      Text(
        subTitle,
        style: TextStyle(
          fontFamily: 'Arial',
          color: Color(0xff000000),
          fontSize: 10,
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal,
        ),
      ),
    ],
  );
}

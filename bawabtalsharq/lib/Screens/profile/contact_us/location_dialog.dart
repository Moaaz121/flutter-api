import 'dart:ui';

import 'package:bawabtalsharq/Utils/Localization/Language/Languages.dart';
import 'package:bawabtalsharq/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bawabtalsharq/Utils/map_util.dart';
import 'package:bawabtalsharq/Utils/styles.dart';

Widget locationDialog(BuildContext context) {
  return Center(
    child: Container(
      height: 70,
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.location_on_rounded,
                size: 14,
              ),
              SizedBox(
                width: 5,
              ),
              buildText(
                Languages.of(context).address,
                12,
                fontWeight: FontWeight.w600,
              ),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          GestureDetector(
            onTap: () {
              MapUtils.openMap(
                30.063216,
                31.341721,
              );
            },
            child: buildText(Languages.of(context).getLocation, 12,
                color: orangeColor,
                fontWeight: FontWeight.w600,
                textDecoration: TextDecoration.underline,
                decorationColor: orangeColor),
          ),
        ],
      ),
      margin: EdgeInsets.only(bottom: 50, left: 16, right: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
    ),
  );
}

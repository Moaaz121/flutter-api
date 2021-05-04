import 'dart:ui';

import 'package:bawabtalsharq/Utils/Localization/Language/Languages.dart';
import 'package:bawabtalsharq/Utils/map_util.dart';
import 'package:bawabtalsharq/Utils/styles.dart';
import 'package:bawabtalsharq/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget locationDialog(BuildContext context, String location) {
  return Center(
    child: Container(
      height: 80,
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 16,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Flex(
                direction: Axis.horizontal,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.location_on_rounded,
                      size: 14,
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Expanded(
                    child: buildText(
                      location,
                      12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
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
          SizedBox(
            height: 16,
          )
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

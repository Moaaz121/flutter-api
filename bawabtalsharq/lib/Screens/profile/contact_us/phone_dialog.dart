import 'dart:ui';

import 'package:bawabtalsharq/Utils/Localization/Language/Languages.dart';
import 'package:bawabtalsharq/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:bawabtalsharq/Utils/styles.dart';

Widget phoneNumberDialog(BuildContext context) {
  return Center(
    child: Container(
      height: 50,
      width: MediaQuery.of(context).size.width,
      child: Center(
        child: GestureDetector(
          onTap: () {
            launch("tel://+215453");
          },
          child: buildText(Languages.of(context).phone, 14,
              color: orangeColor,
              fontWeight: FontWeight.w600,
              textDecoration: TextDecoration.underline,
              decorationColor: orangeColor),
        ),
      ),
      margin: EdgeInsets.only(bottom: 50, left: 16, right: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
    ),
  );
}

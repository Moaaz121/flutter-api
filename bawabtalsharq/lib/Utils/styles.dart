import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

const regularFontFamily = 'Roboto-Regular';
const lightFontFamily = 'Roboto-Light';
const mediumFontFamily = 'Roboto-Medium';
const boldFontFamily = 'Roboto-Bold';
const semiBoldFontFamily = 'Roboto-Medium';
const HeavyBoldFontFamily = 'Roboto-HeavyBold';

const defaultBackgroundColor = Color.fromRGBO(0, 81, 173, 1);
const greyColor = Color.fromRGBO(122, 134, 154, 1);
const payneGray = Color.fromRGBO(62, 86, 119, 1);
const greyHeader = Color.fromRGBO(193, 199, 208, 1);
const textFieldFill = Color.fromRGBO(242, 244, 247, 1);
const textFieldBorder = Color.fromRGBO(239, 239, 244, 1);
const TransparentColor = Color.fromRGBO(255, 255, 255, 1);
const genderColor = Color.fromRGBO(246, 247, 249, 1);
const headerColor = Color.fromRGBO(0, 34, 81, 1);
const buttonBorderColor = Color.fromRGBO(163, 172, 194, 0.3);
const linkColor = Color.fromRGBO(238, 161, 26, 1);
const medicineColor = Color.fromRGBO(152, 188, 229, 1);
const backIconColor = Color.fromRGBO(130, 130, 130, 1);
const backTabColor = Color.fromRGBO(163, 172, 194, 0.14);

const defaultSecondaryBackgroundColor = Color(0xFF3D5A80);
const defaultPrimaryBackgroundColor = Color(0xFFEE6C4D);

const defaultAppBarTheme = AppBarTheme(
    color: Colors.white,
    brightness: Brightness.light,
    textTheme: TextTheme(title: TextStyle(color: Colors.grey, fontSize: 20)));

const defaultTabBarTheme = TabBarTheme(
    labelColor: defaultBackgroundColor,
    indicatorSize: TabBarIndicatorSize.tab,
    indicator: ShapeDecoration(
      shape: ContinuousRectangleBorder(),
      color: Color.fromARGB(255, 253, 235, 226),
    ));

TextStyle titleStyle(
    {Color color = Colors.white,
    double fontSize = 16,
    String fontFamily = 'Font-Regular'}) {
  return TextStyle(fontFamily: fontFamily, color: color, fontSize: fontSize);
}

// Start Karem

// end karem

// Start Asmaa
const defaultOrangeColor = Color(0xFFe16036);
const textColor = Color(0xFF5b5b5b);
// end Asmaa

// Start Bahaa

// end Bahaa

// Start Mosdik

// end Mosdik

// Start Moaaz

// end Moaaz

// Start Islam

// end Islam

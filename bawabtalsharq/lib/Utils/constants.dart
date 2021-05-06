import 'package:bawabtalsharq/Model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:bawabtalsharq/Utils/Localization/LanguageHelper.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

enum languages { English, Arabic, Indian }

class Constants {
  static String appName = "Login App";
  static int isActive = 0;
  static int userType = 0;

  static languages languageId = languages.English;
  static TextDirection textDirection = Constants.languageId == languages.Arabic
      ? TextDirection.rtl
      : TextDirection.ltr;

  static updateTextDirection() {
    textDirection = Constants.languageId == languages.Arabic
        ? TextDirection.rtl
        : TextDirection.ltr;
  }

  //Colors for theme
  static Color lightPrimary = Color(0xfffcfcff);
  static Color darkPrimary = Color(0xff212226);
  static Color lightAccent = Colors.blue;
  static Color darkAccent = Colors.lightBlue;
  static Color lightBG = Color(0xfffcfcff);
  static Color darkBG = Color(0xff313131);
  static Color badgeColor = Colors.red;
  static Color whitegray = Color(0xfff8f8f8);

  static ThemeData lightTheme = ThemeData(
    backgroundColor: lightBG,
    primaryColor: lightPrimary,
    accentColor: lightAccent,
    cursorColor: lightAccent,
    scaffoldBackgroundColor: lightBG,
    appBarTheme: AppBarTheme(
      elevation: 0,
      textTheme: TextTheme(
        title: TextStyle(
          color: darkBG,
          fontSize: 18.0,
          fontWeight: FontWeight.w800,
        ),
      ),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    backgroundColor: darkBG,
    primaryColor: darkPrimary,
    accentColor: darkAccent,
    scaffoldBackgroundColor: darkBG,
    cursorColor: darkAccent,
    appBarTheme: AppBarTheme(
      elevation: 0,
      textTheme: TextTheme(
        title: TextStyle(
          color: lightBG,
          fontSize: 18.0,
          fontWeight: FontWeight.w800,
        ),
      ),
    ),
  );

  TextStyle labelStyle({Color color, double fontSize}) {
    return TextStyle(color: color ?? Colors.black, fontSize: fontSize ?? 14);
  }

  static String getLanguage() {
    String lang;
    if (LanguageHelper.isEnglish)
      lang = 'en';
    else
      lang = 'ar';
    return lang;
  }

  static saveUser(String userJason) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String user = jsonEncode(userJason);
    await prefs.setString('user', user);
  }

  static Future<String> getUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Map json = jsonDecode(prefs.getString('user'));
    // var user = UserModel().data.fromJson();
    return prefs.getString('apiKey') ?? 0;
  }
}

// Start Karem

// end karem

// Start Asmaa
String audioCall = '--CALL';
String videoCall = '--VIDEO';
String closeMeet = '--close';
String joinAudioMeet = '--JOIN-AUDIO';
String joinVideoMeet = '--JOIN-VIDEO';

// end Asmaa

// Start Bahaa
List<String> languagesArr = ['English', 'العربية'];

// end Bahaa

// Start Mosdik

// end Mosdik

// Start Moaaz

// end Moaaz

// Start Islam

// end Islam

import 'dart:convert';

import 'package:bawabtalsharq/Model/user_model.dart';
import 'package:bawabtalsharq/Utils/Localization/LanguageHelper.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum languages { English, Arabic, Indian }

class Constants {
  static String appName = "Login App";
  static int isActive = 0;
  static int userType = 0;
  static SharedPreferences sharedPreferences;

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

// Start Bahaa
  static String getLanguage() {
    String lang;
    if (LanguageHelper.isEnglish)
      lang = 'en';
    else
      lang = 'ar';
    return lang;
  }

  static Future<UserModel> getUserInfo() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    Map<String, dynamic> userMap;
    final String userStr = prefs.getString('user');
    if (userStr != null) {
      userMap = jsonDecode(userStr) as Map<String, dynamic>;
    }

    if (userMap != null) {
      final UserModel user = UserModel.fromJson(userMap);
      print(user);
      return user;
    }
    return null;
  }

  static UserModel getUserInfo2() {
    Map<String, dynamic> userMap;
    final String userStr = sharedPreferences.getString('user');
    if (userStr != null) {
      userMap = jsonDecode(userStr) as Map<String, dynamic>;
    }

    if (userMap != null) {
      final UserModel user = UserModel.fromJson(userMap);
      print(user);
      return user;
    }
    return null;
  }

  static initSharedPref() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static dynamic getDate({@required String key}) {
    return sharedPreferences.get(key);
  }

  static String getCurrency() {
    return '&currency_id=' + sharedPreferences.get('currency');
  }

  static String getCountry() {
    return '&country=' + sharedPreferences.get('country');
  }

  static String getCountryCode() {
    return '&code=' + sharedPreferences.get('country');
  }

  static dynamic removeDate({@required String key}) {
    return sharedPreferences.remove(key);
  }

  static void saveCurrencyId({@required String currency}) {
    sharedPreferences.setString('currency', currency);
  }

  static void saveCountryCode({@required String country}) {
    sharedPreferences.setString('country', country);
  }

  static String getCurrency2() {
    return sharedPreferences.get('currency');
  }

  static String getCountry2() {
    return sharedPreferences.get('country');
  }
// end Bahaa
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

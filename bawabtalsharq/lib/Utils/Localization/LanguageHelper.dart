import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:bawabtalsharq/main.dart';

import '../../main.dart';

class LanguageHelper {
  static bool _isEnglish = true;

  static bool get isEnglish => _isEnglish;
  static const String _prefSelectedLanguageCode = "SelectedLanguageCode";

  static Future<Locale> getLocale() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    String languageCode = _prefs.getString(_prefSelectedLanguageCode) ??
        'en';
    _isEnglish = languageCode == "en" ? true : false;
    return _locale(languageCode);
  }

  static Locale _locale(String languageCode) {
    return languageCode != null && languageCode.isNotEmpty
        ? Locale(languageCode, '')
        : Locale("en", '');
  }

  static Future changeLanguage(
      BuildContext context, String selectedLanguageCode) async {
    _isEnglish =
    selectedLanguageCode == "en" ? true : false;
    var _locale = await _setLocale(selectedLanguageCode);
    BawabtAlsharqApp.setLocale(context, _locale);
  }

  static Future<Locale> _setLocale(String languageCode) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    await _prefs.setString(_prefSelectedLanguageCode, languageCode);
    return _locale(languageCode);
  }
}

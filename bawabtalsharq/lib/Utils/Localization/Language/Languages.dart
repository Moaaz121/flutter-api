import 'package:flutter/cupertino.dart';

abstract class Languages {
  static Languages of(BuildContext context) {
    return Localizations.of<Languages>(context, Languages);
  }

  String get name;
  String get notification;
  String get language;
// Start Karem

// end karem

// Start Asmaa
  String get allCategories;
  String get chats;
  String get online;
  String get meetingWith;
  String get incomingCall;
  String get incomingVideoCall;
  String get calling;

// end Asmaa

// Start Bahaa
  String get saved;
  String get compares;
  String get history;
  String get quotation;
  String get messageCenter;
  String get userGuide;
  String get logOut;
  String get items;
// end Bahaa

// Start Mosdik

  String get home;
  String get feature;
  String get myAccount;
  String get search;

  String get requestForQ;
  String get joinUs;
  String get ourGoldenSupplier;
  String get mostPopularIn;
  String get mostPopularByCategories;
  String get seeAll;
  String get more;
  String get egypt;

  String get intro1Title;
  String get intro1SubTitle;
  String get intro2Title;
  String get intro2SubTitle;
  String get intro3Title;
  String get intro3SubTitle;
  String get next;

// end Mosdik

// Start Moaaz

// end Moaaz

// Start Islam
  String get settings;
  String get requestForQuotation;
  String get languages;
  String get signUp;
  String get login;
  String get userName;
  String get password;
  String get forgetPassword;
  String get alreadyHaveAccount;
  String get signIn;
// end Islam
}

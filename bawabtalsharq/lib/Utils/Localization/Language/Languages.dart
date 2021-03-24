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

// end Asmaa

// Start Bahaa

// end Bahaa

// Start Mosdik

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

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

  String get home;
  String get feature ;
  String get myAccount;
  String get search;
  String get allCategories;
  String get requestForQ ;
  String get joinUs ;
  String get ourGoldenSupplier;
  String get mostPopularIn;
  String get mostPopularByCategories;
  String get seeAll;
  String get more;
  String get egypt;

// end Mosdik

// Start Moaaz

// end Moaaz

// Start Islam

// end Islam
}

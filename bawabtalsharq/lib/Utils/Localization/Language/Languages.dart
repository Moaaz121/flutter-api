import 'package:flutter/cupertino.dart';

abstract class Languages {
  static Languages of(BuildContext context) {
    return Localizations.of<Languages>(context, Languages);
  }

  String get name;
  String get notification;
  String get language;
// Start Karem
  String get requestForQutation;
  String get postSourcingRequestNow;
// end karem

// Start Asmaa
  String get allCategories;

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
  String get productName;
  String get inputProduct;
  String get categoryName;
  String get advanced;
  String get port;
  String get paymentTerm;
  String get submit;
  String get dropCategory;
  String get sourcingPurpose;
  String get dropSourcing;
  String get quantity;
  String get dropQuantity;
  String get tradeTerms;
  String get dropTrade;
  String get details;
  String get inputDetails;
  String get uploadDocument;
  String get supplierCapability;
  String get certifications;
  String get dropCertificate;
  String get requirements;
  String get inputRequire;
  String get shipping;
  String get shippingMethod;
  String get dropShipping;
  String get destination;
  String get dropDestination;
  String get leadTime;
  String get check1;
  String get check2;
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

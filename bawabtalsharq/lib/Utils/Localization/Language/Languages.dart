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
  String get categories;

// end Asmaa

// Start Bahaa
  String get saved;
  String get compares;
  String get history;
  String get quotation;
  String get messageCenter;
  String get contactUs;
  String get aboutUs;
  String get accountInfo;
  String get location;
  String get phoneNumber;
  String get sendMessage;
  String get userGuide;
  String get logOut;
  String get items;
  String get address;
  String get phone;
  String get getLocation;
  String get cancel;
  String get sort;
  String get blueShoes;
  String get shoesPrice;
  String get arrange;
  String get ascending;
  String get descending;
  String get popularity;
  String get mostPop;
  String get newIn;
  String get bestRating;
  String get lowestPrice;
  String get highestPrice;
  String get color;
  String get faq;
  String get privacy;

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

  String get email;
  String get subject;
  String get writeAMessage;

  String get filter;
  String get done;
  String get category;
  String get expressShipping;
  String get shippedFrom;
  String get shippedFromAbroad;
  String get rating;
  String get sellerScore;
  String get brand;
  String get price;
  String get from;
  String get to;
  String get discount;
  String get sizes;
  String get colors;
  String get gender;
  String get signUp;
  String get plzSecect;
  String get buyer;
  String get seller;
  String get both;
  String get fullName;
  String get loginPass;
  String get confirmPass;
  String get companyName;
  String get tel;
  String get n;
  String get bawabtAlsharq;
  String get furniture;
  String get startChat;
  String get allProducts;
  String get info;
  String get superior;

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
  String get interesting;
  String get btnText;
  String get iconText;
// end Moaaz

// Start Islam
  String get settings;
  String get requestForQuotation;
  String get languages;
  String get login;
  String get userName;
  String get password;
  String get forgetPassword;
  String get alreadyHaveAccount;
  String get signIn;
  String get ourGroup;
  String get ourGroupCompanies;
  String get searchByCategories;
  String get resentSearch;
  String get handmadeCrafts;
  String get quoteDetails;
  String get backToChat;
  String get minOrder;
  String get unitPrice;
  String get shippingTerm;
  String get paymentTerms;
  String get productDetails;
  String get send;
  String get createNewPassword;
  String get emailAddress;

// end Islam
}

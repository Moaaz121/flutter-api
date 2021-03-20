import 'Strings Data/strings_ar.dart';
import 'Strings Data/strings_en.dart';
import 'Strings Data/strings_inr.dart';
import 'constants.dart';

class Strings {
  String appName() {
    switch (Constants.languageId) {
      case languages.Arabic:
        return StringsAR.APP_NAME;
        break;
      case languages.Indian:
        return StringsINR.APP_NAME;
        break;
      default:
        return StringsEN.APP_NAME;
    }
  }

// Start Karem

  String home() {
    switch (Constants.languageId) {
      case languages.Arabic:
        return StringsAR.home;
        break;
      case languages.Indian:
        return StringsINR.home;
        break;
      default:
        return StringsEN.home;
    }
  }

  String feature() {
    switch (Constants.languageId) {
      case languages.Arabic:
        return StringsAR.feature;
        break;
      case languages.Indian:
        return StringsINR.feature;
        break;
      default:
        return StringsEN.feature;
    }
  }

  String notifications() {
    switch (Constants.languageId) {
      case languages.Arabic:
        return StringsAR.notifications;
        break;
      case languages.Indian:
        return StringsINR.notifications;
        break;
      default:
        return StringsEN.notifications;
    }
  }

  String myAccount() {
    switch (Constants.languageId) {
      case languages.Arabic:
        return StringsAR.myAccount;
        break;
      case languages.Indian:
        return StringsINR.myAccount;
        break;
      default:
        return StringsEN.myAccount;
    }
  }

  String search() {
    switch (Constants.languageId) {
      case languages.Arabic:
        return StringsAR.search;
        break;
      case languages.Indian:
        return StringsINR.search;
        break;
      default:
        return StringsEN.search;
    }
  }

  String requestForQ() {
    switch (Constants.languageId) {
      case languages.Arabic:
        return StringsAR.requestForQ;
        break;
      case languages.Indian:
        return StringsINR.requestForQ;
        break;
      default:
        return StringsEN.requestForQ;
    }
  }

  String joinUs() {
    switch (Constants.languageId) {
      case languages.Arabic:
        return StringsAR.joinUs;
        break;
      case languages.Indian:
        return StringsINR.joinUs;
        break;
      default:
        return StringsEN.joinUs;
    }
  }

  String ourGoldenSupplier() {
    switch (Constants.languageId) {
      case languages.Arabic:
        return StringsAR.ourGoldenSupplier;
        break;
      case languages.Indian:
        return StringsINR.ourGoldenSupplier;
        break;
      default:
        return StringsEN.ourGoldenSupplier;
    }
  }

  String mostPopularIn() {
    switch (Constants.languageId) {
      case languages.Arabic:
        return StringsAR.mostPopularIn;
        break;
      case languages.Indian:
        return StringsINR.mostPopularIn;
        break;
      default:
        return StringsEN.mostPopularIn;
    }
  }

  String mostPopularByCategories() {
    switch (Constants.languageId) {
      case languages.Arabic:
        return StringsAR.mostPopularByCategories;
        break;
      case languages.Indian:
        return StringsINR.mostPopularByCategories;
        break;
      default:
        return StringsEN.mostPopularByCategories;
    }
  }

  String seeAll() {
    switch (Constants.languageId) {
      case languages.Arabic:
        return StringsAR.seeAll;
        break;
      case languages.Indian:
        return StringsINR.seeAll;
        break;
      default:
        return StringsEN.seeAll;
    }
  }

  String more() {
    switch (Constants.languageId) {
      case languages.Arabic:
        return StringsAR.more;
        break;
      case languages.Indian:
        return StringsINR.more;
        break;
      default:
        return StringsEN.more;
    }
  }

// end karem

// Start Asmaa
  String allCategories() {
    switch (Constants.languageId) {
      case languages.Arabic:
        return StringsAR.all_categories;
        break;
      case languages.Indian:
        return StringsINR.all_categories;
        break;
      default:
        return StringsEN.all_categories;
    }
  }

// end Asmaa

// Start Bahaa

// end Bahaa

// Start Mosdik

  String category() {
    switch (Constants.languageId) {
      case languages.Arabic:
        return StringsAR.category;
        break;
      case languages.Indian:
        return StringsINR.category;
        break;
      default:
        return StringsEN.category;
    }
  }

// end Mosdik

// Start Moaaz

// end Moaaz

// Start Islam

// end Islam

}

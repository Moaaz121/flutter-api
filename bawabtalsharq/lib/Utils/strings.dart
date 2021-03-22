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
  String saved() {
    switch (Constants.languageId) {
      case languages.Arabic:
        return StringsAR.saved;
        break;
      case languages.Indian:
        return StringsINR.saved;
        break;
      default:
        return StringsEN.saved;
    }
  }

  String compares() {
    switch (Constants.languageId) {
      case languages.Arabic:
        return StringsAR.compares;
        break;
      case languages.Indian:
        return StringsINR.compares;
        break;
      default:
        return StringsEN.compares;
    }
  }

  String history() {
    switch (Constants.languageId) {
      case languages.Arabic:
        return StringsAR.history;
        break;
      case languages.Indian:
        return StringsINR.history;
        break;
      default:
        return StringsEN.history;
    }
  }
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
  String signUp() {
    switch (Constants.languageId) {
      case languages.Arabic:
        return StringsAR.signUp;
        break;
      case languages.Indian:
        return StringsINR.signUp;
        break;
      default:
        return StringsEN.signUp;
    }
  }

  String logIn() {
    switch (Constants.languageId) {
      case languages.Arabic:
        return StringsAR.login;
        break;
      case languages.Indian:
        return StringsINR.login;
        break;
      default:
        return StringsEN.login;
    }
  }

  String userName() {
    switch (Constants.languageId) {
      case languages.Arabic:
        return StringsAR.userName;
        break;
      case languages.Indian:
        return StringsINR.userName;
        break;
      default:
        return StringsEN.userName;
    }
  }

  String password() {
    switch (Constants.languageId) {
      case languages.Arabic:
        return StringsAR.password;
        break;
      case languages.Indian:
        return StringsINR.password;
        break;
      default:
        return StringsEN.password;
    }
  }

  String forgetPassword() {
    switch (Constants.languageId) {
      case languages.Arabic:
        return StringsAR.forgetPassword;
        break;
      case languages.Indian:
        return StringsINR.forgetPassword;
        break;
      default:
        return StringsEN.forgetPassword;
    }
  }

  String alreadyHaveAnAccount() {
    switch (Constants.languageId) {
      case languages.Arabic:
        return StringsAR.alreadyHaveAccount;
        break;
      case languages.Indian:
        return StringsINR.alreadyHaveAccount;
        break;
      default:
        return StringsEN.alreadyHaveAccount;
    }
  }

  String signIn() {
    switch (Constants.languageId) {
      case languages.Arabic:
        return StringsAR.signIn;
        break;
      case languages.Indian:
        return StringsINR.signIn;
        break;
      default:
        return StringsEN.signIn;
    }
  }

// end Islam

}

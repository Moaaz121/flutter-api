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

  String requestForQutation() {
    switch (Constants.languageId) {
      case languages.Arabic:
        return StringsAR.requestForQutation;
        break;
      case languages.Indian:
        return StringsINR.requestForQutation;
        break;
      default:
        return StringsEN.requestForQutation;
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


  String postSourcingRequestNow() {
    switch (Constants.languageId) {
      case languages.Arabic:
        return StringsAR.postSourcingRequestNow;
        break;
      case languages.Indian:
        return StringsINR.postSourcingRequestNow;
        break;
      default:
        return StringsEN.postSourcingRequestNow;
    }
  }
// end Mosdik

// Start Moaaz

  String intro1Title() {
    switch (Constants.languageId) {
      case languages.Arabic:
        return StringsAR.intro1Title;
        break;
      case languages.Indian:
        return StringsINR.intro1Title;
        break;
      default:
        return StringsEN.intro1Title;
    }
  }

  String intro1SubTitle() {
    switch (Constants.languageId) {
      case languages.Arabic:
        return StringsAR.intro1SubTitle;
        break;
      case languages.Indian:
        return StringsINR.intro1SubTitle;
        break;
      default:
        return StringsEN.intro1SubTitle;
    }
  }

  String intro2Title() {
    switch (Constants.languageId) {
      case languages.Arabic:
        return StringsAR.intro2Title;
        break;
      case languages.Indian:
        return StringsINR.intro2Title;
        break;
      default:
        return StringsEN.intro2Title;
    }
  }

  String intro2SubTitle() {
    switch (Constants.languageId) {
      case languages.Arabic:
        return StringsAR.intro2SubTitle;
        break;
      case languages.Indian:
        return StringsINR.intro2SubTitle;
        break;
      default:
        return StringsEN.intro2SubTitle;
    }
  }

  String intro3Title() {
    switch (Constants.languageId) {
      case languages.Arabic:
        return StringsAR.intro3Title;
        break;
      case languages.Indian:
        return StringsINR.intro3Title;
        break;
      default:
        return StringsEN.intro3Title;
    }
  }

  String intro3SubTitle() {
    switch (Constants.languageId) {
      case languages.Arabic:
        return StringsAR.intro3SubTitle;
        break;
      case languages.Indian:
        return StringsINR.intro3SubTitle;
        break;
      default:
        return StringsEN.intro3SubTitle;
    }
  }

  String next() {
    switch (Constants.languageId) {
      case languages.Arabic:
        return StringsAR.next;
        break;
      case languages.Indian:
        return StringsINR.next;
        break;
      default:
        return StringsEN.next;
    }
  }

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

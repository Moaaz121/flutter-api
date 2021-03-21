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
  String signUp() {
    switch (Constants.languageId) {
      case languages.Arabic:
        return StringsAR.Sign_up;
        break;
      case languages.Indian:
        return StringsINR.Sign_up;
        break;
      default:
        return StringsEN.Sign_up;
    }
  }

  String logIn() {
    switch (Constants.languageId) {
      case languages.Arabic:
        return StringsAR.Login;
        break;
      case languages.Indian:
        return StringsINR.Login;
        break;
      default:
        return StringsEN.Login;
    }
  }

  String userName() {
    switch (Constants.languageId) {
      case languages.Arabic:
        return StringsAR.UserName;
        break;
      case languages.Indian:
        return StringsINR.UserName;
        break;
      default:
        return StringsEN.UserName;
    }
  }

  String password() {
    switch (Constants.languageId) {
      case languages.Arabic:
        return StringsAR.Password;
        break;
      case languages.Indian:
        return StringsINR.Password;
        break;
      default:
        return StringsEN.Password;
    }
  }

  String forgetPassword() {
    switch (Constants.languageId) {
      case languages.Arabic:
        return StringsAR.ForgetPassword;
        break;
      case languages.Indian:
        return StringsINR.ForgetPassword;
        break;
      default:
        return StringsEN.ForgetPassword;
    }
  }

  String alreadyHaveAnAccount() {
    switch (Constants.languageId) {
      case languages.Arabic:
        return StringsAR.Already_Have_An_Account;
        break;
      case languages.Indian:
        return StringsINR.Already_Have_An_Account;
        break;
      default:
        return StringsEN.Already_Have_An_Account;
    }
  }

// end Islam

}

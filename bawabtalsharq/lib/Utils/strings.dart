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

// end Islam

}

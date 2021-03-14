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

// end Mosdik

// Start Moaaz

// end Moaaz

// Start Islam

// end Islam

}

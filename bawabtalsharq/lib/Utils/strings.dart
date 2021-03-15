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
  String home = 'Home';
  String feature = 'Feature';
  String notifications = 'Notifications';
  String myAccount = 'My Account';
  String search = 'Search';
  String allCategories = 'All Categories';
  String requestForQ = 'Request For Quotations';
  String joinUs = 'Join For Us';
  String ourGoldenSupplier = 'Our Golden Supplier';
  String mostPopularIn = 'Most Popular In ';
  String mostPopularByCategories = 'Most Popular By Categories';
  String seeAll = 'See All';
  String more = 'More';
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

// end Islam

}

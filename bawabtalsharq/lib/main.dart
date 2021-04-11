import 'package:bawabtalsharq/Screens/all_categories_screen.dart';
import 'package:bawabtalsharq/Screens/feature_screen.dart';
import 'package:bawabtalsharq/Screens/home_screen.dart';
import 'package:bawabtalsharq/Screens/individual_product_screen.dart';
import 'package:bawabtalsharq/Screens/intro_screen.dart';
import 'package:bawabtalsharq/Screens/login_screen.dart';
import 'package:bawabtalsharq/Screens/profile/message_center/message_center_screen.dart';
import 'package:bawabtalsharq/Screens/profile/message_center/qoute_details_screen.dart';
import 'package:bawabtalsharq/Screens/request_for_qutation.dart';
import 'package:bawabtalsharq/Screens/search/categories_filter_screen.dart';
import 'package:bawabtalsharq/Screens/search/search_filter_screen.dart';
import 'package:bawabtalsharq/Screens/search/search_result_screen.dart';
import 'package:bawabtalsharq/Screens/sub_category_screen.dart';
import 'package:bawabtalsharq/Screens/search/search_screen.dart';
import 'package:bawabtalsharq/Screens/pricing/pricing_screen.dart';
import 'package:bawabtalsharq/Screens/settings_screen.dart';
import 'package:bawabtalsharq/Screens/sign_up_screen.dart';
import 'package:bawabtalsharq/Screens/splash_screen.dart';
import 'package:bawabtalsharq/Utils/Localization/AppLocalizationDelgate.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'Screens/interesting_screen.dart';
import 'Screens/main_srceen.dart';
import 'Screens/notification_screen.dart';
import 'Screens/profile_screen.dart';
import 'Screens/request_for_quatation_screen.dart';
import 'Screens/request_for_qutation.dart';
import 'Screens/search/color_filter_screen.dart';
import 'Screens/search/list_filter_screen.dart';
import 'Utils/Localization/LanguageHelper.dart';

void main() => runApp(
      DevicePreview(
        enabled: true,
        builder: (context) => BawabtAlsharqApp(), // Wrap you`
        // r app
      ),
    );

class BawabtAlsharqApp extends StatefulWidget {
  static void setLocale(BuildContext context, Locale newLocale) {
    var state = context.findAncestorStateOfType<_BawabtAlsharqAppState>();
    state.setLocale(newLocale);
  }

  @override
  _BawabtAlsharqAppState createState() => _BawabtAlsharqAppState();
}

class _BawabtAlsharqAppState extends State<BawabtAlsharqApp> {
  Locale _locale;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.deepOrange),
      home: SplashScreen(),
      routes: {
        ScreenRoutes.splashScreen: (_) => SplashScreen(),
        ScreenRoutes.introScreen: (_) => IntroScreen(),
        ScreenRoutes.loginScreen: (_) => LoginScreen(),
        ScreenRoutes.homeScreen: (_) => HomeScreen(),
        ScreenRoutes.mainScreen: (_) => MainScreen(),
        ScreenRoutes.notificationScreen: (_) => NotificationScreen(),
        ScreenRoutes.profileScreen: (_) => ProfileScreen(),
        ScreenRoutes.featureScreen: (_) => FeatureScreen(),
        ScreenRoutes.categoriesScreen: (_) => AllCategories(),
        ScreenRoutes.settingsScreen: (_) => SettingsScreen(),
        ScreenRoutes.requestForQuotation: (_) => RequestForQScreen(),
        ScreenRoutes.postQuotationRequest: (_) => Requestforqutation(),
        ScreenRoutes.individualProduct: (_) => IndividualProduct(),
        ScreenRoutes.listFilter: (_) => ListFilterScreen(),
        ScreenRoutes.searchScreen: (_) => SearchScreen(),
        ScreenRoutes.searchResultScreen: (_) => SearchResult(),
        ScreenRoutes.categoriesFilterScreen: (_) => SearchCategories(),
        ScreenRoutes.colorFilterScreen: (_) => ColorScreen(),
        ScreenRoutes.filterScreen: (_) => FilterScreen(),
        ScreenRoutes.messageCenter: (_) => MessageCenter(),
        ScreenRoutes.signUpScreen: (_) => SignUpScreen(),
        ScreenRoutes.interestingScreen: (_) => Interesting(),
        ScreenRoutes.subCategoryScreen: (_) => SubCategoryScreen(),
      },
      locale: _locale,
      supportedLocales: supportedLocales,
      localizationsDelegates: localizationsDelegates,
      localeResolutionCallback: localeResolutionCallback,
    );
  }

  @override
  void didChangeDependencies() async {
    LanguageHelper.getLocale().then((locale) {
      setState(() {
        _locale = locale;
      });
    });
    super.didChangeDependencies();
  }

  void setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }
}

extension Localization on _BawabtAlsharqAppState {
  Iterable<Locale> get supportedLocales => [
        Locale('en', ''),
        Locale('ar', ''),
      ];

  Iterable<LocalizationsDelegate<dynamic>> get localizationsDelegates => [
        AppLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ];

  LocaleResolutionCallback get localeResolutionCallback =>
      (locale, supportedLocales) {
        for (var supportedLocale in supportedLocales) {
          if (supportedLocale?.languageCode == locale?.languageCode &&
              supportedLocale?.countryCode == locale?.countryCode) {
            return supportedLocale;
          }
        }
        return supportedLocales?.first;
      };
}

class ScreenRoutes {
  static const String splashScreen = '/splashScreen';
  static const String introScreen = '/introScreen';
  static const String loginScreen = '/loginScreen';
  static const String homeScreen = '/homeScreen';
  static const String mainScreen = '/mainScreen';
  static const String notificationScreen = '/notificationScreen';
  static const String profileScreen = '/profileScreen';
  static const String featureScreen = '/featureScreen';
  static const String categoriesScreen = '/allCategories';
  static const String settingsScreen = '/settingsScreen';
  static const String requestForQuotation = '/requestForQuotation';
  static const String postQuotationRequest = '/postQuotationRequest';
  static const String individualProduct = '/individual_product_screen';
  static const String filterScreen = '/search_filter_screen';
  static const String searchScreen = '/search_screen';
  static const String searchResultScreen = '/search_result_screen';
  static const String categoriesFilterScreen = '/categories_filter_screen';
  static const String colorFilterScreen = '/color_filter_screen';
  static const String listFilter = '/list_filter_screen';
  static const String messageCenter = '/message_center_screen';
  static const String signUpScreen = '/sign_up_screen';
  static const String interestingScreen = '/interesting_screen';
  static const String subCategoryScreen = '/sub_category_screen';
}

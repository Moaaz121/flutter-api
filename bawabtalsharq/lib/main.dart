import 'package:bawabtalsharq/Screens/Chat/chat_screen.dart';
import 'package:bawabtalsharq/Screens/NoInternetScreen.dart';
import 'package:bawabtalsharq/Screens/all_categories_screen.dart';
import 'package:bawabtalsharq/Screens/forget_password/forget_password_screen.dart';
import 'package:bawabtalsharq/Screens/forget_password/new_password_screen.dart';
import 'package:bawabtalsharq/Screens/home_screen.dart';
import 'package:bawabtalsharq/Screens/individualProduct/individual_product_screen.dart';
import 'package:bawabtalsharq/Screens/intro_screen.dart';
import 'package:bawabtalsharq/Screens/login_screen.dart';
import 'package:bawabtalsharq/Screens/profile/faq/faq_screen.dart';
import 'package:bawabtalsharq/Screens/profile/history/history_screen.dart';
import 'package:bawabtalsharq/Screens/profile/message_center/message_center_screen.dart';
import 'package:bawabtalsharq/Screens/profile/message_center/qoute_details_screen.dart';
import 'package:bawabtalsharq/Screens/profile/my_account/my_account_screen.dart';
import 'package:bawabtalsharq/Screens/profile/pricing/pricing_screen.dart';
import 'package:bawabtalsharq/Screens/profile/privacy/privacy_screen.dart';
import 'package:bawabtalsharq/Screens/profile/saved/saved_screen.dart';
import 'package:bawabtalsharq/Screens/request_for_qutation.dart';
import 'package:bawabtalsharq/Screens/search/search_result_screen.dart';
import 'package:bawabtalsharq/Screens/search/search_screen.dart';
import 'package:bawabtalsharq/Screens/settings_screen.dart';
import 'package:bawabtalsharq/Screens/sign_up_screen.dart';
import 'package:bawabtalsharq/Screens/splash_screen.dart';
import 'package:bawabtalsharq/Screens/sub_category_screen.dart';
import 'package:bawabtalsharq/Screens/suppliers/golden_suppliers_screen.dart';
import 'package:bawabtalsharq/Utils/constants.dart';
import 'package:bawabtalsharq/Utils/styles.dart';
import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'Screens/interesting_screen.dart';
import 'Screens/main_srceen.dart';
import 'Screens/notification_screen.dart';
import 'Screens/profile/about_us/aboutUs_screen.dart';
import 'Screens/profile/contact_us/send_message.dart';
import 'Screens/profile/message_center/list_message_screen.dart';
import 'Screens/profile/my_account/change_password_screen.dart';
import 'Screens/profile/my_account/update_profile_screen.dart';
import 'Screens/profile_screen.dart';
import 'Screens/request_for_quatation_screen.dart';
import 'Screens/request_for_qutation.dart';
import 'Screens/search/list_filter_screen.dart';
import 'Screens/suppliers/supplier_profile_screen.dart';
import 'Utils/Localization/AppLocalizationDelgate.dart';
import 'Utils/Localization/LanguageHelper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  await Constants.initSharedPref();

  if (Constants.getDate(key: 'currency') == null) {
    Constants.saveCurrencyId(currency: '1');
  }
  if (Constants.getDate(key: 'country') == null) {
    Constants.saveCountryCode(country: 'Egypt');
  }

  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  //FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
  runApp(
    DevicePreview(
      enabled: false,
      builder: (context) => MaterialApp(
          builder: DevicePreview.appBuilder,
          debugShowCheckedModeBanner: false,
          theme: ThemeData(primaryColor: orangeColor, accentColor: orangeColor),
          home: BawabtAlsharqApp()),
    ),
  );
}

class BawabtAlsharqApp extends StatefulWidget {
  static void setLocale(BuildContext context, Locale newLocale) {
    var state = context.findAncestorStateOfType<_BawabtAlsharqAppState>();
    state.setLocale(newLocale);
  }

  @override
  _BawabtAlsharqAppState createState() => _BawabtAlsharqAppState();
}

class _BawabtAlsharqAppState extends State<BawabtAlsharqApp> {
  int notificationId = -1;
  Locale _locale;
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      new FlutterLocalNotificationsPlugin();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // FirebaseCrashlytics.instance.crash();
    FirebaseMessaging firebaseMessaging = new FirebaseMessaging();
    firebaseMessaging.subscribeToTopic('UserAdmin');

    var initializationSettingsAndroid =
        new AndroidInitializationSettings('@mipmap/ic_launcher');

    var initializationSettingsIOS = new IOSInitializationSettings(
        onDidReceiveLocalNotification: onDidRecieveLocalNotification);

    var initializationSettings = new InitializationSettings(
        android: initializationSettingsAndroid, iOS: initializationSettingsIOS);

    flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onSelectNotification: onSelectNotification);

    FirebaseMessaging.instance
        .getInitialMessage()
        .then((RemoteMessage message) {
      if (message != null) {}
    });

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification notification = message.notification;
      AndroidNotification android = message.notification?.android;
      if (notification != null && android != null) {
        onDidRecieveLocalNotification(notificationId + 1, notification.title,
            notification.body, "payload");
      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {});
  }

  Future displayNotification(RemoteNotification message) async {
    var androidPlatformChannelSpecifics = new AndroidNotificationDetails(
        '1', 'flutterfcm', 'description',
        importance: Importance.high, priority: Priority.max);
    var iOSPlatformChannelSpecifics = new IOSNotificationDetails();
    var platformChannelSpecifics = new NotificationDetails(
        android: androidPlatformChannelSpecifics,
        iOS: iOSPlatformChannelSpecifics);
    await flutterLocalNotificationsPlugin.show(
      0,
      message.title,
      message.body,
      platformChannelSpecifics,
      payload: 'hello',
    );
  }

  Future onSelectNotification(String payload) async {
    if (payload != null) {
      debugPrint('notification payload: ' + payload);
    }
    await Fluttertoast.showToast(
        msg: "Notification Clicked",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: orangeColor,
        textColor: Colors.white,
        fontSize: 16.0);
    /*Navigator.push(
      context,
      new MaterialPageRoute(builder: (context) => new SecondScreen(payload)),
    );*/
  }

  Future onDidRecieveLocalNotification(
      int id, String title, String body, String payload) async {
    // display a dialog with the notification details, tap ok to go to another page
    showDialog(
      context: context,
      builder: (BuildContext context) => new CupertinoAlertDialog(
        title: new Text(title),
        content: new Text(body),
        actions: [
          CupertinoDialogAction(
            isDefaultAction: true,
            child: new Text('Ok'),
            onPressed: () async {
              Navigator.of(context, rootNavigator: true).pop();
              await Fluttertoast.showToast(
                  msg: "Notification Clicked",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  backgroundColor: orangeColor,
                  textColor: Colors.white,
                  fontSize: 16.0);
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: orangeColor, accentColor: orangeColor),
      home: SplashScreen(),
      // navigatorObservers: [AnalyticsService().getAnalyticsOberver()],
      routes: {
        ScreenRoutes.splashScreen: (_) => SplashScreen(),
        ScreenRoutes.introScreen: (_) => IntroScreen(),
        ScreenRoutes.loginScreen: (_) => LoginScreen(),
        ScreenRoutes.homeScreen: (_) => HomeScreen(),
        ScreenRoutes.mainScreen: (_) => MainScreen(),
        ScreenRoutes.notificationScreen: (_) => NotificationScreen(),
        ScreenRoutes.profileScreen: (_) => ProfileScreen(),
        ScreenRoutes.categoriesScreen: (_) => AllCategories(),
        ScreenRoutes.settingsScreen: (_) => SettingsScreen(),
        ScreenRoutes.requestForQuotation: (_) => RequestForQScreen(),
        ScreenRoutes.postQuotationRequest: (_) => Requestforqutation(),
        ScreenRoutes.individualProduct: (context) =>
            IndividualProduct(ModalRoute.of(context).settings.arguments),
        ScreenRoutes.listFilter: (_) => ListFilterScreen(),
        ScreenRoutes.searchScreen: (_) => SearchScreen(),
        ScreenRoutes.searchResultScreen: (_) => SearchResult(),
        ScreenRoutes.categoriesFilterScreen: (_) => SearchCategories(),
        ScreenRoutes.filterScreen: (_) => FilterScreen(),
        ScreenRoutes.messageCenter: (_) => MessageCenter(),
        ScreenRoutes.signUpScreen: (_) => SignUpScreen(),
        ScreenRoutes.interestingScreen: (_) => Interesting(),
        ScreenRoutes.subCategoryScreen: (_) => SubCategoryScreen(),
        ScreenRoutes.savedScreen: (_) => SavedScreen(),
        ScreenRoutes.quoteScreen: (_) => QuoteDetailsScreen(),
        ScreenRoutes.supplierProfileScreen: (context) =>
            SupplierProfile(ModalRoute.of(context).settings.arguments),
        ScreenRoutes.historyScreen: (context) =>
            HistoryScreen(ModalRoute.of(context).settings.arguments),
        ScreenRoutes.forgetPassword: (_) => ForgetPassword(),
        ScreenRoutes.newPassword: (_) => NewPassword(),
        ScreenRoutes.privacyScreen: (_) => PrivacyScreen(),
        ScreenRoutes.faqScreen: (_) => FaqScreen(),
        ScreenRoutes.goldenSuppliers: (_) => GoldenSuppliers(),
        ScreenRoutes.pricing: (_) => PricingScreen(),
        ScreenRoutes.myAccount: (_) => MyAccount(),
        ScreenRoutes.chatsScreen: (_) => ChatsScreen(),
        ScreenRoutes.aboutUs: (_) => AboutUsScreen(),
        ScreenRoutes.updateProfile: (_) => UpdateProfile(),
        ScreenRoutes.changePassword: (_) => ChangePassword(),
        ScreenRoutes.noInternet: (_) => NoInternet(),
        ScreenRoutes.sendMessage: (_) => SendMessage(),
        ScreenRoutes.listMessageScreen: (_) => ListMessageScreen(),
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
  static const String listFilter = '/list_filter_screen';
  static const String messageCenter = '/message_center_screen';
  static const String signUpScreen = '/sign_up_screen';
  static const String interestingScreen = '/interesting_screen';
  static const String subCategoryScreen = '/sub_category_screen';
  static const String savedScreen = '/saved_screen';
  static const String quoteScreen = '/quote_details_screen';
  static const String supplierProfileScreen = '/supplier_profile_screen';
  static const String historyScreen = '/history_screen';
  static const String forgetPassword = '/forget_password_screen';
  static const String newPassword = '/new_password_screen';
  static const String privacyScreen = '/privacy_screen';
  static const String faqScreen = '/faq_screen';
  static const String goldenSuppliers = '/golden_suppliers_screen';
  static const String myAccount = '/my_account_screen';
  static const String pricing = '/pricing_screen';
  static const String updateProfile = '/update_profile_screen';
  static const String changePassword = '/change_password_screen';
  static const String chatsScreen = '/chatsScreen';
  static const String conversationScreen = '/conversation';
  static const String aboutUs = '/aboutUs_screen';
  static const String noInternet = '/noInternet';
  static const String sendMessage = '/send_message.dart';
  static const String listMessageScreen = '/list_message_screen';
}

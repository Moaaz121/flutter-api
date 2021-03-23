import 'package:bawabtalsharq/Screens/all_categories_screen.dart';
import 'package:bawabtalsharq/Screens/feature_screen.dart';
import 'package:bawabtalsharq/Screens/home_screen.dart';
import 'package:bawabtalsharq/Screens/intro_screen.dart';
import 'package:bawabtalsharq/Screens/login_screen.dart';
import 'package:bawabtalsharq/Screens/settings_screen.dart';
import 'package:bawabtalsharq/Screens/splash_screen.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';

import 'Screens/main_srceen.dart';
import 'Screens/notification_screen.dart';
import 'Screens/profile_screen.dart';

void main() => runApp(
      DevicePreview(
        enabled: false,
        builder: (context) => BawabtAlsharqApp(), // Wrap your app
      ),
    );

class BawabtAlsharqApp extends StatefulWidget {
  @override
  _BawabtAlsharqAppState createState() => _BawabtAlsharqAppState();
}

class _BawabtAlsharqAppState extends State<BawabtAlsharqApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: DevicePreview.locale(context),
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
        ScreenRoutes.settingsScreen: (_) => SettingsScreen()
      },
    );
  }
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
}

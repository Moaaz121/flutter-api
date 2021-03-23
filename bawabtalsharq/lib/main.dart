import 'package:bawabtalsharq/Screens/all_categories_screen.dart';
import 'package:bawabtalsharq/Screens/feature_screen.dart';
import 'package:bawabtalsharq/Screens/home_screen.dart';
import 'package:bawabtalsharq/Screens/login_screen.dart';
import 'package:bawabtalsharq/Screens/splash_screen.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';

import 'Screens/main_srceen.dart';
import 'Screens/notificationScreen.dart';
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
        ScreenRoutes.loginScreen: (_) => LoginScreen(),
        ScreenRoutes.homeScreen: (_) => HomeScreen(),
        ScreenRoutes.mainScreen: (_) => MainScreen(),
        ScreenRoutes.notificationScreen: (_) => NotificationScreen(),
        ScreenRoutes.profileScreen: (_) => ProfileScreen(),
        ScreenRoutes.featureScreen: (_) => FeatureScreen(),
        ScreenRoutes.categoriesScreen: (_) => AllCategories(),
      },
    );
  }
}

class ScreenRoutes {
  static const String splashScreen = '/SplashScreen';
  static const String loginScreen = '/LoginScreen';
  static const String homeScreen = '/HomeScreen';
  static const String mainScreen = '/MainScreen';
  static const String notificationScreen = '/NotificationScreen';
  static const String profileScreen = '/ProfileScreen';
  static const String featureScreen = '/FeatureScreen';
  static const String categoriesScreen = '/AllCategories';
}

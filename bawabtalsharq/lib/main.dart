import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'Screens/splash_screen.dart';
import 'Utils/styles.dart';

void main() => runApp(
      DevicePreview(
        enabled: !kReleaseMode, //!kReleaseMode
        builder: (context) => MyApp(), // Wrap your app
      ),
    );

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        fontFamily: "Segoe UI",
        textTheme: TextTheme(
          bodyText1: TextStyle(color: BlackColor),
          bodyText2: TextStyle(color: BlackColor),
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      locale: DevicePreview.locale(context), // Add the locale here
      builder: DevicePreview.appBuilder,
      home: SplashScreen(),
    );
  }
}

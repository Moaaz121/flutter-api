import 'package:flutter/material.dart';

import 'Screens/splash_screen.dart';
import 'Utils/styles.dart';

void main() {
  runApp(MyApp());
}

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
      home: SplashScreen(),
    );
  }
}

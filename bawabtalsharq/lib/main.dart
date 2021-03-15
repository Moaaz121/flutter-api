
import 'package:flutter/material.dart';

import 'Screens/main_srceen.dart';

void main(){
  runApp(BawabtAlsharqApp());
}

class BawabtAlsharqApp extends StatefulWidget {
  @override
  _BawabtAlsharqAppState createState() => _BawabtAlsharqAppState();
}

class _BawabtAlsharqAppState extends State<BawabtAlsharqApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: Colors.deepOrange
      ),
      home: MainScreen(),
    );
  }
}

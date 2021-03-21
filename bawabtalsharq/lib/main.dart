import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'Screens/main_srceen.dart';

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
      home: MainScreen(),
    );
  }
}

import 'package:bawabtalsharq/Screens/request_for_quatation_screen.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';

void main() => runApp(
      DevicePreview(
        enabled: !true,
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
      home: Scaffold(body: requestForQscreen()),
    );
  }
}

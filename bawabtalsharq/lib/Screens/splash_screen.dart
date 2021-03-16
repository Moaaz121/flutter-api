import 'package:bawabtalsharq/Utils/size_config.dart';
import 'package:bawabtalsharq/widgets/body.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Body(),
    );
  }
}

import 'package:bawabtalsharq/Utils/Localization/Language/Languages.dart';
import 'package:bawabtalsharq/Utils/styles.dart';
import 'package:bawabtalsharq/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:bawabtalsharq/Utils/images.dart';

class NoInternet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('No inetrnet Page');
    return Scaffold(
      backgroundColor: Color.fromRGBO(248, 248, 248, 0.92),
      // Colors.white54.withOpacity(0.92),
      appBar: appBarBuilderWithWidget(
          titleWidget:
              buildText(Languages.of(context).requestForQuotation, 18.0,
                  //, 18.0,
                  fontFamily: boldFontFamily,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
          onBackPressed: () {
            Navigator.pop(context);
          }),

      body: SafeArea(
          child: Center(
        child: Container(
            child: Image.asset(
          noConnectionImage,
          fit: BoxFit.fill,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
        )),
      )),
    );
  }
}

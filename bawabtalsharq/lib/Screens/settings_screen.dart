import 'package:bawabtalsharq/Utils/Localization/Language/Languages.dart';
import 'package:bawabtalsharq/Utils/styles.dart';
import 'package:bawabtalsharq/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarBuilder(
        title: Languages.of(context).settings,
        onBackPressed: () {
          Navigator.pop(context);
        },
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.only(top: 40, left: 8, right: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text(
                    Languages.of(context).requestForQuotation,
                    style: buildTextStyle(context),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: cardSetting(
                      text: Languages.of(context).languages,
                      onPress: () {},
                      icon: Icons.language,
                      iconColor: Colors.blue),
                ),
                cardSetting(
                    text: Languages.of(context).languages,
                    onPress: () {},
                    icon: Icons.language,
                    iconColor: Colors.orange),
                cardSetting(
                    text: Languages.of(context).languages,
                    onPress: () {},
                    icon: Icons.language,
                    iconColor: Colors.deepPurple),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 20,
                    top: 40,
                  ),
                  child: Text(
                    Languages.of(context).requestForQuotation, //second text
                    style: buildTextStyle(context),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: cardSetting(
                      text: Languages.of(context).languages,
                      onPress: () {},
                      icon: Icons.language,
                      iconColor: Colors.blue),
                ),
                cardSetting(
                    text: Languages.of(context).languages,
                    onPress: () {},
                    icon: Icons.language,
                    iconColor: Colors.orange),
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 40),
                  child: Text(
                    Languages.of(context).requestForQuotation,
                    style: buildTextStyle(context),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: cardSetting(
                      text: Languages.of(context).languages,
                      onPress: () {},
                      icon: Icons.language,
                      iconColor: Colors.blue),
                ),
                cardSetting(
                    text: Languages.of(context).languages,
                    onPress: () {},
                    icon: Icons.language,
                    iconColor: Colors.orange),
              ],
            ),
          ),
        ),
      ),
    );
  }

  TextStyle buildTextStyle(BuildContext context) {
    return TextStyle(
      fontFamily: semiBoldFontFamily,
      fontWeight: FontWeight.w600,
      color: Colors.black,
      fontSize: MediaQuery.of(context).textScaleFactor * 16,
    );
  }

  Widget cardSetting({
    String text,
    Function onPress,
    IconData icon,
    Color iconColor,
  }) {
    double height = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: onPress,
      child: Container(
        height: height * .06,
        padding: EdgeInsets.only(
            top: height * 0.01, bottom: height * 0.01, left: 22, right: 11),
        margin: EdgeInsets.only(top: 8),
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [makeShadow()],
            borderRadius: BorderRadius.circular(10)),
        child: Row(
          children: [
            Icon(
              icon,
              color: iconColor,
            ),
            SizedBox(width: 20),
            Expanded(child: Text(text)),
            Icon(Icons.navigate_next),
            //Icon(Icons.ac_unit),
          ],
        ),
      ),
    );
  }
}

import 'package:bawabtalsharq/Utils/Localization/Language/Languages.dart';
import 'package:bawabtalsharq/Utils/images.dart';
import 'package:bawabtalsharq/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:bawabtalsharq/Utils/constants.dart';

import '../../../main.dart';

class MyAccount extends StatefulWidget {
  @override
  _MyAccountState createState() => _MyAccountState();
}

class _MyAccountState extends State<MyAccount> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarBuilder(
          title: Languages.of(context).myAccount,
          onBackPressed: () {
            Navigator.of(context).pop();
          }),
      body: Padding(
        padding:
            const EdgeInsets.only(top: 30, left: 20, right: 20, bottom: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Container(
                width: 96,
                height: 96,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage(logo),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            buildText(
                Constants.getUserInfo2().data.firstname +
                    ' ' +
                    Constants.getUserInfo2().data.lastname,
                18,
                fontWeight: FontWeight.bold),
            SizedBox(
              height: 30,
            ),
            accountCard(
                text: Text(Languages.of(context).updateProfile),
                // Languages.of(context).technical
                icon: Icons.people,
                iconColor: Colors.blue,
                onPress: () {
                  Navigator.pushNamed(context, ScreenRoutes.updateProfile);
                }),
            accountCard(
                text: Text(Languages.of(context).changePassword),
                icon: Icons.lock,
                iconColor: Colors.deepPurpleAccent,
                onPress: () {
                  Navigator.pushNamed(context, ScreenRoutes.changePassword);
                }),
          ],
        ),
      ),
    );
  }

  Widget accountCard(
      {Widget text, IconData icon, Color iconColor, Function onPress}) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        height: 65,
        padding: EdgeInsets.only(left: 22, right: 11),
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
            Expanded(child: text),

            Icon(
              Icons.navigate_next,
            ),

            //Icon(Icons.ac_unit),
          ],
        ),
      ),
    );
  }
}

import 'package:bawabtalsharq/Utils/Localization/Language/Languages.dart';
import 'package:bawabtalsharq/Utils/images.dart';
import 'package:bawabtalsharq/widgets/widgets.dart';
import 'package:flutter/material.dart';

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
                    image: AssetImage(profile_image),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            buildText('Bahaa Robert', 18, fontWeight: FontWeight.bold),
            SizedBox(
              height: 30,
            ),
            accountCard(
                text: Text('Update Profile'),
                icon: Icons.people,
                iconColor: Colors.blue,
                onPress: () {
                  // Navigator.pushNamed(context, ScreenRoutes.faqScreen);
                }),
            accountCard(
                text: Text('Switch Account'),
                icon: Icons.switch_left,
                iconColor: Colors.redAccent,
                onPress: () {}),
            accountCard(
                text: Text('Change Password'),
                icon: Icons.lock,
                iconColor: Colors.deepPurpleAccent,
                onPress: () {}),
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

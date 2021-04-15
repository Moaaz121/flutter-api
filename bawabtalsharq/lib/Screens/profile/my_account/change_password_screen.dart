import 'package:bawabtalsharq/Utils/Localization/Language/Languages.dart';
import 'package:bawabtalsharq/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChangePassword extends StatefulWidget {
  @override
  _ChangePasswordState createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarBuilder(
          title: Languages.of(context).myAccount,
          onBackPressed: () {
            Navigator.of(context).pop();
          }),
      body: Padding(
        padding: const EdgeInsets.only(left: 30, top: 30, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildText('Use This form to change your password', 16,
                fontWeight: FontWeight.w700),
            SizedBox(
              height: 5,
            ),
            buildText(
              'Enter your old password for authorization',
              14,
              fontWeight: FontWeight.w400,
            ),
            SizedBox(
              height: 20,
            ),
            textFiledPrice(context, 'Old Password', 1),
            SizedBox(
              height: 20,
            ),
            textFiledPrice(context, 'New Password', 1),
            SizedBox(
              height: 20,
            ),
            textFiledPrice(context, 'Confirm Password', 1),
            SizedBox(
              height: 100,
            ),
            signInFlatButton(context, MediaQuery.of(context).size.height,
                'Save Change', () {},
                widthOfBtn: 1),
          ],
        ),
      ),
    );
  }
}
// textFiledPrice(context, 'First Name', 1),

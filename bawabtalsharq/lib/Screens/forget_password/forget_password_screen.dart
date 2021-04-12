import 'package:bawabtalsharq/Utils/Localization/Language/Languages.dart';
import 'package:bawabtalsharq/Utils/images.dart';
import 'package:bawabtalsharq/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../main.dart';

class ForgetPassword extends StatefulWidget {
  @override
  _ForgetPasswordState createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(logo1),
            fit: BoxFit.fitHeight,
          ),
        ),
        child: Container(
          margin: EdgeInsets.only(top: 58, left: 26, right: 25, bottom: 59),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(33),
              boxShadow: [
                makeShadow(),
              ]),
          child: Padding(
            padding: const EdgeInsets.only(top: 35, right: 20, left: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                backIconRounded(onBackPressed: () {
                  Navigator.of(context).pop();
                }),
                SizedBox(
                  height: height * .11,
                ),
                buildText(Languages.of(context).forgetPassword, 38,
                    fontWeight: FontWeight.bold),
                SizedBox(
                  height: height * .11,
                ),
                customTextField(context,
                    leftIcon: Icons.email,
                    label: Languages.of(context).emailAddress,
                    width: 1),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .11,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    signInFlatButton(
                        context, height, Languages.of(context).send, () {
                      Navigator.pushReplacementNamed(
                          context, ScreenRoutes.verificationPassword);
                    }),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:bawabtalsharq/Utils/Localization/Language/Languages.dart';
import 'package:bawabtalsharq/Utils/images.dart';
import 'package:bawabtalsharq/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../main.dart';

class NewPassword extends StatefulWidget {
  @override
  _NewPasswordState createState() => _NewPasswordState();
}

class _NewPasswordState extends State<NewPassword> {
  bool obSecureText = true;
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
          height: height,
          margin: EdgeInsets.only(top: 60, left: 26, right: 25, bottom: 60),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(33),
              boxShadow: [
                makeShadow(),
              ]),
          child: Padding(
            padding: const EdgeInsets.only(
              top: 35,
              right: 20,
              left: 20,
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  backIconRounded(onBackPressed: () {
                    Navigator.of(context).pop();
                  }),
                  SizedBox(
                    height: height * .11,
                  ),
                  buildText(Languages.of(context).createNewPassword, 38,
                      fontWeight: FontWeight.bold),
                  SizedBox(
                    height: height * .11,
                  ),
                  customTextField(
                    context,
                    label: Languages.of(context).loginPass,
                    leftIcon: Icons.lock,
                    isPassword: obSecureText,
                    rightBtn: IconButton(
                      onPressed: () {
                        setState(() {
                          obSecureText = !obSecureText;
                        });
                      },
                      icon: Icon(obSecureText
                          ? Icons.visibility_off
                          : Icons.visibility),
                    ),
                  ),
                  SizedBox(
                    height: height * .05,
                  ),
                  customTextField(
                    context,
                    label: Languages.of(context).confirmPass,
                    leftIcon: Icons.lock,
                    isPassword: obSecureText,
                    rightBtn: IconButton(
                      onPressed: () {
                        setState(() {
                          obSecureText = !obSecureText;
                        });
                      },
                      icon: Icon(obSecureText
                          ? Icons.visibility_off
                          : Icons.visibility),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .11,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      signInFlatButton(
                          context, height, Languages.of(context).submit, () {
                        Navigator.pushReplacementNamed(
                            context, ScreenRoutes.mainScreen);
                      }),
                    ],
                  ),
                  SizedBox(
                    height: 11,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:bawabtalsharq/Utils/images.dart';
import 'package:bawabtalsharq/Utils/styles.dart';
import 'package:bawabtalsharq/widgets/widgets.dart';
import 'package:flutter/material.dart';

class VerfCodeScreen extends StatefulWidget {
  @override
  _VerfCodeScreenState createState() => _VerfCodeScreenState();
}

class _VerfCodeScreenState extends State<VerfCodeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image:
              DecorationImage(image: AssetImage(logo1), fit: BoxFit.fitHeight),
        ),
        child: Container(
          margin: EdgeInsets.only(top: 60, left: 25, right: 25, bottom: 40),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(33),
            boxShadow: [
              makeShadow(),
            ],
          ),
          child: Container(
            width: double.infinity,
            margin: EdgeInsets.only(left: 10, top: 15, right: 10),
            padding: EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image(
                  image: AssetImage(logo),
                  width: 40,
                  height: 40,
                ),
                SizedBox(
                  height: 40,
                ),
                buildText(
                  'Verfication',
                  40,
                  color: Color(0xff515151),
                  fontWeight: FontWeight.w700,
                ),
                SizedBox(
                  height: 18,
                ),
                buildText(
                  'Enter your OTP code',
                  15,
                  color: Color(0xff515151),
                  fontWeight: FontWeight.w400,
                ),
                SizedBox(height: 40),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      buildTextFields(),
                      buildTextFields(),
                      buildTextFields(),
                      buildTextFields()
                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    buildText(
                      'Resend code in',
                      15,
                    ),
                    buildText(' 30 Seconds', 15, color: defaultOrangeColor),
                  ],
                ),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    signInFlatButton(context,
                        MediaQuery.of(context).size.height, 'Verify', () {}),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildTextFields() {
    return Container(
      height: 70,
      width: 70,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [makeShadow()]),
    );
  }
}

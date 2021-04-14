import 'dart:async';

import 'package:bawabtalsharq/Utils/images.dart';
import 'package:bawabtalsharq/Utils/styles.dart';
import 'package:bawabtalsharq/main.dart';
import 'package:bawabtalsharq/widgets/widgets.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class VerificationScreen extends StatefulWidget {
  @override
  _VerificationScreenState createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  var onTapRecognizer;

  TextEditingController textEditingController = TextEditingController();

  // ..text = "123456";

  StreamController<ErrorAnimationType> errorController;

  bool hasError = false;
  String currentText = "";
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    onTapRecognizer = TapGestureRecognizer()
      ..onTap = () {
        Navigator.pop(context);
      };
    errorController = StreamController<ErrorAnimationType>();
    super.initState();
  }

  @override
  void dispose() {
    errorController.close();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                image:
                    DecorationImage(image: AssetImage(logo1), fit: BoxFit.fill),
              ),
            ),
          ),
          Container(
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
                  backIconRounded(
                    onBackPressed: () {
                      Navigator.of(context).pop();
                    },
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
                  Flexible(
                    child: PinCodeTextField(
                      backgroundColor: Colors.white,
                      appContext: context,
                      length: 4,
                      obscureText: false,
                      obscuringCharacter: '*',
                      animationType: AnimationType.fade,
                      validator: (v) {
                        if (v.length < 3) {
                          return "I'm from validator";
                        } else {
                          return null;
                        }
                      },
                      pinTheme: PinTheme(
                        shape: PinCodeFieldShape.box,
                        borderRadius: BorderRadius.circular(10),
                        fieldHeight: 54,
                        fieldWidth: 54,
                        selectedColor: orangeColor,
                        borderWidth: 2,
                        inactiveColor: Colors.transparent,
                        disabledColor: Colors.transparent,
                        selectedFillColor: Colors.white,
                        activeColor: Colors.green,
                        activeFillColor: Colors.white,
                        inactiveFillColor: Colors.white,
                      ),
                      cursorColor: OrangeColor,
                      animationDuration: Duration(milliseconds: 300),
                      textStyle: TextStyle(fontSize: 20, height: 1.6),
                      enableActiveFill: true,
                      errorAnimationController: errorController,
                      controller: textEditingController,
                      keyboardType: TextInputType.number,
                      boxShadows: [
                        BoxShadow(
                          offset: Offset(0, 1),
                          color: Colors.black12,
                          blurRadius: 10,
                        )
                      ],
                      onCompleted: (v) {
                        print("Completed");
                      },
                      // onTap: () {
                      //   print("Pressed");
                      // },
                      onChanged: (value) {
                        print(value);
                        setState(() {
                          currentText = value;
                        });
                      },
                      beforeTextPaste: (text) {
                        print("Allowing to paste $text");
                        //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                        //but you can show anything you want here, like your pop up saying wrong paste format or etc
                        return true;
                      },
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
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      signInFlatButton(
                          context, MediaQuery.of(context).size.height, 'Verify',
                          () {
                        Navigator.pushNamed(context, ScreenRoutes.newPassword);
                      }),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

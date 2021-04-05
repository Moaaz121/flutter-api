import 'package:bawabtalsharq/Screens/profile/contact_us/send_message_dialog.dart';
import 'package:bawabtalsharq/Screens/search/search_filter_screen.dart';
import 'package:bawabtalsharq/Utils/Localization/LanguageHelper.dart';
import 'package:bawabtalsharq/Utils/images.dart';
import 'package:bawabtalsharq/Utils/styles.dart';
import 'package:bawabtalsharq/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool obSecureText = true;
  int selectedRadioTile;
  @override
  void initState() {
    super.initState();
    selectedRadioTile = 0;
  }

  setSelectedRadioTile(int val) {
    setState(() {
      selectedRadioTile = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          resizeToAvoidBottomInset: false,
          body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(logo1),
                fit: BoxFit.fitHeight,
              ),
            ),
            child: Container(
              margin: EdgeInsets.only(top: 68, left: 26, right: 25, bottom: 68),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(33),
                  boxShadow: [
                    makeShadow(),
                  ]),
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics(),
                ),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        IconButton(
                          icon: CircleAvatar(
                            radius: 9,
                            backgroundColor: orangeColor,
                            child: Icon(
                              LanguageHelper.isEnglish
                                  ? Icons.keyboard_arrow_left_outlined
                                  : Icons.keyboard_arrow_right_outlined,
                              size: 17,
                              color: Colors.white,
                            ),
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                        buildText('Sign Up', 40),
                        textFiledPrice(context, 'Country/Region', 0.8,
                            dropIcon: IconButton(
                                onPressed: () {
                                  setState(() {});
                                },
                                icon: Icon(Icons.keyboard_arrow_down))),
                        SizedBox(
                          height: 10,
                        ),
                        buildText('Please select trade role', 15),
                        buildRadioListTile('Buyer', 1),
                        buildRadioListTile('Seller', 2),
                        buildRadioListTile('Both', 3),
                        textFiledPrice(context, 'Email Address', 0.8),
                        textFiledPrice(
                          context,
                          'Login Password',
                          0.8,
                          isPassword: obSecureText,
                          dropIcon: IconButton(
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
                        textFiledPrice(context, 'Company Name', 0.8),
                        textFiledPrice(context, 'Full Name', 0.8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            textFiledPrice(context, '+02', 0.1),
                            SizedBox(
                              width: 10,
                            ),
                            textFiledPrice(context, 'Tel', 0.68),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.only(
                              start: 220, top: 50),
                          child: submitButton(() {}, context, 'Sign Up'),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  RadioListTile<int> buildRadioListTile(String text, int value) {
    return RadioListTile(
      title: Text(text),
      groupValue: selectedRadioTile,
      value: value,
      dense: true,
      onChanged: (val) {
        print("Radio Tile pressed $val");
        setSelectedRadioTile(val);
      },
      activeColor: OrangeColor,
    );
  }
}

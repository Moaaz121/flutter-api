import 'package:bawabtalsharq/Repos/ChatRepos/chat_repo.dart';
import 'package:bawabtalsharq/Utils/Localization/Language/Languages.dart';
import 'package:bawabtalsharq/Utils/Localization/LanguageHelper.dart';
import 'package:bawabtalsharq/Utils/images.dart';
import 'package:bawabtalsharq/Utils/styles.dart';
import 'package:bawabtalsharq/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:rocket_chat_connector_flutter/models/authentication.dart';

import '../main.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool obSecureText = true;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
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
          color: Colors.white.withOpacity(0.4),
          child: Container(
            margin: EdgeInsets.only(top: 68, left: 26, right: 25, bottom: 68),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(33),
                boxShadow: [
                  makeShadow(),
                ]),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: height * 0.02,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image(
                            image: AssetImage(logo),
                            width: width * .1,
                            height: height * .07,
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.only(
                                top: height * .01, start: height * .03),
                            child: Row(
                              children: [
                                GestureDetector(
                                    onTap: () => print('hey'),
                                    child: Text(Languages.of(context).signUp)),
                                // Languages.of(context).languages,
                                IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.arrow_forward),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: height * 0.04,
                      ),
                      Text((Languages.of(context).login),
                          style: LanguageHelper.isEnglish
                              ? TextStyle(
                                  fontFamily: blackFontFamily,
                                  fontSize: height * .056,
                                  letterSpacing: 1,
                                  fontWeight: FontWeight.w700)
                              : TextStyle(
                                  fontFamily: blackFontFamily,
                                  fontSize: height * .040,
                                  letterSpacing: 1,
                                  fontWeight: FontWeight.w700)),
                      SizedBox(
                        height: height * 0.04,
                      ),
                      customTextField(
                          label: Languages.of(context).userName,
                          leftIcon: Icons.person),
                      SizedBox(
                        height: height * 0.03,
                      ),
                      customTextField(
                        isPassword: obSecureText,
                        label: (Languages.of(context).password),
                        //'Password',
                        leftIcon: Icons.lock,
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
                      // SizedBox(
                      //   height: height * .003,
                      // ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.only(start: 15, top: 5),
                        child: GestureDetector(
                            onTap: () {},
                            child: Text(
                              Languages.of(context).forgetPassword,
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey,
                                fontWeight: FontWeight.w400,
                                fontFamily: regularFontFamily,
                                decoration: TextDecoration.underline,
                              ),
                            )),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * .05,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            top: height * .01, right: height * .01),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              FlatButton(
                                padding: EdgeInsetsDirectional.only(
                                  start: 35,
                                  end: 35,
                                  top: 11,
                                  bottom: 11,
                                ),
                                splashColor: orangeColor.withOpacity(0.5),
                                highlightColor: orangeColor.withOpacity(0.2),
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                    color: Colors.red,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(9),
                                ),
                                onPressed: () async {
                                  // TO DO check login
                                  Authentication result = await RocketChatApi()
                                      .loginRocket(
                                          'asmaatarek93@gmail.com', '12345678');
                                  if (result.status == "success") {
                                    rocketUser = result;
                                    Navigator.pushReplacementNamed(
                                        context, ScreenRoutes.mainScreen);
                                  } else {
                                    print('error');
                                  }
                                },
                                color: Colors.white,
                                child: Text(
                                  (Languages.of(context).signIn),
                                  style: TextStyle(
                                      fontSize: height * .015,
                                      color: Colors.red),
                                ),
                              ),
                            ]),
                      ),

                      // SizedBox(
                      //   height: height * .03,
                      // ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: height * 0.05),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        GestureDetector(
                          onTap: () {},
                          child: (Text(
                            Languages.of(context).alreadyHaveAccount,
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey,
                                fontWeight: FontWeight.w700,
                                fontFamily: regularFontFamily,
                                decoration: TextDecoration.underline),
                          )),
                        ),
                        SizedBox(
                          height: height * .02,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 46,
                              width: 55,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                      blurRadius: 10,
                                      spreadRadius: 2,
                                      color: Colors.black.withOpacity(.1))
                                ],
                              ),
                              child: IconButton(
                                icon: Image.asset(google),
                                iconSize: 15,
                                color: Colors.white,
                                onPressed: () => print('google '),
                              ),
                            ),
                            SizedBox(
                              width: height * .02,
                            ),
                            Container(
                              height: 46,
                              width: 55,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(18),
                                color: Color(0xffEB4267B2),
                              ),
                              child: IconButton(
                                icon: Image.asset(facebook),
                                iconSize: 15,
                                onPressed: () => print('facebook '),
                              ),
                            ),
                            SizedBox(
                              width: height * .02,
                            ),
                            Container(
                              height: 46,
                              width: 55,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                color: Color(0xffEB1DA1F2),
                              ),
                              child: IconButton(
                                icon: Image.asset(twitter),
                                iconSize: 15,
                                onPressed: () => print('tweeter '),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

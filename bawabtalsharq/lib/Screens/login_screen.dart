import 'package:bawabtalsharq/Utils/images.dart';
import 'package:bawabtalsharq/Utils/strings.dart';
import 'package:bawabtalsharq/Utils/styles.dart';
import 'package:bawabtalsharq/main.dart';
import 'package:bawabtalsharq/widgets/widgets.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
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
            margin: EdgeInsets.only(top: 48, left: 26, right: 25, bottom: 20),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(33),
                boxShadow: [
                  makeShadow(),
                ]),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
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
                        padding: const EdgeInsets.all(3.0),
                        child: Row(
                          children: [
                            GestureDetector(
                                onTap: () => print('hey'),
                                child: Text(Strings().signUp())),
                            IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.arrow_forward_rounded),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  Text(
                    Strings().logIn(),
                    //'Login',
                    style: TextStyle(
                        fontFamily: blackFontFamily,
                        fontSize: 50,
                        fontWeight: FontWeight.w700),
                  ),
                  SizedBox(
                    height: height * 0.04,
                  ),
                  customTextField(
                      label: Strings().userName(), leftIcon: Icons.person),
                  SizedBox(
                    height: height * 0.03,
                  ),
                  customTextField(
                      label: (Strings().password()),
                      //'Password',
                      leftIcon: Icons.lock,
                      rightIcon: Icons.visibility_off),
                  SizedBox(
                    height: height * .003,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15, top: 5),
                    child: GestureDetector(
                        onTap: () {},
                        child: Text(
                          Strings().forgetPassword(),
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
                    height: height * .05,
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: FlatButton(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          color: Colors.red,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(9),
                      ),
                      onPressed: () {
                        // TO DO check login
                        Navigator.pushReplacementNamed(
                            context, ScreenRoutes.mainScreen);
                      },
                      color: Colors.white,
                      child: Text(
                        Strings().signIn(),
                        style: TextStyle(fontSize: 15, color: Colors.red),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height * .03,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: GestureDetector(
                      onTap: () {},
                      child: (Text(
                        Strings().alreadyHaveAnAccount(),
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                            fontWeight: FontWeight.w700,
                            fontFamily: regularFontFamily,
                            decoration: TextDecoration.underline),
                      )),
                    ),
                  ),
                  SizedBox(
                    height: height * .02,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
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
                        width: height * .03,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: Color(0xffEB4267B2),
                        ),
                        child: IconButton(
                          icon: Image.asset(facebook),
                          iconSize: 15,
                          onPressed: () => print('facebook '),
                        ),
                      ),
                      SizedBox(
                        width: height * .03,
                      ),
                      Container(
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
          ),
        ),
      ),
    );
  }
}

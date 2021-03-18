import 'package:bawabtalsharq/Utils/images.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  static String id = 'LoginScreen';
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(logo1),
          fit: BoxFit.fitHeight,
        ),
      ),
      child: Container(
        color: Colors.white.withOpacity(0.4),
        child: SafeArea(
          child: Container(
            margin: EdgeInsets.only(top: 40, left: 26, right: 25, bottom: 20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                bottomLeft: Radius.circular(30),
                topRight: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
            child: Stack(
              children: [
                Padding(
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
                            width: (40),
                            height: (50),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: Row(
                              children: [
                                GestureDetector(
                                    onTap: () => print('hey'),
                                    child: Text('Sign up')),
                                IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.arrow_forward_rounded),
                                ),
                                // FlatButton(
                                //     onPressed: () {}, child: Text('Sign Up')),
                                // FlatButton.icon(
                                //     onPressed: () {},
                                //     icon: Icon(Icons.arrow_forward_rounded))
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: height * 0.03,
                      ),
                      Text(
                        'Login',
                        style: TextStyle(
                            fontFamily: 'Roboto-Black.ttf',
                            fontSize: 50,
                            fontWeight: FontWeight.w700),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      TextField(
                        decoration: InputDecoration(
                            //hintText: 'username',
                            prefixIcon: Icon(
                              Icons.person,
                              color: Colors.grey,
                            ),
                            labelText: 'Username',
                            labelStyle: TextStyle(
                                fontFamily: 'Roboto-Thin.ttf',
                                fontWeight: FontWeight.w200),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey))),
                      ),
                      SizedBox(
                        height: height * 0.03,
                      ),
                      TextField(
                        decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.lock,
                              color: Colors.grey,
                            ),
                            suffixIcon: Icon(Icons.visibility_off),
                            labelText: 'Passward',
                            labelStyle: TextStyle(
                                fontFamily: 'Roboto-Thin.ttf',
                                fontWeight: FontWeight.w200),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey))),
                      ),
                      SizedBox(
                        height: height * .005,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15, top: 5),
                        child: GestureDetector(
                          onTap: () {},
                          child: (Text(
                            'Forget Passward?',
                            style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Roboto',
                                decoration: TextDecoration.underline),
                          )),
                        ),
                      ),
                      SizedBox(
                        height: height * .045,
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: FlatButton(
                          shape: RoundedRectangleBorder(
                              side: BorderSide(
                                color: Colors.red,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(11)),
                          onPressed: () {},
                          color: Colors.white,
                          child: Text(
                            'Sign in',
                            style: TextStyle(fontSize: 15, color: Colors.red),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: height * 0.080,
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: GestureDetector(
                          onTap: () {},
                          child: (Text(
                            'Already have an account?',
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.grey,
                                fontWeight: FontWeight.w700,
                                fontFamily: 'Roboto-Regular.ttf',
                                decoration: TextDecoration.underline),
                          )),
                        ),
                      ),
                      SizedBox(
                        height: height * .02,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 50),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                  ]),
                              child: IconButton(
                                icon: Image.asset(google),
                                iconSize: 15,
                                color: Colors.white,
                                onPressed: () => print('google '),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                color: Colors.blueAccent,
                              ),
                              child: IconButton(
                                icon: Image.asset(facebook),
                                iconSize: 15,
                                onPressed: () => print('facebook '),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                color: Colors.lightBlue,
                                //fontWeight: FontWeight.w400,
                              ),
                              child: IconButton(
                                icon: Image.asset(twitter),
                                iconSize: 15,
                                onPressed: () => print('tweeter '),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}

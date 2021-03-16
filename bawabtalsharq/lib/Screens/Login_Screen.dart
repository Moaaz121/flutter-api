import 'package:bawabtalsharq/Utils/images.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  static String id = 'LoginScreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(logo1),
          fit: BoxFit.fitHeight,
        ),
      ),
      child: SafeArea(
        child: Container(
          margin: EdgeInsets.only(top: 40, left: 35, right: 35, bottom: 40),
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
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image(
                          image: AssetImage(logo),
                          width: (50),
                          height: (70),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: Row(
                            children: [
                              Text('Sign up'),
                              IconButton(
                                icon: Icon(Icons.arrow_forward_rounded),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      'Login',
                      style: TextStyle(fontFamily: 'Roboto', fontSize: 50),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    TextField(
                      decoration: InputDecoration(
                          // hintText: 'username',

                          prefixIcon: Icon(
                            Icons.person_add_rounded,
                            color: Colors.grey,
                          ),
                          labelText: 'Username',
                          labelStyle: TextStyle(
                              fontFamily: 'montserrat',
                              fontWeight: FontWeight.bold),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey))),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextField(
                      decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.lock_rounded,
                            color: Colors.grey,
                          ),
                          suffixIcon: Icon(Icons.visibility_off),
                          labelText: 'passward',
                          labelStyle: TextStyle(
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey))),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    FlatButton(
                      onPressed: () {},
                      child: (Text(
                        'Forget passward?',
                        style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Roboto',
                            decoration: TextDecoration.underline),
                      )),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: FlatButton(
                        shape: RoundedRectangleBorder(
                            side: BorderSide(
                              color: Colors.red,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(30)),
                        onPressed: () {},
                        color: Colors.white,
                        child: Text(
                          'Sign in',
                          style: TextStyle(fontSize: 15, color: Colors.red),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 35,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: FlatButton(
                        onPressed: () {},
                        child: (Text(
                          'Already have an account?',
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.grey,
                              fontWeight: FontWeight.normal,
                              fontFamily: 'Roboto',
                              decoration: TextDecoration.underline),
                        )),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            icon: Image.asset(google),
                            iconSize: 30,
                            onPressed: () {},
                          ),
                          IconButton(
                            icon: Image.asset(facebook),
                            iconSize: 30,
                            onPressed: () {},
                          ),
                          IconButton(
                            icon: Image.asset(twitter),
                            iconSize: 30,
                            onPressed: () {},
                          )
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
    ));
  }
}

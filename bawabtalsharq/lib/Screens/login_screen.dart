import 'package:bawabtalsharq/Repos/ChatRepos/chat_repo.dart';
import 'package:bawabtalsharq/Utils/Localization/Language/Languages.dart';
import 'package:bawabtalsharq/Utils/Localization/LanguageHelper.dart';
import 'package:bawabtalsharq/Utils/images.dart';
import 'package:bawabtalsharq/Utils/styles.dart';
import 'package:bawabtalsharq/Utils/validator_util.dart';
import 'package:bawabtalsharq/bloc/authBlocs/loginBloc/login_bloc.dart';
import 'package:bawabtalsharq/bloc/authBlocs/loginBloc/login_event.dart';
import 'package:bawabtalsharq/bloc/authBlocs/loginBloc/login_state.dart';
import 'package:bawabtalsharq/main.dart';
import 'package:bawabtalsharq/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:rocket_chat_connector_flutter/models/authentication.dart';
import 'package:bawabtalsharq/Services/AnalyticsService.dart';
import '../main.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController passwordController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  LoginBloc _loginBloc;
  bool isLoading = false;
  bool obSecureText = true;
  String _emailErrorMessage;
  String _passwordErrorMessage;

  @override
  void dispose() {
    super.dispose();
    passwordController.dispose();
    usernameController.dispose();
  }

  @override
  void initState() {
    super.initState();
    _loginBloc = LoginBloc();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      key: _scaffoldKey,
      resizeToAvoidBottomPadding: false,
      body: BlocBuilder<LoginBloc, LoginState>(
        bloc: _loginBloc,
        builder: (context, state) {
          if (state is LoginLoadingState) {
            if (!isLoading) {
              progressBar();
              isLoading = true;
            }
          } else if (state is LoginLoadedState) {
            print('loaded');
            _loginBloc.add(ResetState());
            isLoading = false;
            if (state.userResponse.code == 200) {
              showToast(text: "Login Successfully!");
              SchedulerBinding.instance.addPostFrameCallback((_) {
                Navigator.pushNamed(context, ScreenRoutes.mainScreen);
              });
            } else {
              showToast(
                  text: state.userResponse.msg,
                  toastGravity: ToastGravity.SNACKBAR);
            }
          } else if (state is LoginNetworkErrorState) {
            showToast(
                text: Languages.of(context).noNetwork,
                toastGravity: ToastGravity.SNACKBAR);
          }
          return Container(
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(logo1),
                fit: BoxFit.fitHeight,
              ),
            ),
            child: Container(
              color: Colors.white.withOpacity(0.4),
              child: Container(
                margin:
                    EdgeInsets.only(top: 68, left: 26, right: 25, bottom: 68),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(33),
                    boxShadow: [
                      makeShadow(),
                    ]),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: SingleChildScrollView(
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
                              padding: EdgeInsetsDirectional.only(
                                  top: height * .01, start: height * .03),
                              child: Row(
                                children: [
                                  GestureDetector(
                                      onTap: () {
                                        Navigator.pushNamed(
                                            context, ScreenRoutes.signUpScreen);
                                        AnalyticsService().sendAnalyticsEvent(
                                            eventName: 'Registering',
                                            param: {
                                              'msg': 'Opening Regeister',
                                              'bool': true,
                                            });
                                      },
                                      child: Row(
                                        children: [
                                          Text(Languages.of(context).signUp),
                                          Icon(Icons.arrow_forward)
                                        ],
                                      )),
                                  // Languages.of(context).languages,
                                  // IconButton(
                                  //   onPressed: () {},
                                  //   icon:,
                                  // ),
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
                        customTextField(context,
                            textInputType: TextInputType.emailAddress,
                            errorText: _emailErrorMessage,
                            controller: usernameController,
                            label: Languages.of(context).userName,
                            width: 1,
                            leftIcon: Icons.person),
                        SizedBox(
                          height: height * 0.03,
                        ),
                        customTextField(
                          context,
                          textInputType: TextInputType.visiblePassword,
                          errorText: _passwordErrorMessage,
                          controller: passwordController,
                          isPassword: obSecureText,
                          label: (Languages.of(context).password),
                          width: 1,
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
                        SizedBox(
                          height: height * .003,
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Padding(
                            padding: const EdgeInsetsDirectional.only(
                                start: 10, top: 7),
                            child: GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, ScreenRoutes.forgetPassword);
                                },
                                child: Text(
                                  Languages.of(context).forgetPassword,
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: regularFontFamily,
                                    decoration: TextDecoration.underline,
                                  ),
                                )),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * .05,
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              top: height * .0, right: height * .01),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                signInFlatButton(
                                  context,
                                  height,
                                  Languages.of(context).login,
                                  () {
                                    FocusScope.of(context).unfocus();
                                    _passwordErrorMessage = null;
                                    _emailErrorMessage = null;
                                    setState(() {
                                      if (usernameController.text.isEmpty)
                                        _emailErrorMessage = 'Empty Field';
                                      else if (passwordController.text.isEmpty)
                                        _passwordErrorMessage = 'Empty Field';
                                      else if (!emailValidator(
                                          usernameController.text.trim()))
                                        _emailErrorMessage =
                                            'please enter correct email address';
                                      // else if (!passwordValidator(
                                      //     passwordController.text))
                                      //   _passwordErrorMessage = 'Weak Password';
                                      else {
                                        _loginToRocketChat();
                                        _loginBloc.add(
                                          DoLoginEvent(usernameController.text,
                                              passwordController.text),
                                        );

                                        AnalyticsService()
                                            .logging(method: 'email');

                                        // AnalyticsService().sendAnalyticsEvent(
                                        //     eventName: 'LoginScreen',
                                        //     param: {
                                        //       'msg': 'Loggin',
                                        //       'bool': true,
                                        //     });
                                      }
                                    });
                                  },
                                ),
                              ]),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Row buildRowSocialMedia(double height) {
    return Row(
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
    );
  }

  _loginToRocketChat() async {
    if (usernameController.text.isNotEmpty &&
        passwordController.text.isNotEmpty) {
      Authentication result =
          await RocketChatApi.instance.loginRocket('RocketAdmin', 'Ab@123456');
      if (result.status == "success") {
        rocketUser = result;
        print(rocketUser.data.authToken);
        print(rocketUser.data.userId);
      } else {
        print('error');
      }
    }
  }
}

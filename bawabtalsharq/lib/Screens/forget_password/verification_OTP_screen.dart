import 'package:bawabtalsharq/Utils/Localization/Language/Languages.dart';
import 'package:bawabtalsharq/Utils/images.dart';
import 'package:bawabtalsharq/Utils/loading.dart';
import 'package:bawabtalsharq/Utils/styles.dart';
import 'package:bawabtalsharq/bloc/authBlocs/registerBloc/register_bloc.dart';
import 'package:bawabtalsharq/bloc/authBlocs/registerBloc/register_event.dart';
import 'package:bawabtalsharq/bloc/authBlocs/registerBloc/register_state.dart';
import 'package:bawabtalsharq/main.dart';
import 'package:bawabtalsharq/widgets/widgets.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:bawabtalsharq/Services/AnalyticsService.dart';

class VerificationScreen extends StatefulWidget {
  final String verId;
  final Map data;
  VerificationScreen({@required this.verId, @required this.data});

  @override
  _VerificationScreenState createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  var onTapRecognizer;

  // final StreamController<ErrorAnimationType> errorController =
  //     StreamController<ErrorAnimationType>();

  bool hasError = false;
  bool codeTyped = false;
  String currentText = "";
  String smsCode = "";
  String companyName = '';
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final formKey = GlobalKey<FormState>();
  RegisterBloc _registerBloc;

  @override
  void initState() {
    super.initState();
    onTapRecognizer = TapGestureRecognizer()
      ..onTap = () {
        Navigator.pop(context);
      };
    _registerBloc = RegisterBloc();
    AnalyticsService().setScreenName(name: 'Verfication_Screen');
  }

  @override
  void dispose() {
    super.dispose();
    _registerBloc.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        resizeToAvoidBottomPadding: false,
        body: BlocProvider(
          create: (context) => _registerBloc,
          child: BlocListener<RegisterBloc, RegisterState>(
            listener: (context, state) {
              if (state is RegisterLoadedState) {
                showToast(text: "Registeration Completed Successfully!");
                AnalyticsService().register(method: 'Email');

                AnalyticsService().sendAnalyticsEvent(
                    eventName: 'Registeration_Completed',
                    param: {
                      'msg': 'Registeration is completed Successfully',
                      'bool': true,
                    });
                Navigator.pushReplacementNamed(
                    context, ScreenRoutes.mainScreen);
              } else if (state is FirebaseExceptionState) {
                AnalyticsService().sendAnalyticsEvent(
                    eventName: 'Error_FirebaseException',
                    param: {
                      'msg': 'Firebase error',
                      'error': '${state.msg}',
                      'Screen_Name': 'Verfication_Screen',
                      'bool': false,
                    });

                _scaffoldKey.currentState.showSnackBar(
                  SnackBar(
                    content: Text(state.msg),
                  ),
                );
              } else if (state is PhoneAlreadyRegisteredState) {
                AnalyticsService().sendAnalyticsEvent(
                    eventName: 'Phone_Already_Registered',
                    param: {
                      'msg':
                          'User is trying to register with phone already registered',
                      'bool': false,
                    });
                return showPhoneDialog(context);
              }
            },
            child: BlocBuilder<RegisterBloc, RegisterState>(
              builder: (context, state) {
                if (state is ResumeRegisterState) {
                  if (widget.data['company'] != null) {
                    companyName = '';
                  } else {
                    companyName = widget.data['company'];
                  }
                  AnalyticsService().register(method: 'Phone');

                  _registerBloc.add(DoRegisterEvent(
                      phone: widget.data['phone'],
                      email: widget.data['email'],
                      password: widget.data['password'],
                      firstname: widget.data['firstname'],
                      lastname: widget.data['lastname'],
                      userType: widget.data['userType'],
                      country: widget.data['country'],
                      company: companyName));
                  AnalyticsService().sendAnalyticsEvent(
                      eventName: 'Verfication_Screen',
                      param: {
                        'msg': 'Registering user',
                        'bool': true,
                      });
                } else if (state is RegisterLoadingState) {
                  return LoadingLogo();
                } else if (state is RegisterNetworkErrorState) {
                  AnalyticsService().sendAnalyticsEvent(
                      eventName: 'Error_No_Network',
                      param: {
                        'msg': 'No network',
                        'Screen_Name': 'Verification_Screen',
                        'bool': false,
                      });
                  return Center(
                    child: Text(Languages.of(context).noNetwork),
                  );
                }
                return _buildMain();
              },
            ),
          ),
        ));
  }

  Widget _buildMain() {
    final mediaQuery = MediaQuery.of(context);

    return Stack(
      children: [
        Positioned(
          width: mediaQuery.size.width,
          height: mediaQuery.size.height,
          child: Container(
            width: mediaQuery.size.width,
            height: mediaQuery.size.height,
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
              mainAxisSize: MainAxisSize.min,
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
                  Languages.of(context).verification,
                  40,
                  color: Color(0xff515151),
                  fontWeight: FontWeight.w700,
                ),
                SizedBox(
                  height: 18,
                ),
                buildText(
                  Languages.of(context).otpCode,
                  15,
                  color: Color(0xff515151),
                  fontWeight: FontWeight.w400,
                ),
                SizedBox(height: 40),
                PinCodeTextField(
                  backgroundColor: Colors.white,
                  appContext: context,
                  length: 6,
                  obscureText: false,
                  obscuringCharacter: '*',
                  animationType: AnimationType.fade,
                  validator: (v) {
                    print(v);
                    if (v.length < 6) {
                      return "Please enter the code form sms ";
                    }
                    return null;
                  },
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(10),
                    fieldHeight: mediaQuery.size.height * .06,
                    fieldWidth: mediaQuery.size.width * .1,
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
                  // errorAnimationController: errorController,
                  keyboardType: TextInputType.number,
                  boxShadows: [
                    BoxShadow(
                      offset: Offset(0, 1),
                      color: Colors.grey[300],
                      blurRadius: 7,
                    )
                  ],
                  onCompleted: (v) {
                    print("Completed:$v");
                    smsCode = currentText;
                    codeTyped = true;
                    print('smsCode: $smsCode');
                  },
                  onChanged: (value) {
                    setState(() {
                      currentText = value;
                    });
                  },
                ),
                SizedBox(
                  height: 15,
                ),
                // Row(
                //   children: [
                //     buildText(
                //       Languages.of(context).resendCode,
                //       15,
                //     ),
                //     buildText(' 30 Seconds', 15, color: defaultOrangeColor),
                //   ],
                // ),
                // SizedBox(
                //   height: 20,
                // ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    signInFlatButton(context, mediaQuery.size.height,
                        Languages.of(context).verify, () {
                      if (codeTyped)
                        _registerBloc.add(
                            SignWithOTP(smsCode: smsCode, verId: widget.verId));
                      AnalyticsService().sendAnalyticsEvent(
                          eventName: 'Verifying_Phone',
                          param: {
                            'msg':
                                'Enter your OTP code that was sent to  verfiy',
                            'Screen_Name': 'Verifivation_Screen',
                            'bool': true,
                          });
                    }),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

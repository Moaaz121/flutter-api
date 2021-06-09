import 'package:bawabtalsharq/Utils/Localization/Language/Languages.dart';
import 'package:bawabtalsharq/Utils/images.dart';
import 'package:bawabtalsharq/bloc/authBlocs/forgetPasswordBloc/forget_password_bloc.dart';
import 'package:bawabtalsharq/bloc/authBlocs/forgetPasswordBloc/forget_password_event.dart';
import 'package:bawabtalsharq/bloc/authBlocs/forgetPasswordBloc/forget_password_state.dart';
import 'package:bawabtalsharq/main.dart';
import 'package:bawabtalsharq/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bawabtalsharq/Services/AnalyticsService.dart';

class ForgetPassword extends StatefulWidget {
  @override
  _ForgetPasswordState createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  ForgetPasswordBloc _forgetPasswordBloc;
  bool isLoading = false;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  String _emailErrorMessage;
  TextEditingController emailController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _forgetPasswordBloc = ForgetPasswordBloc();
    AnalyticsService().setScreenName(name: 'Forget_Password_Screen');
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        body: BlocBuilder<ForgetPasswordBloc, ForgetPasswordState>(
          bloc: _forgetPasswordBloc,
          builder: (context, state) {
            if (state is ForgetPasswordLoadingState) {
              if (!isLoading) {
                progressBar();
                isLoading = true;
              }
            } else if (state is ForgetPasswordLoadedState) {
              print('loaded');
              _forgetPasswordBloc.add(ResetState());
              isLoading = false;
              if (state.baseModel.code == 200) {
                AnalyticsService().sendAnalyticsEvent(
                    eventName: 'New_Paswword_created',
                    param: {
                      'msg': 'New password is sent to user\'s email',
                      'bool': true,
                    });
                showToast(
                    text: "Please check your email to reset your password");
                print(state.baseModel.msg);
                SchedulerBinding.instance.addPostFrameCallback((_) {
                  Navigator.pushNamed(context, ScreenRoutes.mainScreen);
                });
              } else {
                showToast(text: state.baseModel.msg);
                AnalyticsService()
                    .sendAnalyticsEvent(eventName: 'Error_Response', param: {
                  'msg': 'New password creation is not successful',
                  'Screen_Name': 'Forget_Password_Screen',
                  'error': '${state.baseModel.msg}',
                  'bool': false,
                });
              }
            }
            return Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(logo1),
                  fit: BoxFit.fitHeight,
                ),
              ),
              child: Container(
                margin:
                    EdgeInsets.only(top: 58, left: 26, right: 25, bottom: 59),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(33),
                    boxShadow: [
                      makeShadow(),
                    ]),
                child: Padding(
                  padding: const EdgeInsets.only(top: 35, right: 20, left: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      backIconRounded(onBackPressed: () {
                        Navigator.of(context).pop();
                      }),
                      SizedBox(
                        height: height * .11,
                      ),
                      buildText(Languages.of(context).forgetPassword, 38,
                          fontWeight: FontWeight.bold),
                      SizedBox(
                        height: height * .11,
                      ),
                      customTextField(context,
                          controller: emailController,
                          errorText: _emailErrorMessage,
                          leftIcon: Icons.email,
                          label: Languages.of(context).emailAddress,
                          width: 1),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * .11,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          signInFlatButton(
                              context, height, Languages.of(context).send, () {
                            FocusScope.of(context).unfocus();
                            _emailErrorMessage = null;
                            setState(() {
                              if (emailController.text.isEmpty)
                                _emailErrorMessage = 'Empty Field';
                              else {
                                _forgetPasswordBloc.add(DoForgetPasswordEvent(
                                    emailController.text));
                                AnalyticsService().sendAnalyticsEvent(
                                    eventName: 'Save_Password_Changes',
                                    param: {
                                      'msg': 'Saving New Password',
                                      'bool': true,
                                    });
                              }
                            });
                          }),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ));
  }
}

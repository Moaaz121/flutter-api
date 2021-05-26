import 'package:bawabtalsharq/Model/user_model.dart';
import 'package:bawabtalsharq/Utils/Localization/Language/Languages.dart';
import 'package:bawabtalsharq/Utils/constants.dart';
import 'package:bawabtalsharq/Utils/validator_util.dart';
import 'package:bawabtalsharq/bloc/updateProfileBlocs/changePassword/change_password_bloc.dart';
import 'package:bawabtalsharq/bloc/updateProfileBlocs/changePassword/change_password_event.dart';
import 'package:bawabtalsharq/bloc/updateProfileBlocs/changePassword/change_password_state.dart';
import 'package:bawabtalsharq/main.dart';
import 'package:bawabtalsharq/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChangePassword extends StatefulWidget {
  @override
  _ChangePasswordState createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  TextEditingController oldPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  UserLocal _currentUser;

  String oldPasswordError;
  String newPasswordError;
  String confirmPasswordError;

  bool isLoading = false;
  bool obSecureText = true;
  ChangePasswordBloc _changePasswordBloc;

  @override
  void initState() {
    _changePasswordBloc = ChangePasswordBloc();
    Constants.getUserInfo().then((value) => _currentUser = value.data);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarBuilder(
          title: Languages.of(context).myAccount,
          onBackPressed: () {
            Navigator.of(context).pop();
          }),
      body: BlocBuilder<ChangePasswordBloc, ChangePasswordState>(
        bloc: _changePasswordBloc,
        builder: (context, state) {
          if (state is PasswordChangeLoadingState) {
            if (!isLoading) {
              progressBar();
              isLoading = true;
            }
          } else if (state is PasswordChangeLoadedState) {
            print('loaded');
            _changePasswordBloc.add(ResetState());
            isLoading = false;
            if (state.response.code == 200) {
              SchedulerBinding.instance.addPostFrameCallback((_) {
                Navigator.pushReplacementNamed(
                    context, ScreenRoutes.mainScreen);
              });
              Scaffold.of(context)
                  .showSnackBar(SnackBar(content: Text(state.response.msg)));
            } else {
              SchedulerBinding.instance.addPostFrameCallback((_) {
                Scaffold.of(context)
                    .showSnackBar(SnackBar(content: Text(state.response.msg)));
              });
              Navigator.pop(context);
            }
          }
          return SingleChildScrollView(
            child: Padding(
              padding:
                  const EdgeInsetsDirectional.only(start: 30, top: 30, end: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildText(Languages.of(context).useThisForm, 16,
                      fontWeight: FontWeight.w700),
                  SizedBox(
                    height: 20,
                  ),
                  textFiledPrice(context, Languages.of(context).oldPassword,
                      width: 1,
                      isPassword: true,
                      controller: oldPasswordController,
                      errorMessage: oldPasswordError),
                  SizedBox(
                    height: 20,
                  ),
                  textFiledPrice(context, Languages.of(context).newPassword,
                      width: 1,
                      isPassword: true,
                      controller: newPasswordController,
                      errorMessage: newPasswordError),
                  SizedBox(
                    height: 20,
                  ),
                  textFiledPrice(context, Languages.of(context).confirmPass,
                      width: 1,
                      isPassword: true,
                      controller: confirmPasswordController,
                      errorMessage: confirmPasswordError),
                  SizedBox(
                    height: 100,
                  ),
                  signInFlatButton(context, MediaQuery.of(context).size.height,
                      Languages.of(context).saveChange, () {
                    FocusScope.of(context).unfocus();
                    confirmPasswordError = null;
                    newPasswordError = null;
                    oldPasswordError = null;
                    setState(() {
                      if (oldPasswordController.text.isEmpty)
                        oldPasswordError = 'Empty Field';
                      else if (newPasswordController.text.isEmpty)
                        newPasswordError = 'Empty Field';
                      else if (confirmPasswordController.text.isEmpty)
                        confirmPasswordError = 'Empty Field';
                      else if (!passwordValidator(
                          newPasswordController.text.trim()))
                        newPasswordError = 'Weak Password';
                      else if (newPasswordController.text !=
                          confirmPasswordController.text)
                        confirmPasswordError = 'Different password';
                      // else if (!passwordValidator(
                      //     passwordController.text))
                      //   _passwordErrorMessage = 'Weak Password';
                      else {
                        //get user information rather than static info
                        _changePasswordBloc.add(
                          PasswordChangeEvent(
                              _currentUser.userId,
                              _currentUser.apiKey,
                              oldPasswordController.text,
                              newPasswordController.text),
                        );
                      }
                    });
                  }, widthOfBtn: 1),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
// textFiledPrice(context, 'First Name', 1),

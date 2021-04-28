import 'package:bawabtalsharq/Utils/Localization/Language/Languages.dart';
import 'package:bawabtalsharq/widgets/widgets.dart';
import 'package:bawabtalsharq/bloc/updateProfileBlocs/changePassword/change_password_bloc.dart';
import 'package:bawabtalsharq/bloc/updateProfileBlocs/changePassword/change_password_event.dart';
import 'package:bawabtalsharq/bloc/updateProfileBlocs/changePassword/change_password_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bawabtalsharq/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/material.dart';

class ChangePassword extends StatefulWidget {
  @override
  _ChangePasswordState createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  TextEditingController oldPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  bool isLoading = false;
  bool obSecureText = true;
  ChangePasswordBloc _changePasswordBloc;

  @override
  void initState() {
    _changePasswordBloc = ChangePasswordBloc();
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
              showLoadingDialog(context);
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
                  textFiledPrice(context, Languages.of(context).oldPassword, 1,
                      isPassword: true, controller: oldPasswordController),
                  SizedBox(
                    height: 20,
                  ),
                  textFiledPrice(context, Languages.of(context).newPassword, 1,
                      isPassword: true, controller: newPasswordController),
                  SizedBox(
                    height: 20,
                  ),
                  textFiledPrice(context, Languages.of(context).confirmPass, 1,
                      isPassword: true, controller: confirmPasswordController),
                  SizedBox(
                    height: 100,
                  ),
                  signInFlatButton(context, MediaQuery.of(context).size.height,
                      Languages.of(context).saveChange, () {
                    FocusScope.of(context).unfocus();
                    _changePasswordBloc.add(PasswordChangeEvent(
                        '1', '1619614894', 'Bahaa1234', 'Bahaa12345'));
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

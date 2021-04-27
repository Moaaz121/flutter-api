import 'package:bawabtalsharq/Utils/Localization/Language/Languages.dart';
import 'package:bawabtalsharq/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChangePassword extends StatefulWidget {
  @override
  _ChangePasswordState createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  TextEditingController passwordController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  bool isLoading = false;
  bool obSecureText = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarBuilder(
          title: Languages.of(context).myAccount,
          onBackPressed: () {
            Navigator.of(context).pop();
          }),
      body: SingleChildScrollView(
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
                  isPassword: true),
              SizedBox(
                height: 20,
              ),
              textFiledPrice(context, Languages.of(context).newPassword, 1,
                  isPassword: true),
              SizedBox(
                height: 20,
              ),
              textFiledPrice(context, Languages.of(context).confirmPass, 1,
                  isPassword: true),
              SizedBox(
                height: 100,
              ),
              signInFlatButton(context, MediaQuery.of(context).size.height,
                  Languages.of(context).saveChange, () {},
                  widthOfBtn: 1),
            ],
          ),
        ),
      ),
    );
  }
}
// textFiledPrice(context, 'First Name', 1),

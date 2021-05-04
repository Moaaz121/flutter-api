import 'package:bawabtalsharq/Utils/Localization/Language/Languages.dart';
import 'package:bawabtalsharq/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChangePassword extends StatefulWidget {
  @override
  _ChangePasswordState createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  TextEditingController oldPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  bool obSecureText = true;
  bool newSecureText = true;
  bool confirmSecureText = true;

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
              textFiledPrice(
                context,
                Languages.of(context).oldPassword,
                1,
                controller: oldPasswordController,
                isPassword: obSecureText,
                rightBtn: IconButton(
                  onPressed: () {
                    setState(() {
                      obSecureText = !obSecureText;
                    });
                  },
                  icon: Icon(
                      obSecureText ? Icons.visibility_off : Icons.visibility),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              textFiledPrice(
                context,
                Languages.of(context).newPassword,
                1,
                controller: newPasswordController,
                isPassword: newSecureText,
                keyboardType: TextInputType.emailAddress,
                rightBtn: IconButton(
                  onPressed: () {
                    setState(() {
                      newSecureText = !newSecureText;
                    });
                  },
                  icon: Icon(
                      newSecureText ? Icons.visibility_off : Icons.visibility),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              textFiledPrice(
                context,
                Languages.of(context).confirmPass,
                1,
                controller: confirmPasswordController,
                isPassword: confirmSecureText,
                rightBtn: IconButton(
                  onPressed: () {
                    setState(() {
                      confirmSecureText = !confirmSecureText;
                    });
                  },
                  icon: Icon(confirmSecureText
                      ? Icons.visibility_off
                      : Icons.visibility),
                ),
              ),
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

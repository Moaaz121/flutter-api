import 'package:flutter/material.dart';

import 'package:bawabtalsharq/bloc/authBlocs/registerBloc/register_bloc.dart';
import 'package:bawabtalsharq/bloc/authBlocs/registerBloc/register_state.dart';
import 'package:bawabtalsharq/bloc/authBlocs/registerBloc/register_event.dart';

import 'package:bawabtalsharq/main.dart';
import 'package:bawabtalsharq/Utils/images.dart';
import 'package:bawabtalsharq/widgets/widgets.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OTPScreen extends StatefulWidget {
  final String verId;
  OTPScreen(this.verId);
  @override
  _OTPScreenState createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  TextEditingController _smsCodeController = TextEditingController();
  RegisterBloc _registerBloc;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _registerBloc = RegisterBloc();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _registerBloc.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => _registerBloc,
        child: BlocListener<RegisterBloc, RegisterState>(
          listener: (context, state) {
            if (state is ResumeRegisterState) {
              Navigator.popAndPushNamed(context, ScreenRoutes.signUpScreen);
            }
          },
          child: BlocBuilder<RegisterBloc, RegisterState>(
            builder: (context, state) {
              return Stack(
                children: [
                  Positioned(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(logo1),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                        top: 60, left: 25, right: 25, bottom: 20),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(33),
                        boxShadow: [
                          makeShadow(),
                        ]),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text("Enter SMS Code"),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextField(
                              controller: _smsCodeController,
                            ),
                          ),
                          FlatButton(
                            child: Text("Verify"),
                            textColor: Colors.white,
                            color: Colors.redAccent,
                            onPressed: () {
                              print(_smsCodeController.text);
                              print(widget.verId);
                              // _registerBloc.add(SignWithOTP(
                              //     smsCode: _smsCodeController.text.trim(),
                              //     verId: verId));
                            },
                          )
                        ],
                      ),
                    ),
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

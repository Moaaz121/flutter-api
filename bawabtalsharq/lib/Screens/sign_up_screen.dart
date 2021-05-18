import 'package:bawabtalsharq/Utils/Localization/Language/Languages.dart';
import 'package:bawabtalsharq/Utils/images.dart';
import 'package:bawabtalsharq/Utils/styles.dart';
import 'package:bawabtalsharq/Utils/validator_util.dart';
import 'package:bawabtalsharq/main.dart';
import 'package:bawabtalsharq/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:bawabtalsharq/bloc/authBlocs/registerBloc/register_bloc.dart';
import 'package:bawabtalsharq/bloc/authBlocs/registerBloc/register_state.dart';
import 'package:bawabtalsharq/bloc/authBlocs/registerBloc/register_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/scheduler.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class Country {
  int id;
  String name;

  Country(this.id, this.name);

  static List<Country> getCountries() {
    return <Country>[
      Country(1, 'Country/Region'),
      Country(2, 'Egypt'),
      Country(3, 'Sodan'),
      Country(4, 'Asa'),
      Country(5, 'Coura'),
      Country(6, 'Yaban'),
    ];
  }
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool obSecureText = true;
  int selectedRadioTile;

  List<Country> _countries = Country.getCountries();
  List<DropdownMenuItem<Country>> _dropdownMenuItems;
  Country _selectedCountry;

  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String selectedRadio;

  String _emailErrorMessage;
  String _passwordErrorMessage;
  String _phoneErrorMessage;
  String _nameErrorMessage;

  bool isLoading = false;
  RegisterBloc _registerBloc;

  @override
  void initState() {
    _dropdownMenuItems = buildDropdownMenuItems(_countries);
    _selectedCountry = _dropdownMenuItems[0].value;
    selectedRadioTile = 0;
    _registerBloc = RegisterBloc();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    phoneController.dispose();
  }

  List<DropdownMenuItem<Country>> buildDropdownMenuItems(List Countries) {
    List<DropdownMenuItem<Country>> items = List();
    for (Country country in Countries) {
      items.add(
        DropdownMenuItem(
          value: country,
          child: Text(country.name),
        ),
      );
    }
    return items;
  }

  onChangeDropdownItem(Country selectedCompany) {
    setState(() {
      _selectedCountry = selectedCompany;
    });
  }

  setSelectedRadioTile(int val) {
    setState(() {
      selectedRadioTile = val;
      switch (val) {
        case 1:
          selectedRadio = 'Buyer';
          break;
        case 2:
          selectedRadio = 'Seller';
          break;
        case 3:
          selectedRadio = 'Both';
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocProvider(
      create: (context) => _registerBloc,
      child: BlocListener<RegisterBloc, RegisterState>(
        listener: (context, state) {
          if (state is EnterSMSCodeState) {
            print(state.verId);
            Navigator.pushNamed(context, ScreenRoutes.otpScreen,
                arguments: state.verId);
          }
          //  else if (state is ResumeRegisterState) {
          //   return showResumeDialog();
          // }
        },
        child: BlocBuilder<RegisterBloc, RegisterState>(
          bloc: _registerBloc,
          builder: (context, state) {
            if (state is RegisterLoadingState) {
              if (!isLoading) {
                showLoadingDialog(context);
                isLoading = true;
              }
            } else if (state is RegisterLoadedState) {
              _registerBloc.add(ResetState());
              isLoading = false;
              if (state.userResponse.code == 200) {
                SchedulerBinding.instance.addPostFrameCallback((_) {
                  Navigator.pushReplacementNamed(
                      context, ScreenRoutes.interestingScreen);
                });
              } else {
                SchedulerBinding.instance.addPostFrameCallback((_) {
                  Scaffold.of(context).showSnackBar(
                    SnackBar(
                      content: Text(state.userResponse.msg),
                    ),
                  );
                });
                Navigator.pop(context);
              }
            } else if (state is ResumeRegisterState) {
              _registerBloc.add(
                DoRegisterEvent(
                  phoneController.text,
                  emailController.text,
                  nameController.text,
                  passwordController.text,
                  selectedRadio,
                ),
              );
            }
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
                  child: SingleChildScrollView(
                    reverse: false,
                    padding: EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        backIconRounded(onBackPressed: () {
                          Navigator.of(context).pop();
                        }),
                        buildSizedBox(height: 20),
                        buildText(Languages.of(context).signUp, 40,
                            fontWeight: FontWeight.w700),
                        buildSizedBox(height: 10),
                        buildSizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: DropdownButton(
                            isExpanded: true,
                            isDense: false,
                            value: _selectedCountry,
                            items: _dropdownMenuItems,
                            onChanged: onChangeDropdownItem,
                          ),
                        ),
                        buildSizedBox(height: 10),
                        buildText(
                          Languages.of(context).plzSecect,
                          15,
                          color: Colors.grey[500],
                          fontWeight: FontWeight.w400,
                        ),
                        buildSizedBox(
                            height: 25,
                            child: buildRadioListTile(
                                Languages.of(context).buyer, 1)),
                        buildSizedBox(
                            height: 25,
                            child: buildRadioListTile(
                                Languages.of(context).seller, 2)),
                        buildRadioListTile(Languages.of(context).both, 3),
                        customTextField(context,
                            textInputType: TextInputType.name,
                            errorText: _nameErrorMessage,
                            controller: nameController,
                            label: Languages.of(context).fullName,
                            width: 1,
                            leftIcon: Icons.person),
                        customTextField(context,
                            textInputType: TextInputType.emailAddress,
                            errorText: _emailErrorMessage,
                            controller: emailController,
                            label: Languages.of(context).email,
                            width: 1,
                            leftIcon: Icons.email),
                        customTextField(
                          context,
                          textInputType: TextInputType.visiblePassword,
                          errorText: _passwordErrorMessage,
                          controller: passwordController,
                          width: 1,
                          label: Languages.of(context).loginPass,
                          leftIcon: Icons.lock,
                          isPassword: obSecureText,
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
                        customTextField(
                          context,
                          width: 1,
                          label: Languages.of(context).confirmPass,
                          isPassword: obSecureText,
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
                        customTextField(context,
                            width: 1,
                            label: Languages.of(context).companyName,
                            leftIcon: Icons.home_work),
                        Row(
                          children: [
                            Expanded(
                              child: customTextField(
                                context,
                                width: 0.15,
                                label: Languages.of(context).n,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            customTextField(context,
                                textInputType: TextInputType.phone,
                                errorText: _phoneErrorMessage,
                                controller: phoneController,
                                label: Languages.of(context).tel,
                                width: 0.7,
                                leftIcon: Icons.phone),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            signInFlatButton(
                                context,
                                MediaQuery.of(context).size.height,
                                Languages.of(context).signUp, () {
                              FocusScope.of(context).unfocus();
                              _passwordErrorMessage = null;
                              _emailErrorMessage = null;
                              _phoneErrorMessage = null;
                              _nameErrorMessage = null;
                              setState(() {
                                if (nameController.text.isEmpty)
                                  _nameErrorMessage = 'Empty Field';
                                else if (passwordController.text.isEmpty)
                                  _passwordErrorMessage = 'Empty Field';
                                else if (phoneController.text.isEmpty)
                                  _phoneErrorMessage = 'Empty Field';
                                else if (emailController.text.isEmpty)
                                  _emailErrorMessage = 'Empty Field';
                                else if (selectedRadio == null)
                                  Scaffold.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text('user type not selected'),
                                    ),
                                  );
                                else if (!emailValidator(
                                    emailController.text.trim()))
                                  _emailErrorMessage =
                                      'please enter correct email address';
                                else if (!phoneValidator(
                                    phoneController.text.trim()))
                                  _phoneErrorMessage =
                                      'please enter correct Phone Number';
                                else if (!passwordValidator(
                                    passwordController.text))
                                  _passwordErrorMessage = 'Weak Password';
                                else {
                                  _registerBloc.add(VerifyPhone(
                                      phone:
                                          '+2${phoneController.text.trim()}'));
                                }
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
          },
        ),
      ),
    ));
  }

  SizedBox buildSizedBox({double height, Widget child, double width}) {
    return SizedBox(
      height: height,
      child: child,
      width: width,
    );
  }

  RadioListTile<int> buildRadioListTile(String text, int value) {
    return RadioListTile(
      title: Text(text),
      groupValue: selectedRadioTile,
      value: value,
      dense: true,
      onChanged: (val) {
        print("Radio Tile pressed $val");
        setSelectedRadioTile(val);
      },
      activeColor: OrangeColor,
    );
  }
}

import 'package:bawabtalsharq/Model/country_model.dart';
import 'package:bawabtalsharq/Screens/forget_password/verification_OTP_screen.dart';
import 'package:bawabtalsharq/Utils/Localization/Language/Languages.dart';
import 'package:bawabtalsharq/Utils/images.dart';
import 'package:bawabtalsharq/Utils/styles.dart';
import 'package:bawabtalsharq/bloc/authBlocs/registerBloc/register_bloc.dart';
import 'package:bawabtalsharq/bloc/authBlocs/registerBloc/register_event.dart';
import 'package:bawabtalsharq/bloc/authBlocs/registerBloc/register_state.dart';
import 'package:bawabtalsharq/widgets/widgets.dart';
import 'package:bawabtalsharq/Utils/loading.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool obSecureText = true;
  int selectedRadioTile;
  bool companyTypeBool = true;
  Map data;
  String dropDownVal = '';

  String countryCode = '';

  List<CountryData> _countries = [];
  List<String> _countriesName = [];

  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmpasswordController =
      TextEditingController();
  final TextEditingController companyController = TextEditingController();

  String selectedRadio;
  bool _passwordErrorMessage;
  bool isLoading = false;

  RegisterBloc _registerBloc;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    selectedRadioTile = 0;

    _registerBloc = RegisterBloc();
    _registerBloc.add(GetCountries());

    _passwordErrorMessage = false;
  }

  @override
  void dispose() {
    super.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    phoneController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmpasswordController.dispose();
    companyController.dispose();
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
      if (selectedRadio == 'Buyer') {
        companyTypeBool = false;
      } else {
        companyTypeBool = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        body: Form(
          key: _formKey,
          child: BlocProvider(
            create: (context) => _registerBloc,
            child: BlocListener<RegisterBloc, RegisterState>(
              listener: (context, state) {
                if (state is EnterSMSCodeState) {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => VerificationScreen(
                            verId: state.verId, data: state.data),
                      ));
                } else if (state is FirebaseExceptionState) {
                  setState(() {
                    isLoading = false;
                  });
                  Navigator.pop(context);
                  _scaffoldKey.currentState.showSnackBar(
                    SnackBar(
                      content: Text(state.msg),
                    ),
                  );
                } else if (state is PhoneAlreadyRegisteredState) {
                  setState(() {
                    isLoading = false;
                  });
                  Navigator.pop(context);
                  _scaffoldKey.currentState.showSnackBar(
                    SnackBar(
                      content: Text(state.msg),
                    ),
                  );
                }
              },
              child: BlocBuilder<RegisterBloc, RegisterState>(
                bloc: _registerBloc,
                builder: (context, state) {
                  if (state is VerifyingPhoneLoadingState) {
                    return LoadingLogo();
                  } else if (state is LoadedCountriesState) {
                    List.generate(state.countries.length, (i) {
                      _countries.add(state.countries[i]);
                      _countriesName.add(state.countries[i].country);
                    });
                    _registerBloc.add(GetLoadedCountries());
                    return LoadingLogo();
                  } else if (state is ShowLoadedCountriesState) {
                    return _buildMain();
                  } else if (state is LoadingCountriesState) {
                    return LoadingLogo();
                  }

                  return _buildMain();
                },
              ),
            ),
          ),
        ));
  }

  Widget _buildMain() {
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
          margin:
              const EdgeInsets.only(top: 60, left: 25, right: 25, bottom: 20),
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
                buildSizedBox(height: 10),
                buildText(
                  Languages.of(context).plzSecect,
                  15,
                  color: Colors.grey[500],
                  fontWeight: FontWeight.w400,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildRadioListTile(Languages.of(context).buyer, 1),
                    buildRadioListTile(Languages.of(context).seller, 2),
                    buildRadioListTile(Languages.of(context).both, 3),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: customTextFormField(
                        context,
                        textInputType: TextInputType.emailAddress,
                        controller: firstNameController,
                        label: Languages.of(context).firstName,
                        width: .50,
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Expanded(
                      child: customTextFormField(context,
                          textInputType: TextInputType.emailAddress,
                          label: Languages.of(context).lasttNam,
                          width: .50,
                          controller: lastNameController),
                    ),
                  ],
                ),
                customTextFormField(context,
                    textInputType: TextInputType.emailAddress,
                    controller: emailController,
                    label: Languages.of(context).email,
                    width: 1,
                    leftIcon: Icons.email),
                customTextFormField(
                  context,
                  textInputType: TextInputType.visiblePassword,
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
                    icon: Icon(
                        obSecureText ? Icons.visibility_off : Icons.visibility),
                  ),
                ),
                customTextFormField(
                  context,
                  width: 1,
                  label: Languages.of(context).confirmPass,
                  textInputType: TextInputType.visiblePassword,
                  isPassword: obSecureText,
                  controller: confirmpasswordController,
                  leftIcon: Icons.lock,
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
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Visibility(
                    visible: _passwordErrorMessage,
                    child: Text(
                      'Password and confirm password does not match',
                      style: TextStyle(color: Colors.red, fontSize: 10),
                    ),
                  ),
                ),
                customTextFormField(context,
                    textInputType: TextInputType.phone,
                    controller: phoneController,
                    label: Languages.of(context).tel,
                    leftIcon: Icons.phone),
                SizedBox(
                  height: 10,
                ),
                Visibility(
                  visible: companyTypeBool,
                  child: customTextFormField(context,
                      width: 1,
                      controller: companyController,
                      label: Languages.of(context).companyName,
                      leftIcon: Icons.home_work),
                ),
                SizedBox(
                  height: 15,
                ),
                buildSizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: dropDownButton()),
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

                      if (_formKey.currentState.validate()) {
                        if (selectedRadio == null) {
                          _scaffoldKey.currentState.showSnackBar(
                            SnackBar(
                              content: Text(
                                'User type is not selected',
                                style: TextStyle(color: Colors.red),
                              ),
                            ),
                          );
                        } else if (passwordController.text.trim() !=
                            confirmpasswordController.text.trim()) {
                          setState(() {
                            _passwordErrorMessage = true;
                          });
                        } else {
                          _passwordErrorMessage = false;
                          isLoading = true;
                          print('Verifying phone');
                          data = {
                            'phone': '+2${phoneController.text.trim()}',
                            'email': emailController.text.trim(),
                            'firstname': firstNameController.text.trim(),
                            'lastname': lastNameController.text.trim(),
                            'password': passwordController.text.trim(),
                            'userType': selectedRadio,
                            'company': companyController.text.trim(),
                            'country': countryCode
                          };

                          _registerBloc.add(VerifyPhone(
                            data: data,
                          ));
                        }
                      }
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

  SizedBox buildSizedBox({double height, Widget child, double width}) {
    return SizedBox(
      height: height,
      child: child,
      width: width,
    );
  }

  Widget buildRadioListTile(String text, int value) {
    return Row(
      children: [
        Radio(
          groupValue: selectedRadioTile,
          value: value,
          onChanged: (val) {
            setSelectedRadioTile(val);
          },
          activeColor: OrangeColor,
        ),
        buildText(text, 12)
      ],
    );
  }

  Widget dropDownButton() {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(0),
        child: DropdownButtonFormField<String>(
          itemHeight: 50,
          decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.white, width: 2.0),
                borderRadius: BorderRadius.circular(10.0),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide(color: Colors.white, width: 2.0),
              ),
              filled: true,
              fillColor: Colors.white),
          isExpanded: true,
          items: _countriesName.map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value,
                  style: TextStyle(color: Colors.black, fontSize: 14)),
            );
          }).toList(),
          onChanged: (dropDownVal) {
            setState(() {
              countryCode =
                  _countries[_countriesName.indexOf(dropDownVal)].code;
            });
          },
          validator: (value) {
            if (value == null || value.isEmpty) return '';
            return null;
          },
          hint: Text(
            dropDownVal != '' ? dropDownVal : 'Select Country',
            style: TextStyle(
              color: backTabColor.withOpacity(0.8),
            ),
          ),
        ),
      ),
    );
  }
}

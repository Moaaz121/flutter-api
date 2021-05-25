import 'package:bawabtalsharq/Screens/forget_password/verification_OTP_screen.dart';
import 'package:bawabtalsharq/Utils/Localization/Language/Languages.dart';
import 'package:bawabtalsharq/Utils/images.dart';
import 'package:bawabtalsharq/Utils/styles.dart';
import 'package:bawabtalsharq/Utils/validator_util.dart';
import 'package:bawabtalsharq/bloc/authBlocs/registerBloc/register_bloc.dart';
import 'package:bawabtalsharq/bloc/authBlocs/registerBloc/register_event.dart';
import 'package:bawabtalsharq/bloc/authBlocs/registerBloc/register_state.dart';
import 'package:bawabtalsharq/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
      Country(3, 'Sudan'),
      Country(4, 'Asia'),
      Country(5, 'Korea'),
      Country(6, 'Japan'),
    ];
  }
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool obSecureText = true;
  int selectedRadioTile;
  bool companyTypeBool = true;
  Map data;

  List<Country> _countries = Country.getCountries();
  List<DropdownMenuItem<Country>> _dropdownMenuItems;
  Country _selectedCountry;
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmpasswordController = TextEditingController();
  TextEditingController companyController = TextEditingController();

  String selectedRadio;

  bool _passwordErrorMessage;

  bool isLoading = false;
  RegisterBloc _registerBloc;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _dropdownMenuItems = buildDropdownMenuItems(_countries);
    _selectedCountry = _dropdownMenuItems[0].value;
    selectedRadioTile = 0;
    _registerBloc = RegisterBloc();
    super.initState();
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
      if (selectedRadio == 'Seller') {
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
                }
              },
              child: BlocBuilder<RegisterBloc, RegisterState>(
                bloc: _registerBloc,
                builder: (context, state) {
                  if (state is VerifyingPhoneLoadingState) {
                    if (isLoading) {
                      showLoadingDialog(context);
                      isLoading = false;
                    }
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
                  child: DropdownButton(
                    isExpanded: true,
                    isDense: false,
                    value: _selectedCountry,
                    items: _dropdownMenuItems,
                    onChanged: onChangeDropdownItem,
                  ),
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
                        } else if (_selectedCountry.name == 'Country/Region') {
                          _scaffoldKey.currentState.showSnackBar(
                            SnackBar(
                              content: Text(
                                'Country is not selected',
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
                          print('country ${_selectedCountry.name}');
                          data = {
                            'phone': '+2${phoneController.text.trim()}',
                            'email': emailController.text.trim(),
                            'firstname': firstNameController.text.trim(),
                            'lastname': lastNameController.text.trim(),
                            'password': passwordController.text.trim(),
                            'userType': selectedRadio,
                            'company': companyController.text.trim(),
                            'country': _selectedCountry.name
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
}

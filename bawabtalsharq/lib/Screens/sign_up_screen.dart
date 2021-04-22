import 'package:bawabtalsharq/Utils/Localization/Language/Languages.dart';
import 'package:bawabtalsharq/Utils/images.dart';
import 'package:bawabtalsharq/Utils/styles.dart';
import 'package:bawabtalsharq/main.dart';
import 'package:bawabtalsharq/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
  bool isBuyer = true;

  List<Country> _countries = Country.getCountries();
  List<DropdownMenuItem<Country>> _dropdownMenuItems;
  Country _selectedCountry;
  @override
  void initState() {
    _dropdownMenuItems = buildDropdownMenuItems(_countries);
    _selectedCountry = _dropdownMenuItems[0].value;
    selectedRadioTile = 0;
    super.initState();
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

  // setSelectedRadioTile(int val) {
  //   setState(() {
  //     selectedRadioTile = val;
  //     setState(() {
  //       isBuyer = val == 1 ? true : false;
  //     });
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
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
                      child:
                          buildRadioListTile(Languages.of(context).buyer, 1)),
                  buildSizedBox(
                      height: 25,
                      child:
                          buildRadioListTile(Languages.of(context).seller, 2)),
                  buildRadioListTile(Languages.of(context).both, 3),
                  customTextField(context,
                      label: Languages.of(context).fullName,
                      width: 1,
                      leftIcon: Icons.person),
                  customTextField(context,
                      label: Languages.of(context).email,
                      width: 1,
                      leftIcon: Icons.email),
                  customTextField(
                    context,
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
                  customTextField(context,
                      label: Languages.of(context).tel,
                      width: 1,
                      leftIcon: Icons.phone),
                  Visibility(
                    visible: isBuyer ? false : true,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        customTextField(context,
                            label: Languages.of(context).plan,
                            width: 1,
                            leftIcon: Icons.add_chart),
                        customTextField(context,
                            label: Languages.of(context).companySite,
                            width: 1,
                            leftIcon: Icons.language),
                      ],
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
                        Navigator.pushNamed(
                            context, ScreenRoutes.interestingScreen);
                      }),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
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
        setState(() {
          selectedRadioTile = val;
          isBuyer = val == 1 ? true : false;
        });
        print("Radio Tile pressed $val");

        // setSelectedRadioTile(val);
      },
      activeColor: OrangeColor,
    );
  }
}

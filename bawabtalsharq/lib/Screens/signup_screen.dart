import 'package:bawabtalsharq/Screens/profile/contact_us/send_message_dialog.dart';
import 'package:bawabtalsharq/Utils/Localization/Language/Languages.dart';
import 'package:bawabtalsharq/Utils/Localization/LanguageHelper.dart';
import 'package:bawabtalsharq/Utils/images.dart';
import 'package:bawabtalsharq/Utils/styles.dart';
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

  setSelectedRadioTile(int val) {
    setState(() {
      selectedRadioTile = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(logo1),
            fit: BoxFit.fitHeight,
          ),
        ),
        child: Container(
          margin: EdgeInsets.only(top: 60, left: 25, right: 25, bottom: 60),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(33),
              boxShadow: [
                makeShadow(),
              ]),
          child: SingleChildScrollView(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: CircleAvatar(
                    radius: 9,
                    backgroundColor: orangeColor,
                    child: Icon(
                      LanguageHelper.isEnglish
                          ? Icons.keyboard_arrow_left_outlined
                          : Icons.keyboard_arrow_right_outlined,
                      size: 17,
                      color: Colors.white,
                    ),
                  ),
                ),
                buildSizedBox(height: 20),
                buildText(Languages.of(context).signUp, 40),
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
                buildText(Languages.of(context).plzSecect, 15,
                    color: Colors.grey[500], fontWeight: FontWeight.w400),
                buildSizedBox(
                    height: 30,
                    child: buildRadioListTile(Languages.of(context).buyer, 1)),
                buildSizedBox(
                    height: 30,
                    child: buildRadioListTile(Languages.of(context).seller, 2)),
                buildRadioListTile(Languages.of(context).both, 3),
                textFiledPrice(context, Languages.of(context).fullName, 0.9),
                buildSizedBox(height: 20),
                textFiledPrice(context, Languages.of(context).email, 0.9),
                buildSizedBox(height: 20),
                textFiledPrice(
                  context,
                  Languages.of(context).loginPass,
                  0.9,
                  isPassword: obSecureText,
                  dropIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        obSecureText = !obSecureText;
                      });
                    },
                    icon: Icon(
                        obSecureText ? Icons.visibility_off : Icons.visibility),
                  ),
                ),
                buildSizedBox(height: 20),
                textFiledPrice(
                  context,
                  Languages.of(context).confirmPass,
                  0.9,
                  isPassword: obSecureText,
                  dropIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        obSecureText = !obSecureText;
                      });
                    },
                    icon: Icon(
                        obSecureText ? Icons.visibility_off : Icons.visibility),
                  ),
                ),
                buildSizedBox(height: 20),
                textFiledPrice(context, Languages.of(context).companyName, 0.9),
                buildSizedBox(height: 20),
                buildSizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                        child: textFiledPrice(
                            context, Languages.of(context).n, 0.2)),
                    SizedBox(
                      width: 10,
                    ),
                    textFiledPrice(context, Languages.of(context).tel, 0.6),
                  ],
                ),
                buildSizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    submitButton(() {}, context, Languages.of(context).signUp),
                  ],
                ),
              ],
            ),
          ),
        ),
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
        print("Radio Tile pressed $val");
        setSelectedRadioTile(val);
      },
      activeColor: OrangeColor,
    );
  }
}

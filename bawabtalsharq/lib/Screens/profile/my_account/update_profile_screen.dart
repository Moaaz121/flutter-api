import 'package:bawabtalsharq/Utils/Localization/Language/Languages.dart';
import 'package:bawabtalsharq/Utils/images.dart';
import 'package:bawabtalsharq/Utils/styles.dart';
import 'package:bawabtalsharq/widgets/widgets.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UpdateProfile extends StatefulWidget {
  @override
  _UpdateProfileState createState() => _UpdateProfileState();
}

class _UpdateProfileState extends State<UpdateProfile> {
  DateTime _selectedDateTime;

  // Future _selectDate() async {
  //   DateTime picked = await showDatePicker(
  //       context: context,
  //       initialDate: new DateTime.now(),
  //       firstDate: new DateTime(2016),
  //       lastDate: new DateTime(2019));
  //   if (picked != null) setState(() => _value = picked.toString());
  // }

  @override
  Widget build(BuildContext context) {
    // final String formattedDate = DateFormat.yMd().format(_selectedDateTime);
    // final selectedText = Text('You selected: $formattedDate');

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: appBarBuilder(
            title: Languages.of(context).myAccount,
            onBackPressed: () {
              Navigator.of(context).pop();
            }),
        body: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.only(
                  top: 30, left: 20, right: 20, bottom: 20),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      child: Stack(
                        children: [
                          Container(
                            child: Center(
                              child: Container(
                                width: 96,
                                height: 96,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                    image: AssetImage(profile_image),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                              top: MediaQuery.of(context).size.width * 0.18,
                              right: MediaQuery.of(context).size.width * 0.32,
                              child: Container(
                                width: 30,
                                height: 30,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Color(0xffffffff),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Color(0x29464545),
                                        offset: Offset(0, 1),
                                        blurRadius: 6,
                                        spreadRadius: 0)
                                  ],
                                ),
                                child: Icon(
                                  Icons.camera_alt,
                                  color: BaseOrange,
                                  size: 22,
                                ),
                              ))
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    textFiledPrice(context, Languages.of(context).firstName, 1),
                    SizedBox(
                      height: 30,
                    ),
                    textFiledPrice(context, Languages.of(context).lasttNam, 1),
                    SizedBox(
                      height: 30,
                    ),
                    ExpansionTileCard(
                      shadowColor: Colors.transparent,
                      title: Text(_selectedDateTime == null
                          ? Languages.of(context).birthDay
                          : '${_selectedDateTime.day}/${_selectedDateTime.month}/${_selectedDateTime.year}'),
                      children: <Widget>[
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16.0,
                              vertical: 8.0,
                            ),
                            child: SizedBox(height: 150, child: datetime()),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    signInFlatButton(
                        context,
                        MediaQuery.of(context).size.height,
                        Languages.of(context).saveChange,
                        () {},
                        widthOfBtn: 1),
                  ])),
        ));
  }

  Widget datetime() {
    return CupertinoDatePicker(
      initialDateTime: DateTime.now(),
      onDateTimeChanged: (DateTime newDate) {
        setState(() {
          _selectedDateTime = newDate;
          print(newDate);
        });
      },
      mode: CupertinoDatePickerMode.date,
    );
  }
}

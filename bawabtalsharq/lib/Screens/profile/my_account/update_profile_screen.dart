import 'package:bawabtalsharq/Utils/Localization/Language/Languages.dart';
import 'package:bawabtalsharq/Utils/images.dart';
import 'package:bawabtalsharq/Utils/styles.dart';
import 'package:bawabtalsharq/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UpdateProfile extends StatefulWidget {
  @override
  _UpdateProfileState createState() => _UpdateProfileState();
}

class _UpdateProfileState extends State<UpdateProfile> {
  DateTime _selectedDateTime = DateTime.now();

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
    final String formattedDate = DateFormat.yMd().format(_selectedDateTime);
    final selectedText = Text('You selected: $formattedDate');

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: appBarBuilder(
            title: Languages.of(context).myAccount,
            onBackPressed: () {
              Navigator.of(context).pop();
            }),
        body: Padding(
            padding:
                const EdgeInsets.only(top: 30, left: 20, right: 20, bottom: 20),
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
                            top: MediaQuery.of(context).size.width * 0.16,
                            right: MediaQuery.of(context).size.width * 0.35,
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
                    height: 10,
                  ),
                  buildText('Bahaa Robert', 18, fontWeight: FontWeight.bold),
                  SizedBox(
                    height: 30,
                  ),
                  textFiledPrice(context, 'First Name', 1),
                  SizedBox(
                    height: 30,
                  ),
                  textFiledPrice(context, 'Last Name', 1),
                  SizedBox(
                    height: 30,
                  ),
                  // Text("${selectedDate.toLocal()}".split(' ')[0]),
                  // SizedBox(
                  //   height: 20.0,
                  // ),
                  // RaisedButton(
                  //   onPressed: () => _selectDate(context),
                  //   child: Text('Select date'),
                  // ),
                  SizedBox(height: 100, child: datetime()),
                  SizedBox(
                    height: 20.0,
                  ),
                  // signInFlatButton(context, MediaQuery.of(context).size.height,
                  //     'Save Change', () {},
                  //     widthOfBtn: 1),
                  CupertinoDateTextBox(
                      initialValue: DateTime.now(),
                      onDateChange: onDateChangeCallback,
                      hintText: 'Hint Text'),
                ])));
  }

  //
  // Widget buildTextFormField() {
  //   return Column(
  //     children: <Widget>[
  //       GestureDetector(
  //         onTap: () {
  //           showCupertinoModalPopup<void>(
  //               context: context,
  //               builder: (BuildContext context) {
  //                 return CupertinoDatePicker(
  //                   mode: CupertinoDatePickerMode.date,
  //                   initialDateTime: date,
  //                   onDateTimeChanged: (DateTime addSelectedDate) {
  //                     setState(() {
  //                       this.newDateTime = addSelectedDate;
  //                       date = newDateTime;
  //                     });
  //                   },
  //                 );
  //               });
  //         },
  //         child:
  //             //Show initial date here
  //             Text(
  //           yMMMMd().format(newDateTime),
  //         ),
  //       ),
  //     ],
  //   );
  // }

}

Widget datetime() {
  return CupertinoDatePicker(
    initialDateTime: DateTime.now(),
    onDateTimeChanged: (DateTime newdate) {
      print(newdate);
    },
    mode: CupertinoDatePickerMode.date,
  );
}

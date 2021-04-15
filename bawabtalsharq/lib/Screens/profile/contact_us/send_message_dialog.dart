import 'dart:ui';

import 'package:bawabtalsharq/Utils/Localization/Language/Languages.dart';
import 'package:bawabtalsharq/Utils/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget sendMessageDialog(BuildContext context) {
  return Center(
    child: ListView(
      shrinkWrap: true,
      children: [
        Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: Color(0x26e16036),
                    offset: Offset(0, 1),
                    blurRadius: 6,
                    spreadRadius: 0),
              ],
            ),
            margin: EdgeInsets.only(right: 20, left: 20),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Material(
                child: Column(
                  children: [
                    textFiledMessage(context,
                        text: Languages.of(context).email),
                    textFiledMessage(context,
                        text: Languages.of(context).subject),
                    textFiledMessage(context,
                        text: Languages.of(context).writeAMessage,
                        keyboardType: TextInputType.multiline,
                        lines: 5),
                    SizedBox(
                      height: 10,
                    ),
                    submitButton(context, () {}, Languages.of(context).submit)
                  ],
                ),
              ),
            )),
      ],
    ),
  );
}

Widget textFiledMessage(BuildContext context,
    {String text,
    TextInputType keyboardType = TextInputType.text,
    int lines = 1}) {
  return Column(
    children: [
      TextField(
        minLines: 1,
        maxLines: lines,
        keyboardType: keyboardType,
        enabled: true,
        decoration: InputDecoration(
          isDense: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(15.0),
            ),
          ),
          labelText: text,
        ),
      ),
      SizedBox(height: 24)
    ],
  );
}

Widget submitButton(BuildContext context, Function _function, String text,
    {double paddingOfWidth = 12}) {
  return FlatButton(
    onPressed: _function,
    child: Padding(
      padding: const EdgeInsets.all(12),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.bold,
          color: orangeColor,
        ),
      ),
    ),
    shape: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25),
        borderSide: BorderSide(width: 3, color: orangeColor)),
    highlightColor: orangeColor.withOpacity(0.2),
    splashColor: orangeColor.withOpacity(0.5),
  );
}

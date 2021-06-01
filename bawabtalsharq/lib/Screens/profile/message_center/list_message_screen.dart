import 'package:bawabtalsharq/Utils/Localization/Language/Languages.dart';
import 'package:bawabtalsharq/Utils/Localization/LanguageHelper.dart';
import 'package:bawabtalsharq/Utils/images.dart';
import 'package:bawabtalsharq/Utils/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListMessageScreen extends StatefulWidget {
  @override
  _ListMessageScreenState createState() => _ListMessageScreenState();
}

class _ListMessageScreenState extends State<ListMessageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
          top: 11,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                IconButton(
                  icon: CircleAvatar(
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
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(left: 35, top: 16),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(9.0),
                    child: buildTextField(
                        hint: (Languages.of(context).search), context: context),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 44,
                top: 22,
              ),
              child: ListView.separated(child: buildListMessage()),
            )
          ],
        ),
      ),
    );
  }

  Row buildListMessage() {
    return Row(children: [
      CircleAvatar(
        radius: 25,
        backgroundImage: AssetImage(eslam),
      ),
      Padding(
        padding: EdgeInsets.only(
          left: 22,
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text("varius sollicitudin",
              style: TextStyle(
                fontFamily: 'SegoeUI',
                color: Color(0xff000000),
                fontSize: 16,
                fontWeight: FontWeight.w700,
                fontStyle: FontStyle.normal,
              )),
          SizedBox(
            height: 7,
          ),
          Row(
            children: [
              Text("Etiam blandit est leo, etdawd weq df ...",
                  style: TextStyle(
                    fontFamily: 'SegoeUI',
                    color: Color(0xff000000),
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                  ))
            ],
          )
        ]),
      )
    ]);
  }

  Widget buildTextField({String hint, BuildContext context}) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.80,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(11), color: Colors.grey[100]),
      child: Center(
        child: SizedBox(
          height: 35,
          child: TextField(
            keyboardType: TextInputType.text,
            autocorrect: true,
            maxLines: 1,
            textAlign: TextAlign.start,
            cursorRadius: Radius.circular(50),
            cursorColor: orangeColor,
            decoration: InputDecoration(
              fillColor: Colors.transparent,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              contentPadding: EdgeInsets.only(
                left: 16,
                right: 16,
                bottom: 10, // HERE THE IMPORTANT PART
              ),
              errorBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
              hintText: hint,
              hintStyle: TextStyle(
                fontFamily: 'Segoe UI',
                fontSize: 13.0,
                color: const Color(0xFFB7B7B7).withOpacity(0.5),
              ),
              filled: true,
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:bawabtalsharq/Utils/Localization/Language/Languages.dart';
import 'package:bawabtalsharq/Utils/Localization/LanguageHelper.dart';
import 'package:bawabtalsharq/Utils/images.dart';
import 'package:bawabtalsharq/Utils/styles.dart';
import 'package:bawabtalsharq/widgets/widgets.dart';
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
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: IconButton(
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
      ),
      body: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(9.0),
                child: buildTextField(
                    hint: (Languages.of(context).search),
                    context: context,
                    rightBtn: Icons.search),
              ),
            ],
          ),
          SizedBox(
            height: 14,
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(35),
                      topRight: Radius.circular(35)),
                  boxShadow: [
                    makeShadow(),
                  ]),
              padding: EdgeInsetsDirectional.only(start: 33, top: 15),
              child: ListView.separated(
                  itemBuilder: (context, index) => buildListMessage(),
                  separatorBuilder: (context, index) => SizedBox(
                        height: 16,
                      ),
                  itemCount: 15),
            ),
          )
        ],
      ),
    );
  }

  Row buildListMessage() {
    return Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
      CircleAvatar(
        radius: 24,
        backgroundImage: AssetImage(eslam),
      ),
      SizedBox(
        width: 15,
      ),
      Expanded(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text("varius sollicitudin nbxhjsvkgh bgvgvhkvg n khb",
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontFamily: 'SegoeUI',
                color: Color(0xff000000),
                fontSize: 14,
                fontWeight: FontWeight.w700,
                fontStyle: FontStyle.normal,
              )),
          SizedBox(
            height: 7,
          ),
          Text("Etiam blandit est leo, etdawd weq df ...",
              style: TextStyle(
                fontFamily: 'SegoeUI',
                color: Color(0xff000000),
                fontSize: 12,
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.normal,
              )),
          Container(
            margin: EdgeInsets.only(right: 40, top: 22),
            height: 0.3,
            color: Colors.grey,
          ),
          SizedBox(
            height: 15,
          ),
        ]),
      )
    ]);
  }

  Widget buildTextField({
    String hint,
    BuildContext context,
    IconData rightBtn,
  }) {
    return Container(
      margin: EdgeInsetsDirectional.only(
        start: 25,
      ),
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
                bottom: 13, // HERE THE IMPORTANT PART
              ),
              errorBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
              hintText: hint,
              suffix: Icon(
                rightBtn,
                color: Colors.grey,
                size: 17,
              ),
              labelStyle: TextStyle(
                fontSize: 12,
              ),
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

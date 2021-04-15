import 'package:bawabtalsharq/Utils/Localization/Language/Languages.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bawabtalsharq/main.dart';
import 'package:bawabtalsharq/widgets/widgets.dart';
import 'package:bawabtalsharq/Model/interest.dart';
import 'package:bawabtalsharq/Utils/Localization/LanguageHelper.dart';

class Interesting extends StatefulWidget {
  @override
  _InterestingState createState() => _InterestingState();
}

class _InterestingState extends State<Interesting> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: const DecorationImage(
              image: AssetImage('assets/images/logo1.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: Container(
              padding: EdgeInsets.only(left: 20, right: 20, top: 20),
              width: MediaQuery.of(context).size.width * 0.89,
              height: MediaQuery.of(context).size.height * 0.85,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(35),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 4,
                    blurRadius: 8,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  backIconRounded(onBackPressed: () {
                    Navigator.of(context).pop();
                  }),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    Languages.of(context).interesting,
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 26),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Flexible(
                    child: GridView.builder(
                        shrinkWrap: true,
                        padding: EdgeInsets.zero,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                        ),
                        itemCount: interestingArray.length,
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                interestingArray[index].isSelected =
                                    !interestingArray[index].isSelected;
                              });
                            },
                            child: Container(
                              height: 60,
                              width: 60,
                              margin: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: interestingArray[index].isSelected
                                    ? interestingArray[index].color
                                    : interestingArray[index]
                                        .color
                                        .withOpacity(0.15),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    interestingArray[index].image,
                                    fit: BoxFit.fill,
                                    width: 44,
                                    height: 44,
                                  ),
                                  Text(
                                    interestingArray[index].text,
                                    style: TextStyle(fontSize: 14),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }),
                  ),
                  Align(
                    alignment: LanguageHelper.isEnglish
                        ? Alignment.bottomRight
                        : Alignment.bottomLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: RaisedButton(
                          color: Colors.white,
                          elevation: 0,
                          padding: EdgeInsets.all(10),
                          child: Text(
                            Languages.of(context).btnText,
                            style: TextStyle(
                                fontSize: 16, color: Colors.deepOrange),
                          ),
                          shape: RoundedRectangleBorder(
                            side:
                                BorderSide(color: Colors.deepOrange, width: 1),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          onPressed: () => Navigator.pushReplacementNamed(
                              context, ScreenRoutes.mainScreen)),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
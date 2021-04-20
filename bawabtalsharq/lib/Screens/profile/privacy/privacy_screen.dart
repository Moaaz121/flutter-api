import 'package:bawabtalsharq/Utils/Localization/Language/Languages.dart';
import 'package:bawabtalsharq/Utils/images.dart';
import 'package:bawabtalsharq/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PrivacyScreen extends StatefulWidget {
  @override
  _PrivacyScreenState createState() => _PrivacyScreenState();
}

class _PrivacyScreenState extends State<PrivacyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarBuilder(
        title: Languages.of(context).privacy,
        onBackPressed: () {
          Navigator.of(context).pop();
        },
      ),
      body: Padding(
        padding: const EdgeInsets.all(22.0),
        child: SingleChildScrollView(
          child: (Column(
            children: [
              buildColumn(Languages.of(context).aboutUs,
                  'Lorem ipsum dolor sit consetetur sadipscing elitr sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet'),
              SizedBox(height: 18),
              buildColumn(Languages.of(context).ourGroup,
                  'Lorem ipsum dolor sit consetetur sadipscing elitr sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet'),
              SizedBox(height: 18),
              buildText(
                Languages.of(context).ourGroupCompanies,
                16,
                fontWeight: FontWeight.w600,
              ),
              SizedBox(height: 10),
              Container(
                height: 79,
                decoration: BoxDecoration(
                  color: Color(0xffffffff),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [makeShadow()],
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Row(
                    children: [
                      Icon(
                        Icons.arrow_back_ios,
                        size: 13,
                      ),
                      Expanded(
                        child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: 10,
                          itemBuilder: (context, position) {
                            return buildListItem('snappy Lauch',
                                'Programming Company', snappyLaunch);
                          },
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 13,
                      ),
                    ],
                  ),
                ),
              )
            ],
          )),
        ),
      ),
    );
  }

  Material buildListItem(
      String textImage, String textLabel, String imageContainer) {
    return Material(
      child: Column(
        children: [
          Container(
              margin: EdgeInsetsDirectional.only(
                start: 15,
                top: 8,
                end: 15,
              ),
              width: 48,
              height: 46,
              decoration: new BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(imageContainer),
                  fit: BoxFit.fill,
                ),
              )),
          Text(textImage,
              style: TextStyle(
                fontFamily: 'SegoeUI',
                color: Colors.black,
                fontSize: 7,
                fontWeight: FontWeight.w600,
              )),
          Text(textLabel,
              style: TextStyle(
                fontFamily: 'SegoeUI',
                color: Colors.black,
                fontSize: 6,
                fontWeight: FontWeight.w400,
              ))
        ],
      ),
    );
  }
}

Column buildColumn(String title, String subTitle) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        title,
        style: TextStyle(
          color: Colors.red,
          fontSize: 16,
          fontWeight: FontWeight.w600,
          fontStyle: FontStyle.normal,
        ),
      ),
      SizedBox(
        height: 5,
      ),
      Text(
        subTitle,
        style: TextStyle(
          color: Colors.black87,
          fontSize: 10,
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal,
        ),
      ),
    ],
  );
}

import 'package:flutter/material.dart';
import 'package:bawabtalsharq/widgets/widgets.dart';
import 'package:bawabtalsharq/Utils/Localization/Language/Languages.dart';
import 'package:bawabtalsharq/Utils/images.dart';
import 'package:bawabtalsharq/main.dart';
import 'package:bawabtalsharq/Utils/Localization/LanguageHelper.dart';

class SubCategoryScreen extends StatefulWidget {
  @override
  _SubCategoriesScreenState createState() => _SubCategoriesScreenState();
}

class _SubCategoriesScreenState extends State<SubCategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarBuilder(
        title: 'Handmade Carpets',
        onBackPressed: () {
          Navigator.of(context).pop();
        },
      ),
      body: GridView.builder(
          padding: EdgeInsets.all(10),
          itemCount: 20,
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1.2,
            mainAxisSpacing: 10.0,
            crossAxisSpacing: 10,
          ),
          itemBuilder: (context, position) {
            return GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, ScreenRoutes.individualProduct);
              },
              child: Container(
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  boxShadow: [makeShadow()],
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                  color: Colors.cyan[100],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: 5,
                    ),
                    Image.asset(
                      dress_icon,
                      width: MediaQuery.of(context).size.width * 0.15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Padding(
                            padding: const EdgeInsets.all(8),
                            child: RichText(
                              maxLines: 2,
                              strutStyle: StrutStyle(fontSize: 14),
                              text: TextSpan(
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                  text: Languages.of(context).categoryName),
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: LanguageHelper.isEnglish
                                    ? Radius.circular(60)
                                    : Radius.circular(0),
                                topRight: LanguageHelper.isEnglish
                                    ? Radius.circular(0)
                                    : Radius.circular(60),
                                bottomRight: LanguageHelper.isEnglish
                                    ? Radius.circular(20)
                                    : Radius.circular(0),
                                bottomLeft: LanguageHelper.isEnglish
                                    ? Radius.circular(0)
                                    : Radius.circular(20),
                              ),
                              color: Colors.cyan),
                          child: Container(
                            margin: EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
                            padding: EdgeInsets.all(14),
                            child: Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.white,
                              size: 14,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}

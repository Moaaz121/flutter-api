import 'package:flutter/material.dart';
import 'package:bawabtalsharq/widgets/widgets.dart';
import 'package:bawabtalsharq/Utils/images.dart';

class SubCategoryScreen extends StatefulWidget {
  @override
  _SubCategoriesScreenState createState() => _SubCategoriesScreenState();
}

class _SubCategoriesScreenState extends State<SubCategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarBuilder(title: 'Handmade Carpets'),
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
            return Container(
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
                    width: MediaQuery.of(context).size.width * 0.14,
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
                                text: 'Kedo'),
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(22),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(60),
                              bottomRight: Radius.circular(20),
                            ),
                            color: Colors.cyan),
                        child: Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.white,
                          size: 16,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          }),
    );
  }
}

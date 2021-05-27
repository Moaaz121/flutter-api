import 'package:bawabtalsharq/Model/mainCategoryModel.dart';
import 'package:bawabtalsharq/Model/search_quary.dart';
import 'package:bawabtalsharq/Screens/search/search_result_screen.dart';
import 'package:bawabtalsharq/Utils/Localization/Language/Languages.dart';
import 'package:bawabtalsharq/Utils/Localization/LanguageHelper.dart';
import 'package:bawabtalsharq/Utils/images.dart';
import 'package:bawabtalsharq/Utils/styles.dart';
import 'package:bawabtalsharq/repo/category_repo.dart';
import 'package:bawabtalsharq/widgets/widgets.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController _searchController = TextEditingController();
  List<CategoryModel> categories = List<CategoryModel>();
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      top: false,
      bottom: false,
      child: Stack(
        children: [
          Scaffold(
            resizeToAvoidBottomInset: false,
            body: Column(
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(1, 60, 0, 0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
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
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: buildTextField(
                            hint: (Languages.of(context).search),
                            context: context),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: height * .01,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsetsDirectional.only(start: 20),
                      child: Divider(
                        thickness: .2,
                        endIndent: 10,
                        color: Colors.grey,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.only(start: 20),
                      child: Text(
                        Languages.of(context).searchByCategories,
                        style: TextStyle(
                          fontFamily: 'Segoe UI',
                          fontSize: 13.0,
                          color: Color(0xff303030),
                          letterSpacing: 0.156,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 55,
                      child: FutureBuilder(
                          future: CategoryRepo.getCategory(),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              categories = snapshot.data;
                              return ListView.builder(
                                padding: EdgeInsets.symmetric(
                                    vertical: 9, horizontal: 20),
                                physics: const BouncingScrollPhysics(
                                    parent: AlwaysScrollableScrollPhysics()),
                                scrollDirection: Axis.horizontal,
                                itemCount: categories.length,
                                itemBuilder: (context, position) {
                                  return Container(
                                    width: 38.0,
                                    height: 37.0,
                                    padding: EdgeInsets.all(5),
                                    margin: EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 10, 0),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.0),
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(0.16),
                                          offset: Offset(0, 1.0),
                                          blurRadius: 6.0,
                                        ),
                                      ],
                                    ),
                                    child: GestureDetector(
                                        onTap: () {
                                          List<String> selectetList =
                                              List<String>();
                                          selectetList.add(
                                              categories[position].categoryId);
                                          SearchQueryModel queryModel =
                                              SearchQueryModel(
                                                  _searchController.text,
                                                  Categories: selectetList);
                                          Navigator.push(
                                              context,
                                              new MaterialPageRoute(
                                                builder:
                                                    (BuildContext context) =>
                                                        new SearchResult(
                                                  searchQuery: queryModel,
                                                ),
                                              ));
                                        },
                                        child: Container(
                                          height: 38,
                                          width: 38,
                                          child: CachedNetworkImage(
                                            imageUrl:
                                                categories[position].image,
                                            placeholder: (context, url) =>
                                                Padding(
                                              padding: EdgeInsets.all(5),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                                child: Image.asset(placeHolder),
                                              ),
                                            ),
                                            errorWidget:
                                                (context, url, error) =>
                                                    Padding(
                                              padding: EdgeInsets.all(5),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                                child: Image.asset(placeHolder),
                                              ),
                                            ),
                                          ),
                                        )),
                                  );
                                },
                              );
                            } else {
                              return Center(
                                child: progressBar(),
                              );
                            }
                          }),
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.only(start: 20),
                      child: Divider(
                        thickness: .2,
                        endIndent: 10,
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.only(start: 20),
                      child: Text(
                        Languages.of(context).resentSearch,
                        style: TextStyle(
                          fontFamily: 'Segoe UI',
                          fontSize: 13.0,
                          color: Color(0xff303030),
                          letterSpacing: 0.156,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(
                        parent: AlwaysScrollableScrollPhysics()),
                    scrollDirection: Axis.vertical,
                    padding: EdgeInsets.symmetric(vertical: 12),
                    itemCount: 33,
                    itemBuilder: (context, position) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 12, horizontal: 20),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                'handmade crafts',
                                style: TextStyle(
                                  fontFamily: 'Segoe UI',
                                  fontSize: 14.0,
                                  color: Color(0xff646464),
                                  letterSpacing: 0.168,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 15,
                              height: 15,
                              child: CircleAvatar(
                                radius: 6,
                                backgroundColor: orangeColor,
                                child: Center(
                                  child: Icon(
                                    Icons.close,
                                    size: 12,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Text buildText(
    String text,
    double fontSize,
    FontWeight fontWeight,
    Color color,
  ) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: 'SegoeUI',
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
        fontStyle: FontStyle.normal,
      ),
    );
  }

  Widget buildTextField({String hint, BuildContext context}) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.75,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(11), color: Colors.grey[100]),
      child: Center(
        child: SizedBox(
          height: 35,
          child: TextField(
            onSubmitted: (value) {
              Navigator.push(
                  context,
                  new MaterialPageRoute(
                    builder: (BuildContext context) => new SearchResult(
                      searchQuery: new SearchQueryModel(_searchController.text,
                          Categories: []),
                    ),
                  ));
            },
            keyboardType: TextInputType.text,
            autocorrect: true,
            maxLines: 1,
            textAlign: TextAlign.start,
            controller: _searchController,
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

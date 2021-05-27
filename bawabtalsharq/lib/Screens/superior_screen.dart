import 'package:bawabtalsharq/Model/superior_model.dart';
import 'package:bawabtalsharq/Utils/Localization/Language/Languages.dart';
import 'package:bawabtalsharq/Utils/images.dart';
import 'package:bawabtalsharq/Utils/styles.dart';
import 'package:bawabtalsharq/bloc/superiorBlocs/superior_bloc.dart';
import 'package:bawabtalsharq/bloc/superiorBlocs/superior_event.dart';
import 'package:bawabtalsharq/bloc/superiorBlocs/superior_state.dart';
import 'package:bawabtalsharq/main.dart';
import 'package:bawabtalsharq/widgets/widgets.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SuperiorScreen extends StatefulWidget {
  @override
  _SuperiorScreenState createState() => _SuperiorScreenState();
}

class _SuperiorScreenState extends State<SuperiorScreen> {
  SuperiorBloc _superiorBloc;
  bool isLoading = false;
  bool isLoaded = false;
  String errorMessage = '';
  List<SuperiorData> listOfSuperior;
  ScrollController _mainScrollController = ScrollController();

  @override
  void initState() {
    _superiorBloc = SuperiorBloc();
    _superiorBloc.add(DoSuperiorEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SuperiorBloc, SuperiorState>(
      bloc: _superiorBloc,
      builder: (context, state) {
        if (state is SuperiorLoadingState) {
          if (!isLoading) {
            isLoading = true;
            return Container(
              color: Colors.white,
              child: Center(
                child: progressBar(),
              ),
            );
          }
        }
        if (state is SuperiorLoadedState) {
          isLoaded = true;
          isLoading = true;
          listOfSuperior = state.superiorResponse;
        }
        if (state is SuperiorErrorState)
          errorMessage = 'No Internet Connection';
        return isLoaded
            ? Container(
                color: Color(0xfff8f8f8),
                child: SafeArea(
                  bottom: false,
                  child: Stack(
                    children: [
                      SingleChildScrollView(
                        physics: BouncingScrollPhysics(
                          parent: NeverScrollableScrollPhysics(),
                        ),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsetsDirectional.only(start: 15),
                                child: Text(
                                  Languages.of(context).superior,
                                  style: TextStyle(
                                    fontFamily: 'Segoe UI',
                                    fontSize: 29.0,
                                    color: orangeColor,
                                    letterSpacing: 0.34800000000000003,
                                    fontWeight: FontWeight.w700,
                                    shadows: [
                                      Shadow(
                                        color: const Color(0xFF7D7D7D)
                                            .withOpacity(0.16),
                                        offset: Offset(0, 3.0),
                                        blurRadius: 6.0,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              rocketList(context)
                            ]),
                      ),
                      Positioned.directional(
                        textDirection: Directionality.of(context),
                        end: 20,
                        bottom: MediaQuery.of(context).size.height * 0.13,
                        child: buildFloatingActionBtn(
                          icon: Icons.arrow_upward,
                          onPressed: () {
                            _mainScrollController.animateTo(0.0,
                                duration: Duration(seconds: 1),
                                curve: Curves.easeOut);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              )
            : Center(child: Text(errorMessage));
      },
    );
  }

  Widget rocketList(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: ListView.builder(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).size.height * 0.23),
        controller: _mainScrollController,
        scrollDirection: Axis.vertical,
        itemCount: listOfSuperior.length,
        itemBuilder: (context, position) {
          return supplierItem(position);
        },
      ),
    );
  }

  Widget supplierItem(int position) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, ScreenRoutes.supplierProfileScreen);
      },
      child: Container(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.width * 0.6,
              child: Stack(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      top: 50,
                      left: 20,
                      right: 20,
                    ),
                    child: Container(
                      decoration: new BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xFFE16036).withOpacity(0.1),
                            offset: Offset(0, 1.0),
                            blurRadius: 16.0,
                          ),
                        ],
                      ),
                    ),
                  ),

                  Positioned.directional(
                    textDirection: Directionality.of(context),
                    top: 60,
                    end: 40,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(
                            context, ScreenRoutes.supplierProfileScreen);
                      },
                      child: Icon(
                        Icons.arrow_forward,
                        size: 20,
                      ),
                    ),
                  ),

                  Positioned.directional(
                    textDirection: Directionality.of(context),
                    top: 20,
                    start: 50,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(
                                context, ScreenRoutes.supplierProfileScreen);
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.3,
                            height: MediaQuery.of(context).size.height * 0.13,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey[100],
                                  offset: Offset(0.0, 1.0), //(x,y)
                                  blurRadius: 6.0,
                                ),
                              ],
                            ),
                            child: CachedNetworkImage(
                              imageUrl: listOfSuperior[position].logo,
                              placeholder: (context, url) => Padding(
                                padding: EdgeInsets.all(5),
                                child: Container(
                                  child: Image.asset(placeHolder),
                                ),
                              ),
                              errorWidget: (context, url, error) => Padding(
                                padding: EdgeInsets.all(5),
                                child: Container(
                                  child: Image.asset(placeHolder),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        SizedBox(
                          width: 65,
                          child: buildText(listOfSuperior[position].name, 14,
                              maxLine: 1, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.access_time_rounded,
                              size: 12,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            buildText(
                              '${Languages.of(context).memberSince + listOfSuperior[position].year}',
                              9,
                              fontWeight: FontWeight.w400,
                            ),
                            SizedBox(
                              height: 15,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.star,
                              size: 16,
                              color: Colors.yellow,
                            ),
                            buildText('${listOfSuperior[position].rate}', 9)
                          ],
                        ),
                      ],
                    ),
                  ),
                  //Last image
                  Positioned.directional(
                    textDirection: Directionality.of(context),
                    top: MediaQuery.of(context).size.width * 0.28,
                    end: MediaQuery.of(context).size.width * 0.1,
                    child: listOfSuperior[position].products.isNotEmpty
                        ? productImage(0.10, 0.16,
                            image:
                                listOfSuperior[position].products[0].imagePath)
                        : productImage(0.10, 0.16, isEmpty: true),
                  ),
                  //center image
                  Positioned.directional(
                    textDirection: Directionality.of(context),
                    top: MediaQuery.of(context).size.width * 0.25,
                    end: MediaQuery.of(context).size.width * 0.15,
                    child: listOfSuperior[position].products.isNotEmpty
                        ? productImage(0.11, 0.24,
                            image:
                                listOfSuperior[position].products[1].imagePath)
                        : productImage(0.11, 0.24, isEmpty: true),
                  ),
                  //top image
                  Positioned.directional(
                    textDirection: Directionality.of(context),
                    top: MediaQuery.of(context).size.width * 0.23,
                    end: MediaQuery.of(context).size.width * 0.22,
                    child: listOfSuperior[position].products.isNotEmpty
                        ? productImage(0.12, 0.3,
                            image:
                                listOfSuperior[position].products[2].imagePath)
                        : productImage(0.12, 0.3, isEmpty: true),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container productImage(double width, double height,
      {String image = '', bool isEmpty = false}) {
    return Container(
      width: MediaQuery.of(context).size.height * width,
      height: MediaQuery.of(context).size.width * height,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(
              color: Color(0x29000000),
              offset: Offset(0, 1),
              blurRadius: 6,
              spreadRadius: 0)
        ],
      ),
      child: CachedNetworkImage(
        fit: BoxFit.fill,
        imageUrl: image,
        placeholder: (context, url) => Padding(
          padding: EdgeInsets.all(5),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
            ),
            child: Image.asset(placeHolder),
          ),
        ),
        errorWidget: (context, url, error) => Padding(
          padding: EdgeInsets.all(5),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
            ),
            child: Image.asset(placeHolder),
          ),
        ),
      ),
    );
  }
}

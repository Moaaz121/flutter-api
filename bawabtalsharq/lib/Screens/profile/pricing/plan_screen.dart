import 'package:bawabtalsharq/Utils/Localization/Language/Languages.dart';
import 'package:bawabtalsharq/Utils/Localization/LanguageHelper.dart';
import 'package:bawabtalsharq/Utils/styles.dart';
import 'package:bawabtalsharq/widgets/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bawabtalsharq/Model/plan_model.dart';
import 'package:bawabtalsharq/bloc/planByIdBloc/plan_by_id_state.dart';
import 'package:bawabtalsharq/bloc/planByIdBloc/plan_by_id_bloc.dart';
import 'package:bawabtalsharq/bloc/planByIdBloc/plan_by_id_event.dart';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PlanScreen extends StatefulWidget {
  final String packageId;

  PlanScreen(this.packageId);

  @override
  _PlanScreenState createState() => _PlanScreenState();
}

class _PlanScreenState extends State<PlanScreen> {
  CarouselController buttonCarouselController = CarouselController();
  int sliderPosition = 0;
  PlanByIdBloc _planByIdBloc;

  List<Plan> planList;

  bool isLoading = false;
  bool isLoaded = false;

  @override
  void initState() {
    _planByIdBloc = PlanByIdBloc();
    _planByIdBloc.add(GetPlanByIdEvent(widget.packageId));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: buildText(Languages.of(context).pricingPlan, 22,
            color: orangeColor, fontWeight: FontWeight.bold),
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
      body: BlocBuilder<PlanByIdBloc, PlanByIdState>(
        bloc: _planByIdBloc,
        builder: (context, state) {
          if (state is PlanByIdLoadingState) {
            if (!isLoading) {
              isLoading = true;
              return Container(
                color: Colors.white,
                child: Center(
                  child: progressBar(),
                ),
              );
            }
          } else if (state is PlanByIdLoadedState) {
            print('loaded');
            planList = state.planResponse.plan;
            isLoading = true;
            isLoaded = true;
          }

          return isLoaded
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CarouselSlider.builder(
                      itemCount: planList.length,
                      carouselController: buttonCarouselController,
                      itemBuilder: (BuildContext context, int index, int idx) {
                        return pricingItem(
                            context: context,
                            text: planList[index].packageName,
                            price: planList[index].packagePrice,
                            index: index,
                            color: Color(int.parse(planList[index].color)));
                      },
                      // items: [
                      //   pricingItem(
                      //       context: context,
                      //       text: planList[0].packageName,
                      //       price: planList[0].packagePrice,
                      //       index: 0,
                      //       color: Colors.blue[300]),
                      // ],
                      options: CarouselOptions(
                        onPageChanged: (index, reason) {
                          setState(() {
                            sliderPosition = index;
                          });
                        },
                        autoPlay: false,
                        height: MediaQuery.of(context).size.height * 0.75,
                        autoPlayCurve: Curves.fastOutSlowIn,
                        scrollDirection: Axis.horizontal,
                        aspectRatio: 16 / 9,
                        viewportFraction: 0.8,
                        pauseAutoPlayInFiniteScroll: true,
                        pauseAutoPlayOnTouch: true,
                        initialPage: 0,
                        disableCenter: true,
                        enableInfiniteScroll: false,
                        reverse: false,
                        enlargeCenterPage: true,
                      ),
                    ),
                    sliderIndicator(sliderPosition,
                        noPadding: true, count: planList.length),
                  ],
                )
              : Center(
                  child: Container(
                  color: Colors.white,
                  child: Text(Languages.of(context).noNetwork),
                ));
        },
      ),
    );
  }

  Widget pricingItem({
    BuildContext context,
    Color color,
    String text,
    String price,
    int index,
  }) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      height: MediaQuery.of(context).size.height * 0.75,
      width: MediaQuery.of(context).size.width * 0.9,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [makeShadow()],
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      child: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.14,
            width: MediaQuery.of(context).size.width * 0.55,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(140),
                bottomLeft: Radius.circular(140),
              ),
              boxShadow: [makeShadow()],
              color: color,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                buildText(text, 22,
                    color: Colors.white, fontWeight: FontWeight.w600),
                buildText(price, 26,
                    color: Colors.white, fontWeight: FontWeight.w600),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemCount: planList[index].details.length,
              padding: EdgeInsets.only(top: 10, left: 20, right: 20),
              itemBuilder: (context, position) {
                return planItem(
                  color: color,
                  text: planList[index].details[position].attributeName,
                  isText: planList[index].details[position].attributeValue ==
                              '0' ||
                          planList[index].details[position].attributeValue ==
                              '1'
                      ? false
                      : true,
                  leftText: planList[index].details[position].attributeValue ==
                              '0' ||
                          planList[index].details[position].attributeValue ==
                              '1'
                      ? ''
                      : planList[index].details[position].attributeValue,
                  isTrue:
                      planList[index].details[position].attributeValue == '1'
                          ? true
                          : false,
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Padding planItem(
      {Color color,
      String text,
      bool isText = false,
      String leftText,
      isTrue = false}) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, right: 30, left: 30, bottom: 10),
      child: Row(
        children: [
          isText
              ? Flexible(child: buildText(leftText, 12, color: color))
              : Icon(
                  isTrue ? Icons.check : Icons.close,
                  size: 16,
                  color: color,
                ),
          SizedBox(
            width: 10,
          ),
          Flexible(child: buildText(text, 14)),
        ],
      ),
    );
  }
}

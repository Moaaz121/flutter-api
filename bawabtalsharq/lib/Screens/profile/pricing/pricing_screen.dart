import 'package:bawabtalsharq/Utils/Localization/Language/Languages.dart';
import 'package:bawabtalsharq/Utils/Localization/LanguageHelper.dart';
import 'package:bawabtalsharq/Utils/styles.dart';
import 'package:bawabtalsharq/widgets/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bawabtalsharq/Model/plan_model.dart';
import 'package:bawabtalsharq/bloc/planBloc/plan_bloc.dart';
import 'package:bawabtalsharq/bloc/planBloc/plan_event.dart';
import 'package:bawabtalsharq/bloc/planBloc/plan_state.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PricingScreen extends StatefulWidget {
  @override
  _PricingScreenState createState() => _PricingScreenState();
}

class _PricingScreenState extends State<PricingScreen> {
  CarouselController buttonCarouselController = CarouselController();
  int sliderPosition = 0;
  PlanBloc _planBloc;

  List<Plan> planList;

  bool isLoading = false;
  bool isLoaded = false;

  @override
  void initState() {
    _planBloc = PlanBloc();
    _planBloc.add(GetPlanEvent());
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
      body: BlocBuilder<PlanBloc, PlanState>(
        bloc: _planBloc,
        builder: (context, state) {
          if (state is PlanLoadingState) {
            if (!isLoading) {
              isLoading = true;
              return Container(
                color: Colors.white,
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }
          } else if (state is PlanLoadedState) {
            print('loaded');
            planList = state.planResponse.plan;
            isLoading = true;
            isLoaded = true;
          }

          return isLoaded
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CarouselSlider(
                      carouselController: buttonCarouselController,
                      items: [
                        pricingItem(
                            context: context,
                            text: planList[0].packageName,
                            price: planList[0].packagePrice,
                            index: 0,
                            color: Colors.blue[300]),
                        pricingItem(
                            context: context,
                            text: planList[1].packageName,
                            price: planList[1].packagePrice,
                            index: 1,
                            color: Colors.brown[400]),
                        pricingItem(
                            context: context,
                            text: planList[2].packageName,
                            price: planList[2].packagePrice,
                            index: 2,
                            color: Colors.black26),
                        pricingItem(
                            context: context,
                            text: planList[3].packageName,
                            price: planList[3].packagePrice,
                            index: 3,
                            color: Colors.orange[400]),
                        pricingItem(
                            context: context,
                            text: planList[4].packageName,
                            price: planList[4].packagePrice,
                            index: 4,
                            color: orangeColor),
                      ],
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
                    sliderIndicator(sliderPosition, noPadding: true, count: 5),
                  ],
                )
              : Center(
                  child: Container(
                  color: Colors.white,
                  child: Text('No Internet Connection'),
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
                buildText('\$' + price, 26,
                    color: Colors.white, fontWeight: FontWeight.w600),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  planItem(
                      color: color,
                      text: 'Post Product',
                      isText: true,
                      leftText: planList[index].postProducts),
                  planItem(
                    color: color,
                    text: 'Main Category',
                    isText: false,
                    isTrue: planList[index].mainCategory == '0' ? false : true,
                  ),
                  planItem(
                    color: color,
                    text: 'Superior Suplayer',
                    isText: false,
                    isTrue:
                        planList[index].superiorSuplayer == '0' ? false : true,
                  ),
                  planItem(
                    color: color,
                    text: 'Admin Account',
                    isText: false,
                    isTrue: planList[index].adminAccount == '0' ? false : true,
                  ),
                  planItem(
                    color: color,
                    text: 'Minisite Creation',
                    isText: false,
                    isTrue:
                        planList[index].minisiteCreation == '0' ? false : true,
                  ),
                  planItem(
                    color: color,
                    text: 'Request For Quotation',
                    isText: false,
                    isTrue: planList[index].requestForQuotation == '0'
                        ? false
                        : true,
                  ),
                  planItem(
                    color: color,
                    text: 'Recommendation Products',
                    isText: false,
                    isTrue: planList[index].recommendationProducts == '0'
                        ? false
                        : true,
                  ),
                  planItem(
                    color: color,
                    text: 'Export Manager',
                    isText: false,
                    isTrue: planList[index].exportManager == '0' ? false : true,
                  ),
                  planItem(
                      color: color,
                      text: 'Product Report',
                      isText: true,
                      leftText: planList[index].productReport),
                  planItem(
                    color: color,
                    text: 'Account Manager',
                    isText: false,
                    isTrue:
                        planList[index].accountManager == '0' ? false : true,
                  ),
                  planItem(
                    color: color,
                    text: 'Website Ads',
                    isText: false,
                    isTrue: planList[index].websiteAds == '0' ? false : true,
                  ),
                  planItem(
                    color: color,
                    text: 'Mobile App Ads',
                    isText: false,
                    isTrue: planList[index].mobileAppAds == '0' ? false : true,
                  ),
                  planItem(
                    color: color,
                    text: 'Live Chat',
                    isText: false,
                    isTrue: planList[index].liveChat == '0' ? false : true,
                  ),
                  planItem(
                    color: color,
                    text: 'Video_Chat',
                    isText: false,
                    isTrue: planList[index].videoChat == '0' ? false : true,
                  ),
                  planItem(
                    color: color,
                    text: 'Audio Chat',
                    isText: false,
                    isTrue: planList[index].audioChat == '0' ? false : true,
                  ),
                  planItem(
                    color: color,
                    text: 'Social Media Campagin',
                    isText: false,
                    isTrue: planList[index].socialMediaCampagin == '0'
                        ? false
                        : true,
                  ),
                  planItem(
                    color: color,
                    text: 'Hosting and Creation Website',
                    isText: false,
                    isTrue: planList[index].hostingAndCreationWebsite == '0'
                        ? false
                        : true,
                  ),
                  planItem(
                    color: color,
                    text: 'Official Email',
                    isText: false,
                    isTrue: planList[index].officialEmail == '0' ? false : true,
                  ),
                  planItem(
                    color: color,
                    text: 'Online support',
                    isText: false,
                    isTrue: planList[index].onlineSupport == '0' ? false : true,
                  ),
                  planItem(
                    color: color,
                    text: 'Onland Verification',
                    isText: false,
                    isTrue: planList[index].onlandVerification == '0'
                        ? false
                        : true,
                  ),
                ],
              ),
            ),
            // child: ListView.builder(
            //   shrinkWrap: true,
            //   scrollDirection: Axis.vertical,
            //   itemCount: 12,
            //   padding: EdgeInsets.only(top: 10, left: 20, right: 20),
            //   itemBuilder: (context, position) {
            //     return Padding(
            //       padding: const EdgeInsets.all(6),
            //       child: Row(
            //         children: [
            //           Icon(
            //             position.isOdd ? Icons.check : Icons.close,
            //             size: 16,
            //             color: color,
            //           ),
            //           SizedBox(
            //             width: 20,
            //           ),
            //           buildText(
            //               position.isOdd ? 'Video Chat' : 'Online Support', 14),
            //         ],
            //       ),
            //     );
            //   },
            // ),
          ),
          RaisedButton(
            child: Text(Languages.of(context).selectPlan),
            onPressed: null,
            padding: EdgeInsets.only(left: 36, right: 36),
            disabledTextColor: Colors.white,
            disabledColor: color,
            shape: RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(30.0),
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
              ? buildText(leftText, 12, color: color)
              : Icon(
                  isTrue ? Icons.check : Icons.close,
                  size: 16,
                  color: color,
                ),
          SizedBox(
            width: 10,
          ),
          buildText(text, 14),
        ],
      ),
    );
  }
}

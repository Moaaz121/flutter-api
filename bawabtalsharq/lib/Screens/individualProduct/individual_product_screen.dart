import 'package:bawabtalsharq/Model/individualProduct_model.dart';
import 'package:bawabtalsharq/Model/user_model.dart';
import 'package:bawabtalsharq/Screens/individualProduct/removeTitle.dart';
import 'package:bawabtalsharq/Utils/Localization/Language/Languages.dart';
import 'package:bawabtalsharq/Utils/Localization/LanguageHelper.dart';
import 'package:bawabtalsharq/Utils/constants.dart';
import 'package:bawabtalsharq/Utils/images.dart';
import 'package:bawabtalsharq/Utils/loader.dart';
import 'package:bawabtalsharq/Utils/styles.dart';
import 'package:bawabtalsharq/bloc/individualProductBloc/individualProduct_bloc.dart';
import 'package:bawabtalsharq/bloc/individualProductBloc/individualProduct_event.dart';
import 'package:bawabtalsharq/bloc/individualProductBloc/individualProduct_state.dart';
import 'package:bawabtalsharq/widgets/widgets.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../main.dart';
import 'IndividualSliverPersistentHeader.dart';

class IndividualProduct extends StatefulWidget {
  String title;
  final String productId;

  IndividualProduct(this.productId, {this.title});

  @override
  _IndividualProductState createState() => _IndividualProductState();
}

class _IndividualProductState extends State<IndividualProduct>
    with TickerProviderStateMixin {
  int _initialCounter = 0;

  List<ColorOption> colorOptions = List<ColorOption>();

  ScrollController _controller;
  IndividualProductBloc _productBloc;
  bool isLoading = false;
  bool isLoaded = false;
  IndividualProductModel product;
  TabController _controllerTab;
  final scrollController = ScrollController();
  CarouselController buttonCarouselController = CarouselController();
  int sliderPosition = 0;
  bool sliverPersistentHeader = false;

  UserModel currentUser = Constants.getUserInfo2();

  @override
  void initState() {
    super.initState();

    _productBloc = IndividualProductBloc();
    _productBloc.add(DoIndividualProductEvent(widget.productId));
    _controllerTab = TabController(vsync: this, length: 2);
    _controller = ScrollController();
    _controllerTab.addListener(() => {
          setState(() {
            // _controller.jumpTo(0);
          })
        });
  }

  int selectedIndex = 0;
  String imageProfile = "";

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<IndividualProductBloc, IndividualProductState>(
        bloc: _productBloc,
        builder: (context, state) {
          if (state is IndividualProductLoadingState) {
            return Container(
              color: Colors.white,
              child: Center(
                child: LoadingLogo(),
              ),
            );
          }
          if (state is IndividualProductLoadedState) {
            if (state.individualProductResponse.code == 200) {
              isLoaded = true;
              product = state.individualProductResponse;

              for (var i = 0; i < product.data.color.length; i++) {
                colorOptions.add(ColorOption(
                    product.data.color[i], int.parse(product.data.minQty)));
              }

              if (currentUser != null) {
                _productBloc.add(DoHistoryEvent(currentUser.data.userId,
                    currentUser.data.apiKey, widget.productId));
              }
            } else {
              return Scaffold(
                body: Center(
                  child: Container(
                    child: Text(state.individualProductResponse.msg),
                  ),
                ),
              );
            }
          }
          if (state is HistoryLoadedState) {
            print('History Respone' + state.historyResponse.msg);
          }
          if (state is IndividualProductNetworkErrorState) {
            return Scaffold(
              body: Center(
                child: Container(
                  child: Text(Languages.of(context).noNetwork),
                ),
              ),
            );
          }
          return DefaultTabController(
            length: 2,
            child: Scaffold(
              floatingActionButton: productFab(product.data.price),
              body: NestedScrollView(
                headerSliverBuilder:
                    (BuildContext context, bool innerBoxScrolled) {
                  return <Widget>[
                    SliverAppBar(
                      leading: GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(
                          LanguageHelper.isEnglish
                              ? Icons.keyboard_arrow_left_outlined
                              : Icons.keyboard_arrow_right_outlined,
                          size: 28,
                          color: orangeColor,
                        ),
                      ),
                      actions: [
                        GestureDetector(
                          onTap: () {},
                          child: Padding(
                            padding: const EdgeInsetsDirectional.only(end: 20),
                            child: Icon(
                              Icons.bookmark_border_outlined,
                              color: orangeColor,
                              size: 22,
                            ),
                          ),
                        )
                      ],
                      expandedHeight: MediaQuery.of(context).size.height * 0.4,
                      floating: true,
                      pinned: true,
                      snap: false,
                      elevation: 0,
                      centerTitle: true,
                      title: RemoveTitleAppBar(
                        child: Text(
                          product.data.product,
                          style: TextStyle(
                            fontSize: 19,
                            color: orangeColor,
                          ),
                        ),
                      ),
                      backgroundColor: Colors.grey.shade100,
                      flexibleSpace: FlexibleSpaceBar(
                          background: Container(
                              padding: EdgeInsetsDirectional.only(
                                  top: 55, bottom: 10),
                              child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    CarouselSlider.builder(
                                      carouselController:
                                          buttonCarouselController,
                                      options: CarouselOptions(
                                        onPageChanged: (index, reason) {
                                          setState(() {
                                            sliderPosition = index;
                                          });
                                        },
                                        autoPlay: false,
                                        viewportFraction: 0.9,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.27,
                                        initialPage: 0,
                                        autoPlayCurve: Curves.fastOutSlowIn,
                                        scrollDirection: Axis.horizontal,
                                      ),
                                      itemCount: 4,
                                      itemBuilder:
                                          (context, index, realIndex) =>
                                              CachedNetworkImage(
                                        imageUrl: product.data.imagePath,
                                        placeholder: (context, url) => Padding(
                                          padding: EdgeInsets.all(5),
                                          child: Container(
                                            child: Image.asset(placeHolder),
                                          ),
                                        ),
                                        errorWidget: (context, url, error) =>
                                            Container(
                                          child: Image.asset(placeHolder),
                                        ),
                                      ),
                                    ),
                                    sliderIndicator(sliderPosition,
                                        noPadding: true),
                                    // Flexible(
                                    //   child:,
                                    // )
                                  ]))),
                    ),
                    SliverToBoxAdapter(
                      child: Container(
                        color: Colors.grey.shade100,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.only(top: 20),
                              // height: 140,
                              child: Center(
                                child: Column(
                                  children: [
                                    Container(
                                      width: 50,
                                      height: 3,
                                      color: Colors.grey[300],
                                    ),
                                    SizedBox(
                                      height: 30,
                                    ),
                                    Container(
                                        padding: EdgeInsetsDirectional.only(
                                            top: 5, bottom: 5),
                                        margin: EdgeInsetsDirectional.only(
                                            start: 30, end: 50),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                        ),
                                        child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Flexible(
                                                child: RichText(
                                                  maxLines: 2,
                                                  overflow: TextOverflow.clip,
                                                  strutStyle:
                                                      StrutStyle(fontSize: 14),
                                                  text: TextSpan(
                                                      style: TextStyle(
                                                          fontSize: 17,
                                                          color: Colors.black87,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                      text:
                                                          product.data.product),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              RatingBar(
                                                itemSize: 20,
                                                initialRating: double.parse(
                                                    product.data.rating),
                                                minRating: 1,
                                                unratedColor: Colors.grey,
                                                direction: Axis.horizontal,
                                                allowHalfRating: true,
                                                ignoreGestures: true,
                                                itemCount: 5,
                                                ratingWidget: RatingWidget(
                                                  full: Icon(
                                                    Icons.star,
                                                    color: Colors.amber,
                                                  ),
                                                  empty: Icon(
                                                    Icons.star,
                                                    color: Colors.grey,
                                                  ),
                                                  half: Icon(
                                                    Icons.star_half,
                                                    color: Colors.amber,
                                                  ),
                                                ),
                                              ),
                                            ])),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    product.data.color.isEmpty
                                        ? SizedBox()
                                        : Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 30),
                                            child:
                                                Center(child: productColor()),
                                          ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 20, left: 10),
                                      child: infoCartSupplier(
                                          '${product.data.company}',
                                          '${product.data.year}' +
                                              ' ${Languages.of(context).year}',
                                          '${product.data.countryName}',
                                          '${product.data.category}',
                                          '${product.data.countryImage}', () {
                                        Navigator.pushNamed(context,
                                            ScreenRoutes.supplierProfileScreen,
                                            arguments: product.data.companyId);
                                      }),
                                    ),
                                  ],
                                ),
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                  topLeft: const Radius.circular(40.0),
                                  topRight: const Radius.circular(40.0),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SliverPersistentHeader(
                      pinned: true,
                      floating: false,
                      delegate: SliverPersistentHeaderDelegateImpl(
                        color: Colors.white,
                        tabBar: tabBar(),
                      ),
                    ),
                  ];
                },
                body: TabBarView(controller: _controllerTab, children: [
                  Container(
                    color: Colors.white,
                    child: SingleChildScrollView(
                        child: Column(
                      children: [
                        Container(
                            margin: EdgeInsets.all(20),
                            color: Colors.white,
                            padding: EdgeInsetsDirectional.only(
                                bottom:
                                    MediaQuery.of(context).size.height * 0.1),
                            child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  overViewText(
                                      Html(data: product.data.fullDescription),
                                      context),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  product.data.faq.isEmpty
                                      ? SizedBox()
                                      : productFaq(
                                          title: Languages.of(context).faq,
                                        ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  product.data.detailedPictures.isEmpty
                                      ? SizedBox()
                                      : detailsPictures(),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  product.data.packingShipping.isEmpty
                                      ? SizedBox()
                                      : listOfBackingChipping(),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  product.data.certificates.isEmpty
                                      ? SizedBox()
                                      : certificateListView(),
                                ])),
                      ],
                    )),
                  ),
                  Container(
                    color: Colors.white,
                    child: SingleChildScrollView(
                      padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).size.height * 0.15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          companyDetails(Languages.of(context).companyName,
                              product.data.companyDetails.company),
                          companyDetails(Languages.of(context).email,
                              product.data.companyDetails.email),
                          companyDetails(Languages.of(context).phoneNum,
                              product.data.companyDetails.phone),
                          companyDetails(Languages.of(context).country,
                              product.data.companyDetails.country),
                          companyDetails(Languages.of(context).city,
                              product.data.companyDetails.city),
                          companyDetails(Languages.of(context).addressName,
                              product.data.companyDetails.address),
                          companyDetails(Languages.of(context).zipCode,
                              product.data.companyDetails.zipcode),
                          companyDetails(Languages.of(context).state,
                              product.data.companyDetails.state),
                          companyDetails(Languages.of(context).companySiteUrl,
                              product.data.companyDetails.companySite),
                          companyDetails(Languages.of(context).mainProduct,
                              product.data.companyDetails.mainProduct),
                          companyDetails(Languages.of(context).businessType,
                              product.data.companyDetails.businessType),
                          companyDetails(Languages.of(context).yearEstablished,
                              product.data.companyDetails.year),
                          companyDetails(
                              Languages.of(context).acceptedPaymentCurrency,
                              product.data.companyDetails.paymentCurrency),
                          companyDetails(
                              Languages.of(context).acceptedPaymentType,
                              product.data.companyDetails.paymentType),
                          companyDetails(Languages.of(context).averageLeadTime,
                              product.data.companyDetails.leadTime),
                          companyDetails(Languages.of(context).sampleOrder,
                              product.data.companyDetails.sampleOrder),
                          Padding(
                            padding: const EdgeInsetsDirectional.only(
                                start: 15.0, top: 10, bottom: 10),
                            child: buildText(
                              Languages.of(context).totalEmployees,
                              15,
                              fontWeight: FontWeight.w700,
                              fontStyle: FontStyle.normal,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(product
                                      .data.companyDetails.totalEmployees
                                      .split('-')[0]),
                                  Container(
                                    height: 20,
                                    width: 20,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                            width: 4, color: orangeColor)),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 15),
                                child: Container(
                                  width: 150,
                                  height: 2.5,
                                  color: orangeColor,
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(product
                                      .data.companyDetails.totalEmployees
                                      .split('-')[1]),
                                  Container(
                                    height: 20,
                                    width: 20,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                            width: 4, color: orangeColor)),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.only(
                                start: 15.0, top: 20, bottom: 10),
                            child: buildText(
                              Languages.of(context).companyProfile,
                              15,
                              fontWeight: FontWeight.w700,
                              fontStyle: FontStyle.normal,
                            ),
                          ),
                          Center(
                              child: Container(
                            height: 250,
                            margin: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              boxShadow: [makeShadow()],
                              borderRadius: BorderRadius.circular(20),
                              shape: BoxShape.rectangle,
                              image: DecorationImage(
                                image: imageProfile == ""
                                    ? AssetImage(placeHolder)
                                    : NetworkImage(imageProfile),
                                fit: BoxFit.fill,
                              ),
                            ),
                          )),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            height: 70,
                            child: ListView.builder(
                              physics: PageScrollPhysics(),
                              // this is what you are looking for
                              scrollDirection: Axis.horizontal,
                              itemCount: product.data.companyProfile.length,
                              itemBuilder: (context, index) {
                                return Container(
                                    margin: EdgeInsets.symmetric(horizontal: 5),
                                    width: 100,
                                    child: Card(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(3)),
                                      child: ListTile(
                                        contentPadding: EdgeInsets.only(
                                            bottom: 7, left: 5, right: 5),
                                        title: Image(
                                          image: NetworkImage(product
                                              .data.companyProfile[index]),
                                          fit: BoxFit.fill,
                                        ),
                                        tileColor: selectedIndex == index
                                            ? Colors.deepOrange[200]
                                            : null,
                                        // selected: true,
                                        onTap: () {
                                          setState(() {
                                            selectedIndex = index;
                                            imageProfile = product
                                                .data.companyProfile[index];
                                          });
                                        },
                                      ),
                                    ));
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ]),
              ),
            ),
          );
        });
  }

  Widget companyDetails(String textHeader, String subText) {
    return subText == '' ||
            (textHeader == Languages.of(context).email &&
                currentUser == null) ||
            (textHeader == Languages.of(context).phoneNum &&
                currentUser == null) ||
            (textHeader == Languages.of(context).addressName &&
                currentUser == null) ||
            (textHeader == Languages.of(context).zipCode && currentUser == null)
        ? SizedBox()
        : Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  textHeader,
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.normal,
                      fontSize: 15),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(subText)
              ],
            ));
  }

  Widget tabBar() {
    return TabBar(
      isScrollable: true,
      controller: _controllerTab,
      tabs: [
        Tab(text: Languages.of(context).productDetails),
        Tab(text: Languages.of(context).companyDetails),
      ],
      indicatorColor: orangeColor,
      indicatorSize: TabBarIndicatorSize.label,
      labelColor: orangeColor,
    );
  }

  Widget productFab(String price) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(start: 45),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: 50,
            width: MediaQuery.of(context).size.width * 0.25,
            decoration: BoxDecoration(
                boxShadow: [makeShadow(color: (0x29e16036), offset: 5)],
                borderRadius: BorderRadius.circular(16),
                color: Colors.white),
            child: Center(
              child: Text(
                price,
                style: TextStyle(
                    color: orangeColor,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Container(
            padding: EdgeInsets.all(10),
            height: 50,
            width: MediaQuery.of(context).size.width * 0.57,
            decoration: BoxDecoration(
                boxShadow: [makeShadow(color: (0x29e16036), offset: 5)],
                borderRadius: BorderRadius.circular(16),
                color: orangeColor),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.person_pin_rounded,
                  size: 25,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  Languages.of(context).buyNow,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget productColor() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          Languages.of(context).productOption,
          style: TextStyle(
              color: orangeColor, fontWeight: FontWeight.bold, fontSize: 18),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          Languages.of(context).color,
          style: TextStyle(
              color: Colors.black54, fontWeight: FontWeight.bold, fontSize: 16),
        ),
        ListView.builder(
            physics: BouncingScrollPhysics(
              parent: NeverScrollableScrollPhysics(),
            ),
            padding: EdgeInsetsDirectional.only(top: 5, bottom: 5),
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemCount: product.data.color.length,
            itemBuilder: (context, position) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.circle,
                              color: Color(
                                  int.parse(product.data.color[position])),
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            buildText('${product.data.price}', 14,
                                color: Colors.black45,
                                fontWeight: FontWeight.bold),
                            SizedBox(
                              width: 20,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsetsDirectional.only(end: 5),
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        border: Border.all(width: 1, color: Colors.grey)),
                    child: GestureDetector(
                      child: Icon(
                        Icons.remove,
                        size: 14,
                        color: orangeColor,
                      ),
                      onTap: () {
                        setState(() {
                          if (colorOptions[position].counter >
                              int.parse(product.data.minQty))
                            colorOptions[position].counter--;
                        });
                      },
                    ),
                  ),
                  Container(
                    padding: EdgeInsetsDirectional.only(
                        start: 35, end: 35, top: 4, bottom: 4),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        border: Border.all(width: 1, color: Colors.grey)),
                    child: Text(
                      '${colorOptions[position].counter}',
                      style: TextStyle(color: orangeColor),
                    ),
                  ),
                  Container(
                    margin: EdgeInsetsDirectional.only(start: 5),
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        border: Border.all(width: 1, color: Colors.grey)),
                    child: GestureDetector(
                      child: Icon(
                        Icons.add,
                        size: 14,
                        color: orangeColor,
                      ),
                      onTap: () {
                        setState(() {
                          if (colorOptions[position].counter <
                              int.parse(product.data.maxQty))
                            colorOptions[position].counter++;
                        });
                      },
                    ),
                  ),
                ],
              );
            })
      ],
    );
  }

  Widget productFaq({String title}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
        ),
        ListView.builder(
          physics: BouncingScrollPhysics(
            parent: NeverScrollableScrollPhysics(),
          ),
          padding: EdgeInsets.only(top: 5, bottom: 5),
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemCount: product.data.faq.length,
          itemBuilder: (context, position) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.data.faq[position].question,
                    style: TextStyle(color: Colors.black, fontSize: 12),
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Text(
                    product.data.faq[position].answer,
                    style: TextStyle(color: Colors.black54, fontSize: 12),
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }

  Widget overViewText(Html html, BuildContext context) {
    return Container(
      margin: EdgeInsetsDirectional.only(top: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildText(Languages.of(context).overView, 14,
              fontWeight: FontWeight.w600),
          SizedBox(
            height: 5,
          ),
          html
        ],
      ),
    );
  }

  Widget listOfBackingChipping() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildText(Languages.of(context).packagingShipping, 14,
            fontWeight: FontWeight.w600),
        SizedBox(
          height: 10,
        ),
        ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          reverse: false,
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: product.data.packingShipping.length,
          itemBuilder: (context, position) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * .15,
                      decoration: new BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.white,
                      ),
                      child: CachedNetworkImage(
                        imageUrl: product.data.packingShipping[position].image,
                        placeholder: (context, url) => Padding(
                          padding: EdgeInsets.all(5),
                          child: Container(
                            decoration: new BoxDecoration(
                                borderRadius: BorderRadius.circular(16)),
                            child: Image.asset(placeHolder),
                          ),
                        ),
                        errorWidget: (context, url, error) => Padding(
                          padding: EdgeInsets.all(5),
                          child: Container(
                            decoration: new BoxDecoration(
                                borderRadius: BorderRadius.circular(16)),
                            child: Image.asset(placeHolder),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 11,
                    ),
                    buildText(
                        product.data.packingShipping[position].description, 12,
                        textAlign: TextAlign.center, color: Colors.black87),
                  ]),
            );
          },
        ),
      ],
    );
  }

  Widget certificateListView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildText(Languages.of(context).certificates, 14,
            fontWeight: FontWeight.w600),
        SizedBox(
          height: 11,
        ),
        Container(
          height: 80,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: product.data.certificates.length,
            itemBuilder: (context, position) {
              return Container(
                margin: EdgeInsetsDirectional.fromSTEB(0, 0, 20, 0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.white,
                ),
                child: CachedNetworkImage(
                  imageUrl: product.data.certificates[position],
                  placeholder: (context, url) => Padding(
                    padding: EdgeInsets.all(5),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Image.asset(placeHolder),
                    ),
                  ),
                  errorWidget: (context, url, error) => Padding(
                    padding: EdgeInsets.all(5),
                    child: Container(
                      child: Image.asset(placeHolder),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget detailsPictures() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildText(Languages.of(context).detailedPictures, 14,
            fontWeight: FontWeight.w600),
        SizedBox(
          height: 11,
        ),
        GridView.count(
          physics: BouncingScrollPhysics(
            parent: NeverScrollableScrollPhysics(),
          ),
          shrinkWrap: true,
          crossAxisCount: 4,
          crossAxisSpacing: 15,
          mainAxisSpacing: 15,
          children:
              List.generate(product.data.detailedPictures.length, (index) {
            return GridTile(
              child: Card(
                  color: Colors.white,
                  child: Center(
                    child: CachedNetworkImage(
                      imageUrl: product.data.detailedPictures[index],
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
                  )),
            );
          }),
        ),
      ],
    );
  }
}

class ColorOption {
  String color;
  int counter;

  ColorOption(this.color, this.counter);
}

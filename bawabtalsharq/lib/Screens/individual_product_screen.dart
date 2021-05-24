import 'package:bawabtalsharq/Model/individualProduct_model.dart';
import 'package:bawabtalsharq/Utils/Localization/Language/Languages.dart';
import 'package:bawabtalsharq/Utils/Localization/LanguageHelper.dart';
import 'package:bawabtalsharq/Utils/images.dart';
import 'package:bawabtalsharq/Utils/styles.dart';
import 'package:bawabtalsharq/bloc/individualProductBloc/individualProduct_bloc.dart';
import 'package:bawabtalsharq/bloc/individualProductBloc/individualProduct_event.dart';
import 'package:bawabtalsharq/bloc/individualProductBloc/individualProduct_state.dart';
import 'package:bawabtalsharq/widgets/widgets.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'SliverPersistentHeaderInvidiualProduct/IndividualProductHedaer.dart';

class IndividualProduct extends StatefulWidget {
  final String productId;
  IndividualProduct(this.productId);
  @override
  _IndividualProductState createState() => _IndividualProductState();
}

class _IndividualProductState extends State<IndividualProduct>
    with TickerProviderStateMixin {
  ScrollController _controller;
  IndividualProductBloc _productBloc;
  bool isLoading = false;
  bool isLoaded = false;
  ProductDetails product;
  TabController _controllerTab;
  final scrollController = ScrollController();
  final List<String> _tabs = <String>[
    "Product Details",
    "company Details",
  ];

  CarouselController buttonCarouselController = CarouselController();
  int sliderPosition = 0;
  bool sliverPersistentHeader = false;

  @override
  void initState() {
    _productBloc = IndividualProductBloc();
    _productBloc.add(DoIndividualProductEvent(widget.productId));
    _controllerTab = TabController(vsync: this, length: _tabs.length);
    // _controllerTab.addListener(_handleTabSelection);
    _controller = ScrollController();
    _controllerTab.addListener(() => {setState(() {})});
    super.initState();
  }

  // void _handleTabSelection() {
  //   if (_controller.indexIsChanging) {
  //     switch (_controller.index) {
  //       case 0:
  //         Scaffold.of(context).showSnackBar(SnackBar(
  //           content: Text('Page 1 tapped.'),
  //           duration: Duration(milliseconds: 500),
  //         ));
  //         break;
  //       case 1:
  //         Scaffold.of(context).showSnackBar(SnackBar(
  //           content: Text('Page 2 tapped.'),
  //           duration: Duration(milliseconds: 500),
  //         ));
  //         break;
  //     }
  //   }
  // }

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<IndividualProductBloc, IndividualProductState>(
        bloc: _productBloc,
        builder: (context, state) {
          if (state is IndividualProductLoadingState) {
            return Container(
              color: Colors.white,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
          if (state is IndividualProductLoadedState) {
            isLoaded = true;
            product = state.individualProductResponse;
          }
          return DefaultTabController(
            length: _tabs.length,
            child: Scaffold(
              // appBar: AppBar(
              //   title: Text(_tabs[_controllerTab.index]),
              //   bottom: TabBar(
              //     isScrollable: true,
              //     controller: _controllerTab,
              //     tabs: _tabs.map((String name) => Tab(text: name)).toList(),
              //     indicatorColor: orangeColor,
              //     indicatorSize: TabBarIndicatorSize.label,
              //     labelColor: orangeColor,
              //   ),
              // ),
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
                        ),
                      ),
                      actions: [
                        // tabBar(),
                        iconRound(Icons.bookmark_border_outlined),
                      ],
                      expandedHeight: MediaQuery.of(context).size.height * 0.4,
                      floating: true,
                      // pinned: true,
                      snap: false,
                      elevation: 50,
                      backgroundColor: Color(0xfff9dfd6),
                      flexibleSpace: FlexibleSpaceBar(
                          // title: tabBar(),
                          // centerTitle: true,
                          background: Container(
                              padding: EdgeInsets.only(top: 20),
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
                                        aspectRatio: 2,
                                        initialPage: 0,
                                        autoPlayCurve: Curves.fastOutSlowIn,
                                        scrollDirection: Axis.horizontal,
                                      ),
                                      itemCount: 4,
                                      itemBuilder:
                                          (context, index, realIndex) => Image(
                                        image: AssetImage(shoes_image),
                                      ),
                                    ),
                                    sliderIndicator(sliderPosition,
                                        noPadding: true),
                                    Flexible(
                                      child: Container(
                                          // height: MediaQuery.of(context)
                                          //         .size
                                          //         .height *
                                          //     0.15,
                                          decoration: BoxDecoration(
                                            color: Color(0xfff9dfd6),
                                            borderRadius: BorderRadius.only(
                                                // topLeft: Radius.circular(40),
                                                // topRight: Radius.circular(40),
                                                ),
                                          ),
                                          child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 40,
                                                  right: 40,
                                                  top: 20,
                                                  bottom: 20),
                                              child: Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceAround,
                                                  children: [
                                                    Flexible(
                                                      child: RichText(
                                                        maxLines: 2,
                                                        overflow:
                                                            TextOverflow.clip,
                                                        strutStyle: StrutStyle(
                                                            fontSize: 14),
                                                        text: TextSpan(
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .black,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                            text: product
                                                                .product),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 10,
                                                    ),
                                                    Row(
                                                      children: [
                                                        RatingBar.builder(
                                                          itemSize: 18,
                                                          initialRating: 3,
                                                          minRating: 1,
                                                          direction:
                                                              Axis.horizontal,
                                                          allowHalfRating: true,
                                                          itemCount: 1,
                                                          itemPadding: EdgeInsets
                                                              .symmetric(
                                                                  horizontal:
                                                                      1),
                                                          itemBuilder:
                                                              (context, _) =>
                                                                  Icon(
                                                            Icons.star,
                                                            color: Colors.amber,
                                                          ),
                                                          onRatingUpdate:
                                                              (rating) {
                                                            print(rating);
                                                          },
                                                        ),
                                                        Text(product.rating)
                                                      ],
                                                    ),
                                                  ]))),
                                    )
                                  ]))),
                      // bottom: tabBar(),
                    ),

                    // bottom: false,
                    SliverPersistentHeader(
                      pinned: true,
                      floating: true,
                      delegate: SliverPersistentHeaderDelegateImpl(
                        color: Colors.white,
                        tabBar: tabBar(),
                      ),
                    ),
                  ];
                },
                body: TabBarView(controller: _controllerTab, children: [
                  SingleChildScrollView(
                      padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).size.height * 0.1),
                      child: Column(
                        children: [
                          Container(
                              margin: EdgeInsets.all(20),
                              color: Colors.white,
                              padding: EdgeInsets.only(
                                  bottom:
                                      MediaQuery.of(context).size.height * 0.1),
                              child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    product.color.isEmpty
                                        ? SizedBox()
                                        : Center(
                                            child: productOption(
                                              widgetTitle: 'Product Options',
                                              widgetSubTitle: 'Color',
                                              widget: productColorOption(
                                                price: '50',
                                                counterWidget:
                                                    productCounter(number: 10),
                                              ),
                                            ),
                                          ),
                                    overViewText(
                                        Html(data: product.fullDescription),
                                        context),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    product.faq.isEmpty
                                        ? SizedBox()
                                        : productFaq(
                                            title: 'FAQ:',
                                            question: 'Question',
                                            answer: 'Answer'),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    product.detailedPictures.isEmpty
                                        ? SizedBox()
                                        : detailsPictures(),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    product.packingShipping.isEmpty
                                        ? SizedBox()
                                        : listOfBackingChipping(),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    product.certificates.isEmpty
                                        ? SizedBox()
                                        : certificateListView(),
                                  ])),
                        ],
                      )),
                  SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 30, left: 10),
                      child: infoCartSupplier(
                          '${product.company}',
                          '${product.year}' + ' ${Languages.of(context).year}',
                          '${product.countryName}',
                          '${product.category}'),
                    ),
                  ),
                ]),
              ),
            ),
          );
        });
  }

  Widget tabBar() {
    return TabBar(
      isScrollable: true,
      controller: _controllerTab,
      tabs: _tabs.map((String name) => Tab(text: name)).toList(),
      indicatorColor: orangeColor,
      indicatorSize: TabBarIndicatorSize.label,
      labelColor: orangeColor,
    );
  }
}

Padding productFab(String price) {
  return Padding(
    padding: const EdgeInsets.only(left: 25),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.all(10),
          height: 50,
          decoration: BoxDecoration(
              boxShadow: [makeShadow(color: (0x29e16036), offset: 3)],
              borderRadius: BorderRadius.circular(16),
              color: Colors.white),
          child: Center(
            child: Text(
              price,
              style: TextStyle(color: orangeColor, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Container(
          padding: EdgeInsets.all(10),
          height: 50,
          decoration: BoxDecoration(
              boxShadow: [makeShadow(color: (0x29e16036), offset: 3)],
              borderRadius: BorderRadius.circular(16),
              color: orangeColor),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.only(left: 10, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        Icons.person_pin_rounded,
                        size: 18,
                        color: Colors.white,
                      ),
                      Text(
                        'Chat Supplier',
                        style: TextStyle(color: Colors.white, fontSize: 9),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        Icons.person_pin_rounded,
                        size: 18,
                        color: Colors.white,
                      ),
                      Text(
                        'Buy Now',
                        style: TextStyle(color: Colors.white, fontSize: 9),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

Widget productOption(
    {String widgetTitle, String widgetSubTitle, Widget widget}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        widgetTitle,
        style: TextStyle(
            color: orangeColor, fontWeight: FontWeight.bold, fontSize: 18),
      ),
      SizedBox(
        height: 10,
      ),
      Text(
        widgetSubTitle,
        style: TextStyle(
            color: Colors.black54, fontWeight: FontWeight.bold, fontSize: 14),
      ),
      widget,
      widget,
      widget,
    ],
  );
}

Widget productColorOption({String price, Widget counterWidget}) {
  return Padding(
    padding: const EdgeInsets.only(top: 8),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(
              Icons.circle,
              color: Colors.blue,
            ),
            SizedBox(
              width: 8,
            ),
            Text('$price \$'),
            SizedBox(
              width: 20,
            ),
            counterWidget,
          ],
        ),
      ],
    ),
  );
}

Widget productCounter({int number}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Container(
        margin: EdgeInsetsDirectional.only(end: 5),
        padding: EdgeInsets.all(6),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            border: Border.all(width: 1, color: Colors.grey)),
        child: Icon(
          Icons.remove,
          size: 14,
          color: orangeColor,
        ),
      ),
      Container(
        padding: EdgeInsets.only(left: 35, right: 35, top: 4, bottom: 4),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            border: Border.all(width: 1, color: Colors.grey)),
        child: Text(
          number.toString(),
          style: TextStyle(color: orangeColor),
        ),
      ),
      Container(
        margin: EdgeInsetsDirectional.only(start: 5),
        padding: EdgeInsets.all(6),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            border: Border.all(width: 1, color: Colors.grey)),
        child: Icon(
          Icons.add,
          size: 14,
          color: orangeColor,
        ),
      ),
    ],
  );
}

Widget productFaq({String title, String question, String answer}) {
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
        itemCount: 5,
        itemBuilder: (context, position) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  question,
                  style: TextStyle(color: Colors.black, fontSize: 12),
                ),
                SizedBox(
                  height: 2,
                ),
                Text(
                  answer,
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
    margin: EdgeInsets.only(top: 15),
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
      buildText('Packiging & Shipping', 14, fontWeight: FontWeight.w600),
      SizedBox(
        height: 10,
      ),
      ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        reverse: false,
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: 5,
        itemBuilder: (context, position) {
          return backingChipping(
              'Kedo Running Shoes From Addiddas Kedo Running Shoes From Addiddas Kedo Running Shoes From Addiddas Running Shoes From Addiddas',
              slider2,
              context);
        },
      ),
    ],
  );
}

Widget backingChipping(String text, String image, BuildContext context) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 20),
    child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
      Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * .15,
        decoration: new BoxDecoration(
          image: DecorationImage(
            image: AssetImage(image),
            fit: BoxFit.fill,
          ),
          borderRadius: BorderRadius.circular(16),
          color: Colors.white,
        ),
      ),
      SizedBox(
        height: 11,
      ),
      buildText(text, 12, textAlign: TextAlign.center, color: Colors.black87),
    ]),
  );
}

Widget certificateListView() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      buildText('Certificates :', 14, fontWeight: FontWeight.w600),
      SizedBox(
        height: 11,
      ),
      Container(
        height: 80,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 5,
          itemBuilder: (context, position) {
            return Container(
              margin: EdgeInsetsDirectional.fromSTEB(0, 0, 20, 0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Colors.white,
              ),
              child: Image.asset(certificate),
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
      buildText('Detailed Pictures', 14, fontWeight: FontWeight.w600),
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
        children: List.generate(12, (index) {
          return GridTile(
            child: Card(
                color: Colors.white,
                child: Center(
                  child: Image.asset(shoes_image),
                )),
          );
        }),
      ),
    ],
  );
}

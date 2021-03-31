import 'package:bawabtalsharq/Utils/images.dart';
import 'package:bawabtalsharq/Utils/styles.dart';
import 'package:bawabtalsharq/widgets/widgets.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class IndividualProduct extends StatefulWidget {
  @override
  _IndividualProductState createState() => _IndividualProductState();
}

class _IndividualProductState extends State<IndividualProduct>
    with TickerProviderStateMixin {
  TabController _controller;
  final scrollController = ScrollController();
  final List<Tab> myTabs = <Tab>[
    Tab(text: 'Product Details'),
    Tab(text: 'Company Details'),
  ];

  CarouselController buttonCarouselController = CarouselController();
  int sliderPosition = 0;

  @override
  void initState() {
    super.initState();
    _controller = TabController(vsync: this, length: myTabs.length);
    _controller.addListener(_handleTabSelection);
  }

  void _handleTabSelection() {
    if (_controller.indexIsChanging) {
      switch (_controller.index) {
        case 0:
          Scaffold.of(context).showSnackBar(SnackBar(
            content: Text('Page 1 tapped.'),
            duration: Duration(milliseconds: 500),
          ));
          break;
        case 1:
          Scaffold.of(context).showSnackBar(SnackBar(
            content: Text('Page 2 tapped.'),
            duration: Duration(milliseconds: 500),
          ));
          break;
      }
    }
  }

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Container(
          color: Color(0xfff9dfd6),
          child: CustomScrollView(
            controller: scrollController,
            slivers: [
              SliverAppBar(
                leading: Icon(
                  Icons.arrow_back_ios_rounded,
                  size: 16,
                ),
                actions: [
                  iconRound(Icons.add_to_photos_rounded),
                  iconRound(Icons.bookmark_border_outlined),
                ],
                backgroundColor: Color(0xfff9dfd6),
                expandedHeight: MediaQuery.of(context).size.height * 0.35,
                flexibleSpace: FlexibleSpaceBar(
                  background: Container(
                    padding: EdgeInsets.only(top: 20, bottom: 10),
                    height: MediaQuery.of(context).size.height * 0.3,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CarouselSlider.builder(
                          carouselController: buttonCarouselController,
                          options: CarouselOptions(
                            onPageChanged: (index, reason) {
                              setState(() {
                                sliderPosition = index;
                              });
                            },
                            autoPlay: false,
                            viewportFraction: 0.9,
                            aspectRatio: 2.0,
                            initialPage: 0,
                            autoPlayCurve: Curves.fastOutSlowIn,
                            scrollDirection: Axis.horizontal,
                          ),
                          itemCount: 4,
                          itemBuilder: (context, index, realIndex) => Image(
                            image: AssetImage(shoes_image),
                          ),
                        ),
                        sliderIndicator(sliderPosition, noPadding: true),
                      ],
                    ),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Expanded(
                  child: Container(
                    height: MediaQuery.of(context).size.height,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40),
                      ),
                    ),
                    child: Padding(
                        padding:
                            const EdgeInsets.only(left: 40, right: 40, top: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                              child: Container(
                                width: 50,
                                height: 2.5,
                                color: Colors.grey[300],
                              ),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(
                                  child: RichText(
                                    overflow: TextOverflow.clip,
                                    strutStyle: StrutStyle(fontSize: 14),
                                    text: TextSpan(
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold),
                                        text:
                                            'Kedo Running Shoes from Addidas Kedo Running Shoes from Addidas'),
                                  ),
                                ),
                                RatingBar.builder(
                                  itemSize: 18,
                                  initialRating: 3,
                                  minRating: 1,
                                  direction: Axis.horizontal,
                                  allowHalfRating: true,
                                  itemCount: 5,
                                  itemPadding:
                                      EdgeInsets.symmetric(horizontal: 1),
                                  itemBuilder: (context, _) => Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                  ),
                                  onRatingUpdate: (rating) {
                                    print(rating);
                                  },
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            productOption(
                              widgetTitle: 'Product Options',
                              widgetSubTitle: 'Color',
                              widget: productColorOption(
                                price: '50',
                                counterWidget: productCounter(number: 10),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            infoCartSupplier('Mohamed Mosadik Hassanien',
                                '3 YRS', 'Egypt', 'Food & Bevereges'),
                            Expanded(child: detailsTabBar()),
                          ],
                        )),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget detailsTabBar() {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: TabBar(
        isScrollable: true,
        controller: _controller,
        tabs: myTabs,
        indicatorColor: orangeColor,
        indicatorSize: TabBarIndicatorSize.label,
        labelColor: orangeColor,
      ),
      body: TabBarView(controller: _controller, children: [
        SingleChildScrollView(
          child: Column(
            children: [
              overViewText(),
              SizedBox(
                height: 10,
              ),
              productFaq(title: 'FAQ:', question: 'Question', answer: 'Answer'),
              detailsPictures(),
              certificateListView(),
              listOfBackingChipping(),
            ],
          ),
        ),
        Container(
          color: Colors.white,
          child: Center(
            child: Text(
              'Match',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ]),
    );
  }
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
              width: 10,
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
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
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
                  style: TextStyle(color: Colors.black, fontSize: 14),
                ),
                SizedBox(
                  height: 2,
                ),
                Text(
                  answer,
                  style: TextStyle(color: Colors.black54, fontSize: 14),
                ),
              ],
            ),
          );
        },
      ),
    ],
  );
}

Widget infoCartSupplier(
    String name, String years, String country, String category) {
  return Column(
    children: [
      Container(
        child: Stack(children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(35),
                boxShadow: [makeShadow(color: (0x29e16036), offset: 3)],
              ),
              child: Padding(
                padding: const EdgeInsetsDirectional.only(
                    top: 10, start: 30, end: 30, bottom: 10),
                child: Column(
                  children: [
                    buildText(name, 12.0,
                        color: Colors.black, fontWeight: FontWeight.w700),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.access_time_rounded,
                              size: 13,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            buildText(years, 7.0,
                                color: Colors.black,
                                fontWeight: FontWeight.w700),
                          ],
                        ),
                        Row(
                          children: [
                            Image(
                              image: AssetImage(medalImage),
                              width: 14,
                              height: 14,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            buildText(country, 7.0,
                                color: Colors.black,
                                fontWeight: FontWeight.w700),
                          ],
                        ),
                        buildText(category, 7.0,
                            color: Colors.black, fontWeight: FontWeight.w700),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 10,
            left: 10,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [makeShadow(color: (0x29e16036), offset: 3)],
              ),
              child: Image(
                image: AssetImage(
                  medalImage,
                ),
                height: 45,
                width: 45,
              ),
            ),
          ),
        ]),
      ),
    ],
  );
}

Widget overViewText() {
  return Container(
    margin: EdgeInsets.only(top: 15),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildText('Overview', 14, fontWeight: FontWeight.w600),
        SizedBox(
          height: 5,
        ),
        buildText(
            's simply dummy text of the printing and typesetting industry. Lorem Ipsum has s simply dummy text of the printing and of the printing and typesetting industry. Lorem Ipsum has s simply dummy text of the printing and typesetting industry. Lorem Ipsum has s simply dummy text of the printing and typesetting industry. Lorem Ipsum has s simply dummy text of the printing and typesetting industry. Lorem Ipsum has s simply dummy text of the printing and typesetting industry. Lorem Ipsum has ',
            12,
            color: Colors.grey)
      ],
    ),
  );
}

Widget listOfBackingChipping() {
  return ListView.builder(
    physics: NeverScrollableScrollPhysics(),
    reverse: false,
    scrollDirection: Axis.vertical,
    shrinkWrap: true,
    itemCount: 5,
    itemBuilder: (context, position) {
      return SizedBox(
          width: MediaQuery.of(context).size.width / 3 - 5,
          child: backingChipping(
              'gdfgt dfdnfu dkfbhdhkslfb', productImage, context));
    },
  );
}

Widget backingChipping(String text, String image, BuildContext context) {
  return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
    buildText('Packiging & Shipping', 16),
    Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * .15,
      decoration: new BoxDecoration(
        image: DecorationImage(
          image: AssetImage(logo),
          fit: BoxFit.fill,
        ),
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
      ),
    ),
    SizedBox(
      height: 11,
    ),
    buildText(text, 16, fontWeight: FontWeight.w400),
  ]);
}

Widget certificateListView() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      buildText('Certificates :', 14, fontWeight: FontWeight.bold),
      SizedBox(
        height: 11,
      ),
      Container(
        height: 80,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          // padding: const EdgeInsets.all(2.0),
          itemCount: 5,
          itemBuilder: (context, position) {
            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Colors.white,
              ),
              child: Image.asset(productImage),
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
      buildText('Detailed Pictures', 14, fontWeight: FontWeight.bold),
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
                  child: Image.asset(logo),
                )),
          );
        }),
      ),
    ],
  );
}

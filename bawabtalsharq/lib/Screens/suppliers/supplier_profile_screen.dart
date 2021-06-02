import 'package:bawabtalsharq/Model/search_quary.dart';
import 'package:bawabtalsharq/Model/supplier_model.dart';
import 'package:bawabtalsharq/Model/user_model.dart';
import 'package:bawabtalsharq/Screens/search/search_result_screen.dart';
import 'package:bawabtalsharq/Utils/Localization/Language/Languages.dart';
import 'package:bawabtalsharq/Utils/Localization/LanguageHelper.dart';
import 'package:bawabtalsharq/Utils/constants.dart';
import 'package:bawabtalsharq/Utils/images.dart';
import 'package:bawabtalsharq/Utils/loading.dart';
import 'package:bawabtalsharq/Utils/styles.dart';
import 'package:bawabtalsharq/bloc/supplierProfileBloc/supplierProfile_bloc.dart';
import 'package:bawabtalsharq/bloc/supplierProfileBloc/supplierProfile_event.dart';
import 'package:bawabtalsharq/bloc/supplierProfileBloc/supplierProfile_state.dart';
import 'package:bawabtalsharq/widgets/widgets.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../main.dart';
import 'CirclPainter.dart';
import 'Waves.dart';

class SupplierProfile extends StatefulWidget {
  final double size;
  final Color color;
  final Widget child;
  final VoidCallback onPressed;
  final String supplierId;
  String errorMessage = '';

  SupplierProfile(
    this.supplierId, {
    Key key,
    this.size = 100.0,
    this.color = Colors.red,
    this.onPressed,
    @required this.child,
  }) : super(key: key);

  @override
  _SupplierProfileState createState() => _SupplierProfileState();
}

class _SupplierProfileState extends State<SupplierProfile>
    with TickerProviderStateMixin {
  UserModel currentUser = Constants.getUserInfo2();
  AnimationController _controller;
  SupplierProfileBloc _supplierProfileBloc;
  bool isLoaded = false;
  bool isLoading = false;
  String errorMessage = '';
  SupplierProfileModel supplierProfileData;
  @override
  void initState() {
    _supplierProfileBloc = SupplierProfileBloc();
    _supplierProfileBloc.add(DoSupplierProfileEvent(widget.supplierId));

    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Map<int, Widget> seqmentBulid(BuildContext context) {
    final Map<int, Widget> myTabs = <int, Widget>{
      0: Text(
        Languages.of(context).allProducts,
        style: TextStyle(
          color: Colors.black,
          fontSize: 16,
          fontWeight: FontWeight.w700,
        ),
      ),
      1: Text(Languages.of(context).info,
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ))
    };
    return myTabs;
  }

  Map<int, Widget> info(BuildContext context) {
    final Map<int, Widget> info = <int, Widget>{
      0: listOfCateWidgetSupplier(),
      1: infoList(),
    };
    return info;
  }

  int segmentedControlGroupValue = 0;

  _launchURL(String toMailId, String subject, String body) async {
    var url = 'mailto:$toMailId?subject=$subject&body=$body';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SupplierProfileBloc, SupplierProfileState>(
      bloc: _supplierProfileBloc,
      builder: (context, state) {
        if (state is SupplierProfileLoadingState) {
          return Container(
            color: Colors.white,
            child: Center(
              child: LoadingLogo(),
            ),
          );
        }
        if (state is SupplierProfileLoadedState) {
          isLoaded = true;
          isLoading = true;
          supplierProfileData = state.supplierProfileResponse;
        }
        if (state is SupplierProfileErrorState)
          errorMessage = 'No Internet Connection';
        return Scaffold(
            body: isLoaded
                ? SafeArea(
                    bottom: false,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 220,
                          child: Stack(
                            children: [
                              Container(
                                height: 120,
                                width: MediaQuery.of(context).size.width,
                                child: CachedNetworkImage(
                                  imageUrl:
                                      supplierProfileData.supplierData.banner,
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
                              Positioned.directional(
                                textDirection: Directionality.of(context),
                                top: 20,
                                start: 10,
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: CircleAvatar(
                                    radius: 9,
                                    backgroundColor: Colors.white,
                                    child: Icon(
                                      LanguageHelper.isEnglish
                                          ? Icons.keyboard_arrow_left_outlined
                                          : Icons.keyboard_arrow_right_outlined,
                                      size: 15,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                              Positioned.directional(
                                textDirection: Directionality.of(context),
                                top: 70,
                                start: 30,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Container(
                                      width: 86,
                                      height: 86,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(16),
                                        border: Border.all(
                                          color: Colors.white,
                                        ),
                                        shape: BoxShape.rectangle,
                                        image: DecorationImage(
                                          image: NetworkImage(
                                              supplierProfileData
                                                  .supplierData.logo),
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        buildText(
                                            supplierProfileData
                                                .supplierData.name,
                                            12),
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
                                              '${Languages.of(context).memberSince + supplierProfileData.supplierData.year}',
                                              8,
                                              fontWeight: FontWeight.w400,
                                            ),
                                            SizedBox(
                                              height: 15,
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Positioned.directional(
                                textDirection: Directionality.of(context),
                                top: 170,
                                start: 20,
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.only(
                                      start: 10),
                                  child: Row(
                                    children: [
                                      iconOfSupplier(Icons.location_on, () {
                                        if (currentUser == null)
                                          Navigator.pushNamed(context,
                                              ScreenRoutes.loginScreen);
                                        else
                                          showCupertinoModalPopup(
                                              context: context,
                                              builder: (BuildContext context) =>
                                                  cupertinoActionSheet(
                                                    context,
                                                    supplierProfileData
                                                        .supplierData.address,
                                                  ));
                                      }),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      iconOfSupplier(Icons.phone, () {
                                        if (currentUser == null)
                                          Navigator.pushNamed(context,
                                              ScreenRoutes.loginScreen);
                                        else
                                          showCupertinoModalPopup(
                                              context: context,
                                              builder: (BuildContext context) =>
                                                  cupertinoActionSheet(
                                                      context,
                                                      supplierProfileData
                                                          .supplierData.phone,
                                                      action: launch(
                                                          "tel://${supplierProfileData.supplierData.phone}")));
                                      }),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      iconOfSupplier(Icons.email_rounded, () {
                                        if (currentUser == null)
                                          Navigator.pushNamed(context,
                                              ScreenRoutes.loginScreen);
                                        else
                                          showCupertinoModalPopup(
                                              context: context,
                                              builder: (BuildContext context) =>
                                                  cupertinoActionSheet(
                                                      context,
                                                      supplierProfileData
                                                          .supplierData.email,
                                                      action: _launchURL(
                                                          '${supplierProfileData.supplierData.email}',
                                                          '',
                                                          '')));
                                      }),
                                    ],
                                  ),
                                ),
                              ),
                              Positioned.directional(
                                textDirection: Directionality.of(context),
                                top: 120,
                                end: 25,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    CustomPaint(
                                      painter: CirclePainter(
                                        _controller,
                                        color: widget.color,
                                      ),
                                      child: chatButtonAnimation(() {},
                                          size: 35, sizeIcon: 5, padOfIcon: 16),
                                    ),
                                    buildText(
                                      Languages.of(context).startChat,
                                      10,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          height: 70,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.vertical(
                                bottom: Radius.circular(25)),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.05),
                              ),
                              BoxShadow(
                                  color: Colors.white,
                                  spreadRadius: 1.0,
                                  blurRadius: 8.0,
                                  offset: Offset(0, -8)),
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 40, vertical: 14),
                            child: detailsSupplierTabBar(),
                          ),
                        ),
                        Expanded(
                            child: info(context)[segmentedControlGroupValue]),
                      ],
                    ),
                  )
                : Center(child: Text(errorMessage)));
      },
    );
  }

  Widget chatButtonAnimation(Function _function,
      {double size, double sizeIcon, double padOfIcon}) {
    return Padding(
      padding: EdgeInsets.all(padOfIcon),
      child: SizedBox(
        width: size,
        height: size,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(widget.size),
          child: DecoratedBox(
            decoration: BoxDecoration(),
            child: ClipOval(
              child: Material(
                shadowColor: orangeShadowColor,
                color: Colors.white,
                child: InkWell(
                  onTap: _function,
                  splashColor: orangeColor.withOpacity(0.4),
                  highlightColor: orangeShadowColor,
                  child: ScaleTransition(
                    scale: Tween(begin: 0.8, end: 1.0).animate(
                      CurvedAnimation(
                        parent: _controller,
                        curve: CurveWave(),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(sizeIcon),
                      child: Image.asset(
                        chatSupplier,
                        width: 30,
                        height: 30,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget iconOfSupplier(IconData icon, Function onPress) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 5),
        width: 30,
        height: 30,
        decoration: new BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
                color: Color(0x297a7a7a),
                offset: Offset(0, 1),
                blurRadius: 6,
                spreadRadius: 0)
          ],
        ),
        child: Icon(
          icon,
          color: BaseOrange,
          size: 20,
        ),
      ),
    );
  }

  Widget detailsSupplierTabBar() {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.8,
          child: CupertinoSlidingSegmentedControl(
            groupValue: segmentedControlGroupValue,
            backgroundColor: orangeColor.withOpacity(0.15),
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 6),
            children: seqmentBulid(context),
            onValueChanged: (i) {
              setState(() {
                segmentedControlGroupValue = i;
              });
            },
          ),
        ),
      ),
    );
  }

  Widget listOfCateWidgetSupplier() {
    return ListView.builder(
        physics: AlwaysScrollableScrollPhysics(),
        reverse: false,
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: supplierProfileData.supplierData.categories.length,
        itemBuilder: (context, position) {
          return SizedBox(
              width: MediaQuery.of(context).size.width / 3 - 5,
              child: categoryOfProductSupplier(context,
                  supplierProfileData.supplierData.categories, position));
        });
  }

  Widget categoryOfProductSupplier(
      BuildContext context, List<Categories> listOfCategoryData, int position) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                listOfCategoryData[position].name,
                style: TextStyle(
                  fontSize: 16,
                  color: const Color(0xff303030),
                  letterSpacing: 0.192,
                  fontWeight: FontWeight.w700,
                  shadows: [
                    Shadow(
                      color: const Color(0x297d7d7d),
                      offset: Offset(0, 3),
                      blurRadius: 6,
                    )
                  ],
                ),
                textHeightBehavior:
                    TextHeightBehavior(applyHeightToFirstAscent: false),
                textAlign: TextAlign.left,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      new MaterialPageRoute(
                        builder: (BuildContext context) => new SearchResult(
                          searchQuery: new SearchQueryModel(
                            '',
                            Categories: [
                              listOfCategoryData[position].categoryId.toString()
                            ],
                          ),
                        ),
                      ));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      Languages.of(context).seeAll,
                      style: TextStyle(
                        fontSize: 11,
                        color: const Color(0xff6d6d6d),
                        letterSpacing: 0.132,
                        fontWeight: FontWeight.w600,
                        shadows: [
                          Shadow(
                            color: const Color(0x297d7d7d),
                            offset: Offset(0, 3),
                            blurRadius: 6,
                          )
                        ],
                      ),
                      textHeightBehavior:
                          TextHeightBehavior(applyHeightToFirstAscent: false),
                      textAlign: TextAlign.left,
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Icon(
                      LanguageHelper.isEnglish
                          ? Icons.arrow_forward_rounded
                          : Icons.arrow_back_rounded,
                      size: 15,
                      color: Colors.black.withOpacity(0.7),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: 190,
          child: Stack(
            children: [
              Container(
                height: 55,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
                  boxShadow: [
                    BoxShadow(
                      color: orangeShadowColor.withOpacity(0.1),
                    ),
                    BoxShadow(
                        color: Colors.white,
                        spreadRadius: -1.0,
                        blurRadius: 8.0,
                        offset: Offset(0, 8)),
                  ],
                ),
              ),
              Positioned(
                top: 135,
                child: Container(
                  height: 55,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.vertical(bottom: Radius.circular(25)),
                    boxShadow: [
                      BoxShadow(
                        color: orangeShadowColor.withOpacity(0.1),
                      ),
                      BoxShadow(
                          color: Colors.white,
                          spreadRadius: 1.0,
                          blurRadius: 8.0,
                          offset: Offset(0, -8)),
                    ],
                  ),
                ),
              ),
              Positioned(
                  top: 5,
                  left: 5,
                  child: productOfSupplier(
                      listOfCategoryData[position].productData)),
            ],
          ),
        ),
      ],
    );
  }

  Widget productOfSupplier(List<ProductData> product) {
    return SizedBox(
      height: 170,
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        reverse: true,
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: 3,
        itemBuilder: (context, position) {
          return SizedBox(
            width: MediaQuery.of(context).size.width / 3 - 5,
            child: mostPopularCateg(
              context: context,
              onPress: () {
                Navigator.pushNamed(context, ScreenRoutes.individualProduct,
                    arguments: product[position].id);
              },
              position: position,
              backgroundColor: position == 2
                  ? redColor
                  : (position == 1 ? orangeColor : blueColor),
              nameProduct: product[position].name,
              productImg: product[position].image,
              price: product[position].price,
            ),
          );
        },
      ),
    );
  }

  Widget mostPopularCateg(
      {Function onPress,
      int position,
      Color backgroundColor,
      String productImg,
      String nameProduct,
      String price,
      BuildContext context}) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: Stack(
            alignment: position == 2
                ? AlignmentDirectional.topEnd
                : (position == 1
                    ? AlignmentDirectional.topCenter
                    : AlignmentDirectional.topStart),
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    left: 5, bottom: 15, right: 5, top: 30),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 4,
                          spreadRadius: 0.1,
                          offset: Offset(1, 3))
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Stack(
                        alignment: position == 2
                            ? AlignmentDirectional.centerEnd
                            : (position == 1
                                ? AlignmentDirectional.center
                                : AlignmentDirectional.centerStart),
                        children: [
                          PositionedDirectional(
                            top: -40,
                            start: position == 2 ? -40 : null,
                            end: position == 0 ? -40 : null,
                            child: SizedBox(
                                height: 115,
                                width: 115,
                                child: Container(
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      gradient: LinearGradient(
                                          colors: [
                                            backgroundColor.withOpacity(0.4),
                                            backgroundColor.withOpacity(0.35),
                                            backgroundColor.withOpacity(0.28),
                                            backgroundColor.withOpacity(0.0),
                                            backgroundColor.withOpacity(0.0),
                                          ],
                                          begin: position == 2
                                              ? AlignmentDirectional.topStart
                                              : (position == 1
                                                  ? Alignment.topCenter
                                                  : AlignmentDirectional
                                                      .topEnd),
                                          end: position == 2
                                              ? AlignmentDirectional.bottomEnd
                                              : (position == 1
                                                  ? Alignment.bottomCenter
                                                  : AlignmentDirectional
                                                      .bottomStart),
                                          tileMode: TileMode.clamp)),
                                )),
                          ),
                        ]),
                  ),
                ),
              ),
              PositionedDirectional(
                  top: 7,
                  start: position == 2 ? -5 : null,
                  end: position == 0 ? -5 : null,
                  child: SizedBox(
                    width: 70,
                    height: 60,
                    child: CachedNetworkImage(
                      fit: BoxFit.fill,
                      imageUrl: productImg,
                      placeholder: (context, url) => Padding(
                        padding: EdgeInsets.all(8),
                        child: Image.asset(
                          placeHolder,
                          fit: BoxFit.fill,
                        ),
                      ),
                      errorWidget: (context, url, error) => Padding(
                        padding: EdgeInsets.all(8),
                        child: Image.asset(
                          placeHolder,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  )),
              Padding(
                padding:
                    const EdgeInsetsDirectional.only(start: 12.0, top: 110.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      nameProduct,
                      maxLines: 1,
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: Text(
                              LanguageHelper.isEnglish ? '$price' : '$price',
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 10,
                                  color: Colors.deepOrangeAccent),
                            ),
                          ),
                          SizedBox(
                            width:
                                1.1 * MediaQuery.of(context).size.width * 0.020,
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Icon(
                            Icons.bookmark_border,
                            size: MediaQuery.of(context).size.height * 0.020,
                            color: Colors.black54,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ]),
      ),
    );
  }

  Widget infoList() {
    return SingleChildScrollView(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).size.height * 0.1),
      child: Padding(
        padding: const EdgeInsets.only(left: 30, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20,
            ),
            buildText('Member info:', 13, fontWeight: FontWeight.w600),
            SizedBox(
              height: 100,
            ),
            buildText('Contact Detail:', 13, fontWeight: FontWeight.w600),
            SizedBox(
              height: 100,
            ),
            buildText('Company Profile', 13, fontWeight: FontWeight.w600),
            SizedBox(
              height: 20,
            ),
            // mainSlider(
            //     // imgs: state.homeResponse.data.slider,
            //     ),
            buildText(
                'It is our passion to make people forget their daily stress while indulging in one of our many exclusive pieces...It is our passion to make people forget their daily stress while indulging in one of our many exclusive pieces...It is our passion to make people forget their daily stress while indulging in one of our many exclusive pieces...It is our passion to make people forget their daily stress while indulging in one of our many exclusive piecesIt is our passion to make people forget their daily stress while indulging in one of our many exclusive piecesIt is our passion to make people forget their daily stress while indulging in one of our many exclusive piecesIt is our passion to make people forget their daily stress while indulging in one of our many exclusive piecesIt is our passion to make people forget their daily stress while indulging in one of our many exclusive pieces...',
                11,
                fontWeight: FontWeight.w600)
          ],
        ),
      ),
    );
  }
}

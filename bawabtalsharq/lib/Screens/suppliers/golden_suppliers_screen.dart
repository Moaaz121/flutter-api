import 'package:bawabtalsharq/Model/golden_suppliers_model.dart';
import 'package:bawabtalsharq/Utils/Localization/Language/Languages.dart';
import 'package:bawabtalsharq/Utils/images.dart';
import 'package:bawabtalsharq/bloc/goldenSuppliersBloc/golden_supplier_bloc.dart';
import 'package:bawabtalsharq/bloc/goldenSuppliersBloc/golden_supplier_event.dart';
import 'package:bawabtalsharq/bloc/goldenSuppliersBloc/golden_supplier_state.dart';
import 'package:bawabtalsharq/main.dart';
import 'package:bawabtalsharq/widgets/widgets.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GoldenSuppliers extends StatefulWidget {
  @override
  _GoldenSuppliersState createState() => _GoldenSuppliersState();
}

class _GoldenSuppliersState extends State<GoldenSuppliers> {
  GoldenBloc _goldenBloc;
  bool isLoading = false;
  bool isLoaded = false;
  List<Suppliers> suppliers;
  String errorMessage = '';

  @override
  void initState() {
    // TODO: implement initState
    _goldenBloc = GoldenBloc();
    _goldenBloc.add(GetGoldenSuppliersEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: appBarBuilder(
          title: Languages.of(context).ourGoldenSupplier,
          onBackPressed: () {
            Navigator.pop(context);
          },
        ),
        body: BlocBuilder<GoldenBloc, GoldenState>(
          bloc: _goldenBloc,
          builder: (context, state) {
            if (state is GoldenLoadingState) {
              if (!isLoading) {
                isLoading = true;
                return Container(
                  color: Colors.white,
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              }
            } else if (state is GoldenLoadedState) {
              suppliers = state.suppliers;
              isLoading = true;
              isLoaded = true;
            } else if (state is GoldenErrorState) {
              errorMessage = 'No Internet Connection';
            }
            return isLoading
                ? ListView.builder(
                    padding: EdgeInsets.only(
                      top: 20,
                      left: 11,
                    ),
                    physics: AlwaysScrollableScrollPhysics(),
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: suppliers.length,
                    itemBuilder: (context, position) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(
                              context, ScreenRoutes.supplierProfileScreen,
                              arguments: suppliers[position].supplierId);
                        },
                        child: Stack(children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20),
                            child: Container(
                              margin: EdgeInsets.only(left: 12, right: 12),
                              // width: 333,
                              height: 190,
                              decoration: new BoxDecoration(
                                color: Color(0xfffbfbfb),
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: [
                                  BoxShadow(
                                    color: Color(0xFFE16036).withOpacity(0.1),
                                    offset: Offset(0, 1.0),
                                    blurRadius: 16.0,
                                  ),
                                ],
                              ),
                              child: Column(
                                children: [
                                  firstRow(
                                      supplierName: suppliers[position].name),
                                  secondRow(year: suppliers[position].year),
                                  thirdRow(
                                      products: suppliers[position].products),
                                ],
                              ),
                            ),
                          ),
                          Positioned.directional(
                            textDirection: Directionality.of(context),
                            top: 2,
                            start: 30,
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(15.0),
                                child: Container(
                                  height: 70,
                                  width: 65,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  child: CachedNetworkImage(
                                    imageUrl: suppliers[position].logo,
                                    placeholder: (context, url) => Padding(
                                      padding: EdgeInsets.all(5),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15.0),
                                        ),
                                        child: Image.asset(placeHolder),
                                      ),
                                    ),
                                    errorWidget: (context, url, error) =>
                                        Padding(
                                      padding: EdgeInsets.all(5),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15.0),
                                        ),
                                        child: Image.asset(placeHolder),
                                      ),
                                    ),
                                  ),
                                )),
                          ),
                        ]),
                      );
                    })
                : Center(child: Text(errorMessage));
          },
        ));
  }

  Padding thirdRow({
    @required List<Products> products,
  }) {
    return Padding(
      padding: const EdgeInsets.only(top: 25, left: 1, right: 11),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          products.isNotEmpty
              ? imagesProduct(
                  text: products[0].product,
                  subText: products[0].category,
                  imagePath: products[0].imagePath)
              : imagesProduct(isEmpty: true),
          products.isNotEmpty
              ? imagesProduct(
                  text: products[1].product,
                  subText: products[1].category,
                  imagePath: products[1].imagePath)
              : imagesProduct(isEmpty: true),
          products.isNotEmpty
              ? imagesProduct(
                  text: products[2].product,
                  subText: products[2].category,
                  imagePath: products[2].imagePath)
              : imagesProduct(isEmpty: true),
        ],
      ),
    );
  }

  Column imagesProduct(
      {String text = '',
      String subText = '',
      String imagePath = '',
      bool isEmpty = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      // mainAxisAlignment: MainAxisAlignment.start,
      children: [
        ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Container(
              height: 70,
              width: 85,
              child: CachedNetworkImage(
                imageUrl: imagePath,
                placeholder: (context, url) => Padding(
                  padding: EdgeInsets.all(5),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Image.asset(placeHolder),
                  ),
                ),
                errorWidget: (context, url, error) => Padding(
                  padding: EdgeInsets.all(5),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Image.asset(placeHolder),
                  ),
                ),
              ),
            )),
        SizedBox(
          height: 3,
        ),
        buildText(
          text,
          10,
          fontWeight: FontWeight.w700,
        ),
        SizedBox(
          height: 3,
        ),
        buildText(
          subText,
          8,
          fontWeight: FontWeight.w400,
        ),
      ],
    );
  }

  Padding secondRow({
    @required String year,
  }) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(
        end: 11,
        start: 95,
      ),
      child: Row(
        children: [
          Icon(
            Icons.access_time,
            size: 15,
          ),
          buildText(
            Languages.of(context).memberSince + year,
            7,
            color: Color(0xff646464),
            fontWeight: FontWeight.w400,
          ),
        ],
      ),
    );
  }

  Padding firstRow({@required String supplierName}) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(top: 4, start: 95, end: 11),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              SizedBox(
                width: 75,
                child: buildText(
                  supplierName,
                  15,
                  maxLine: 1,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Image(
                image: AssetImage(medalImage),
                width: 14,
                height: 14,
              ),
            ],
          ),
          Icon(
            Icons.arrow_forward,
            size: 14,
          ),
        ],
      ),
    );
  }
}

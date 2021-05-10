import 'package:bawabtalsharq/Utils/Localization/Language/Languages.dart';
import 'package:bawabtalsharq/Utils/images.dart';
import 'package:bawabtalsharq/widgets/widgets.dart';
import 'package:bawabtalsharq/bloc/goldenSuppliersBloc/golden_supplier_bloc.dart';
import 'package:bawabtalsharq/bloc/goldenSuppliersBloc/golden_supplier_event.dart';
import 'package:bawabtalsharq/bloc/goldenSuppliersBloc/golden_supplier_state.dart';
import 'package:bawabtalsharq/Model/golden_suppliers_model.dart';
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
  List<Suppliers> suppliers;

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
              showLoadingDialog(context);
            } else if (state is GoldenLoadedState) {
              suppliers = state.suppliers;
              isLoading = true;
              _goldenBloc.add(ResetState());
              Navigator.pop(context);
            }
            return isLoading
                ? ListView.builder(
                    padding: EdgeInsets.only(
                      top: 60,
                      left: 11,
                      bottom: 33,
                    ),
                    physics: AlwaysScrollableScrollPhysics(),
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: suppliers.length,
                    itemBuilder: (context, position) {
                      return Stack(children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          child: Container(
                            margin: EdgeInsets.only(
                                left: 12, right: 23, bottom: 15),
                            // width: 333,
                            height: 190,
                            decoration: new BoxDecoration(
                              color: Color(0xfffbfbfb),
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                    color: Color(0x29000000),
                                    offset: Offset(0, 1),
                                    blurRadius: 6,
                                    spreadRadius: 0)
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
                            child: Image(
                              image: NetworkImage(suppliers[position].logo),
                              width: 70,
                              height: 65,
                            ),
                          ),
                        ),
                      ]);
                    })
                : Container();
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
          imagesProduct(
              products[0].product, products[0].category, products[0].imagePath),
          imagesProduct(
              products[1].product, products[1].category, products[1].imagePath),
          imagesProduct(
              products[2].product, products[2].category, products[2].imagePath),
        ],
      ),
    );
  }

  Column imagesProduct(
    String text,
    String subText,
    String imagePath,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      // mainAxisAlignment: MainAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image(
            image: NetworkImage(imagePath),
            width: 85,
            height: 70,
          ),
        ),
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
        start: 90,
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
      padding: const EdgeInsetsDirectional.only(top: 4, start: 90, end: 11),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              buildText(
                supplierName,
                15,
                fontWeight: FontWeight.w700,
              ),
              SizedBox(
                width: 5,
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

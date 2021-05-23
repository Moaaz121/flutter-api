import 'package:bawabtalsharq/Utils/Localization/Language/Languages.dart';
import 'package:bawabtalsharq/Utils/styles.dart';
import 'package:bawabtalsharq/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dropdown/flutter_dropdown.dart';
import 'package:bawabtalsharq/bloc/QuotationBloc/quotation_bloc.dart';
import 'package:bawabtalsharq/main.dart';

class Requestforqutation extends StatefulWidget {
  @override
  _RequestforqutationState createState() => _RequestforqutationState();
}

class _RequestforqutationState extends State<Requestforqutation> {
  bool _isPressed = false;
  bool _checked1 = false;
  bool _checked2 = false;

  TextEditingController productNameCtrl = TextEditingController();
  TextEditingController quantityCrtl = TextEditingController();
  TextEditingController detailsCrtl = TextEditingController();
  TextEditingController otherReqCtrl = TextEditingController();
  TextEditingController portCtrl = TextEditingController();
  TextEditingController leadTimeForInCtrl = TextEditingController();
  TextEditingController paymentTermCtrl = TextEditingController();

  List<String> categoryList = [];
  List<String> categoryIdList = [];
  List<String> purposeList = ['ahmed', 'moaaz'];
  List<String> piecesList = [
    "Apparel",
    "Electronics",
    "Other",
    "sony",
  ];
  List<String> tradeTermList = ['ahmed', 'moaaz'];
  List<String> certList = ['ahmed', 'moaaz'];
  List<String> shippingMethodList = ['ahmed', 'moaaz'];
  List<String> destinationList = ['ahmed', 'moaaz'];

  Map<String, dynamic> data = {};
  QuotationBloc _quotationBloc;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _quotationBloc = QuotationBloc();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

    _quotationBloc.close();

    productNameCtrl.dispose();
    quantityCrtl.dispose();
    detailsCrtl.dispose();
    otherReqCtrl.dispose();
    portCtrl.dispose();
    leadTimeForInCtrl.dispose();
    paymentTermCtrl.dispose();
    portCtrl.dispose();
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      top: false,
      child: Scaffold(
          key: _scaffoldKey,
          backgroundColor: Colors.white54.withOpacity(0.92),
          appBar: appBarBuilderWithWidget(
              titleWidget: buildText(
                  Languages.of(context).requestForQuotation, 18.0,
                  fontFamily: boldFontFamily,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
              onBackPressed: () {
                Navigator.pop(context);
              }),
          body: BlocProvider(
            create: (context) => _quotationBloc,
            child: BlocListener<QuotationBloc, QuotationState>(
              listener: (context, state) {
                if (state is PostedQuotationResponseState) {
                  _scaffoldKey.currentState
                      .showSnackBar(new SnackBar(content: new Text(state.msg)));
                  Navigator.pushReplacementNamed(
                      context, ScreenRoutes.mainScreen);
                }
              },
              child: BlocBuilder<QuotationBloc, QuotationState>(
                builder: (context, state) {
                  if (state is QuotationInitialState) {
                    _quotationBloc.add(GetCatergoryList());

                    return buildBody();
                  } else if (state is LoadingCategoryListState) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is LoadedCategoryListState) {
                    categoryList = List.from(state.categoryNameList);
                    categoryIdList = List.from(state.categoryIdList);

                    return buildBody();
                  } else if (state is PostingReqQuotationState) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is ReqQuotationErrorState) {
                    _scaffoldKey.currentState.showSnackBar(
                        new SnackBar(content: new Text(state.msg)));
                  }
                  return buildBody();
                },
              ),
            ),
          )),
    );
  }

  Widget buildBody() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildColumnText(context,
              text: Languages.of(context).productName + ' *',
              inputText: Languages.of(context).inputProduct,
              maxLines: 1,
              controller: productNameCtrl),

          buildColumnDrop(context,
              text: Languages.of(context).categoryName + ' *',
              dropText: Languages.of(context).dropCategory,
              dropList: categoryList),

          buildColumnDrop(context,
              text: Languages.of(context).sourcingPurpose + ' *',
              dropText: Languages.of(context).dropSourcing,
              dropList: purposeList),

          buildColumnText(context,
              text: Languages.of(context).quantity,
              inputText: '000000000',
              // margin: 60,
              controller: quantityCrtl),

          Center(
            child: Padding(
              padding: const EdgeInsetsDirectional.only(top: 8.0),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.9,
                height: MediaQuery.of(context).size.height * 0.055,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                  child: DropDown<String>(
                    showUnderline: false,
                    isExpanded: true,
                    items: piecesList,
                    hint: Text(
                      Languages.of(context).dropQuantity,
                      style: TextStyle(
                        color: backTabColor.withOpacity(0.8),
                        decoration: TextDecoration.none,
                      ),
                    ),
                    // onChanged: print,
                  ),
                ),
              ),
            ),
          ),

          buildColumnDrop(context,
              text: Languages.of(context).tradeTerms + ' *',
              dropText: Languages.of(context).dropTrade,
              dropList: tradeTermList),

          // <----start Details---->
          buildColumnText(context,
              text: Languages.of(context).details + ' *',
              inputText: Languages.of(context).inputDetails,
              height: 0.3,
              minLines: 1,
              maxLines: null,
              controller: detailsCrtl),

          Padding(
            padding: const EdgeInsetsDirectional.only(top: 15),
            child: Center(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.8,
                height: MediaQuery.of(context).size.height * 0.23,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: defaultPrimaryBackgroundColor.withOpacity(0.3),
                ),
                child: Column(
                  children: [
                    Icon(
                      Icons.backup_rounded,
                      color: Colors.deepOrangeAccent.withOpacity(0.5),
                      size: MediaQuery.of(context).size.width * 0.30,
                    ),
                    Text(
                      Languages.of(context).uploadDocument,
                      style: TextStyle(
                          color: Color(0xFF5E5E5E),
                          decoration: TextDecoration.underline),
                    ),
                  ],
                ),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(20, 20, 20, 20),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _isPressed = !_isPressed;
                });
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    Languages.of(context).advanced,
                    style: TextStyle(
                        fontSize: 17,
                        color: orangeColor,
                        fontWeight: FontWeight.w700),
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsetsDirectional.only(start: 10, end: 10),
                      height: 2,
                      color: orangeColor.withOpacity(0.3),
                    ),
                  ),
                  _isPressed
                      ? Icon(Icons.keyboard_arrow_up_rounded,
                          color: orangeColor)
                      : Icon(Icons.keyboard_arrow_down_rounded,
                          color: orangeColor),
                ],
              ),
            ),
          ),

          Visibility(
            visible: _isPressed,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Padding(
                    padding: const EdgeInsetsDirectional.only(
                        start: 20, top: 5, bottom: 5, end: 20),
                    child: Text(
                      Languages.of(context).supplierCapability,
                      style: TextStyle(
                        fontFamily: 'assets/fonts/Roboto-Light.ttf',
                        fontSize: 17,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.only(
                      top: 10, bottom: 20, end: 20, start: 20),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: 2,
                    color: Colors.black.withOpacity(0.5),
                  ),
                ),
                buildColumnDrop(context,
                    text: Languages.of(context).certifications + ' *',
                    dropText: Languages.of(context).dropCertificate,
                    dropList: certList),
                buildColumnText(context,
                    text: Languages.of(context).requirements + ' *',
                    inputText: Languages.of(context).inputRequire,
                    height: 0.3,
                    controller: otherReqCtrl),
                Container(
                  child: Padding(
                    padding: const EdgeInsetsDirectional.only(
                        end: 20, top: 5, bottom: 5, start: 20),
                    child: Text(
                      Languages.of(context).shipping,
                      style: TextStyle(
                          fontFamily: 'assets/fonts/Roboto-Light.ttf',
                          fontSize: 17,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.only(
                      top: 10, bottom: 20, end: 20, start: 20),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: 2,
                    color: Colors.black.withOpacity(0.5),
                  ),
                ),
                buildColumnDrop(context,
                    text: Languages.of(context).shippingMethod + ' *',
                    dropText: Languages.of(context).dropShipping,
                    dropList: shippingMethodList),
                buildColumnDrop(context,
                    text: Languages.of(context).destination + ' *',
                    dropText: Languages.of(context).dropDestination,
                    dropList: destinationList),
                buildColumnText(context,
                    text: Languages.of(context).port + ' *',
                    inputText: Languages.of(context).port,
                    controller: portCtrl),
                buildColumnText(context,
                    text: Languages.of(context).leadTime + ' *',
                    inputText: '000000000',
                    // margin: 60,
                    controller: leadTimeForInCtrl),
                buildColumnText(context,
                    text: Languages.of(context).paymentTerm + ' *',
                    inputText: Languages.of(context).paymentTerm,
                    controller: paymentTermCtrl),
                buildCheckbox(1, text: Languages.of(context).check1),
                buildCheckbox(2, text: Languages.of(context).check2),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsetsDirectional.only(
                          start: 15, bottom: 20, end: 40),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.3,
                        child: RaisedButton(
                          splashColor: orangeColor.withOpacity(0.5),
                          highlightColor: orangeColor.withOpacity(0.2),
                          disabledColor: Colors.transparent,
                          color: Colors.white,
                          child: Text(
                            Languages.of(context).submit,
                            style: TextStyle(
                              color: orangeColor,
                            ),
                          ),
                          onPressed: () {
                            if (productNameCtrl.text.isEmpty ||
                                quantityCrtl.text.isEmpty ||
                                detailsCrtl.text.isEmpty ||
                                otherReqCtrl.text.isEmpty ||
                                portCtrl.text.isEmpty ||
                                leadTimeForInCtrl.text.isEmpty ||
                                paymentTermCtrl.text.isEmpty ||
                                data['category_id'] == null ||
                                data['sourcing'] == null ||
                                data['tradeTerms'] == null ||
                                data['certificates'] == null ||
                                data['Shipping'] == null ||
                                data['Destination'] == null) {
                              _scaffoldKey.currentState.showSnackBar(
                                new SnackBar(
                                  content: new Text(
                                      'Please make sure that all the required fields are filled'),
                                  action: SnackBarAction(
                                    label: 'continue',
                                    onPressed: () {
                                      _scaffoldKey.currentState
                                          .hideCurrentSnackBar();
                                    },
                                  ),
                                ),
                              );
                            } else {
                              data['qty'] = quantityCrtl.text.trim();
                              data['product'] = productNameCtrl.text.trim();
                              data['details'] = detailsCrtl.text.trim();
                              data['otherReq'] = otherReqCtrl.text.trim();
                              data['port'] = portCtrl.text.trim();
                              data['leadTime'] = leadTimeForInCtrl.text.trim();
                              data['paymentTerm'] = quantityCrtl.text.trim();
                              _quotationBloc.add(GetReqQuotation(data: data));
                            }
                          },
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                            side: new BorderSide(
                              color: orangeColor,
                              width: 2,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  CheckboxListTile buildCheckbox(int pos, {String text = ''}) {
    return CheckboxListTile(
      title: Text(text),
      controlAffinity: ListTileControlAffinity.leading,
      value: pos == 1 ? _checked1 : _checked2,
      onChanged: (bool value) {
        setState(() {
          pos == 1 ? _checked1 = value : _checked2 = value;
        });
      },
      activeColor: orangeColor,
      checkColor: Colors.white,
    );
  }

  Padding buildColumnDrop(
    BuildContext context, {
    String text,
    String dropText,
    List<String> dropList,
  }) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(18, 18, 18, 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            text,
            style: TextStyle(
                fontFamily: 'assets/fonts/Roboto-Light.ttf', fontSize: 16),
          ),
          Center(
            child: Container(
              padding: EdgeInsetsDirectional.only(start: 10),
              margin: EdgeInsetsDirectional.only(top: 10),
              height: MediaQuery.of(context).size.height * 0.055,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                child: DropDown<String>(
                  showUnderline: false,
                  isExpanded: true,
                  items: dropList,
                  hint: Text(
                    dropText,
                    style: TextStyle(
                      color: backTabColor.withOpacity(0.8),
                      decoration: TextDecoration.none,
                    ),
                  ),
                  onChanged: (val) {
                    String key;
                    if (dropText == 'Select category') {
                      key = 'category_id';
                      data[key] = categoryIdList[categoryList.indexOf(val)];
                    } else if (dropText == 'Sourcing purpose') {
                      key = 'sourcing';
                      data[key] = val;
                    } else if (dropText == 'FCA') {
                      key = 'tradeTerms';
                      data[key] = val;
                    } else if (dropText == 'Select certificates') {
                      key = 'certificates';
                      data[key] = val;
                    } else if (dropText == 'Shipping') {
                      key = 'Shipping';
                      data[key] = val;
                    } else if (dropText == 'Select Destination') {
                      key = 'Destination';
                      data[key] = val;
                    }
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Padding buildColumnText(BuildContext context,
      {String text,
      String inputText,
      double margin = 5,
      double height = 0.07,
      int minLines,
      int maxLines,
      TextEditingController controller}) {
    print(controller.text.trim());

    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(18, 20, 18, 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          Text(
            text,
            style: TextStyle(
                fontFamily: 'assets/fonts/Roboto-Light.ttf', fontSize: 16),
          ),
          Center(
            child: Container(
              padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
              margin: EdgeInsetsDirectional.only(
                  top: 10, end: margin, start: margin),
              height: MediaQuery.of(context).size.height * height,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              child: TextField(
                controller: controller,
                maxLines: maxLines,
                textInputAction: TextInputAction.next,
                keyboardType: maxLines == null
                    ? TextInputType.multiline
                    : TextInputType.text,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: inputText,
                  hintStyle: TextStyle(
                    color: backTabColor.withOpacity(0.8),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

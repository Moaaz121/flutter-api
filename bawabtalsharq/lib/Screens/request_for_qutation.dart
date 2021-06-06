import 'dart:io';

import 'package:bawabtalsharq/Utils/Localization/Language/Languages.dart';
import 'package:bawabtalsharq/Utils/loading.dart';
import 'package:bawabtalsharq/Utils/styles.dart';
import 'package:bawabtalsharq/bloc/QuotationBloc/quotation_bloc.dart';
import 'package:bawabtalsharq/main.dart';
import 'package:bawabtalsharq/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:multi_image_picker/multi_image_picker.dart';

class Requestforqutation extends StatefulWidget {
  @override
  _RequestforqutationState createState() => _RequestforqutationState();
}

class _RequestforqutationState extends State<Requestforqutation> {
  bool _isPressed = false;
  bool _checked1 = false;
  bool _checked2 = false;
  bool showErrorMessage = false;
  bool selecetedCertBool = false;
  List requiredList = [];
  String imageUrl;

  //Image Picker
  bool _showImages = false;
  File _image = new File('');
  final ImagePicker _imagePicker = ImagePicker();

//TextEditors
  TextEditingController productNameCtrl = TextEditingController();
  TextEditingController quantityCrtl = TextEditingController();
  TextEditingController detailsCrtl = TextEditingController();
  TextEditingController otherReqCtrl = TextEditingController();
  TextEditingController portCtrl = TextEditingController();
  TextEditingController leadTimeForInCtrl = TextEditingController();
  TextEditingController paymentTermCtrl = TextEditingController();

  //Pulled Data
  List<String> categoryList = [];
  List<String> categoryIdList = [];
  List<String> certList = [];
  List<String> certIdList = [];
  List<String> selecetedCert = [];
  List<String> selecetedCertId = [];
  List<String> tradeList = [];
  List<String> tradeIdList = [];
  List<String> purposeList = [];
  List<String> purposeIdList = [];
  List<String> destinationList = [];
  List<String> destinationCodeList = [];

  List<String> shippingList = [];
  List<String> shippingIdList = [];
  List<String> piecesList = [];
  List<String> piecesIdList = [];

  String dropDownVal = '';

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  //Sent data
  Map<String, dynamic> data;
  Map<String, dynamic> dataIdentifier;

  QuotationBloc _quotationBloc;
  List<Asset> images = <Asset>[];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _quotationBloc = QuotationBloc();
    data = {
      'product': 'null',
      'category_id': 'null',
      'sourcing': 'null',
      'qty': 'null',
      'pieces': 'null',
      'trade': 'null',
      'details': 'null',
      'document[0]': 'null',
      'document[1]': 'null',
      'document[2]': 'null',
      'certifications': 'null',
      'other_requirements': 'null',
      'shipping_method': 'null',
      'destination': 'null',
      'lead_time': 'null',
      'ship_in': 'null',
      'payment_term': 'null',
    };
    dataIdentifier = {
      'document[0]': 'null',
      'document[1]': 'null',
      'document[2]': 'null'
    };
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
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      top: false,
      child: Scaffold(
          key: _scaffoldKey,
          backgroundColor: Color.fromRGBO(248, 248, 248, 0.92),
          // Colors.white54.withOpacity(0.92),
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
                  showToast(text: "Your request was successfully submitted");
                  Navigator.pushReplacementNamed(
                      context, ScreenRoutes.mainScreen);
                } else if (state is NoInternetState) {
                  Navigator.pushReplacementNamed(
                      context, ScreenRoutes.noInternet);
                }
              },
              child: BlocBuilder<QuotationBloc, QuotationState>(
                builder: (context, state) {
                  if (state is QuotationInitialState) {
                    _quotationBloc.add(GetCatergoryList());
                    return buildBody();
                  } else if (state is LoadingListsState) {
                    return LoadingLogo();
                  } else if (state is LoadedListsState) {
                    state.categories.forEach((element) {
                      categoryList.add(element.category);
                      categoryIdList.add(element.categoryId);
                    });
                    state.certification.forEach((element) {
                      certList.add(element.cName);
                      certIdList.add(element.cId);
                    });
                    state.tradeTerms.forEach((element) {
                      tradeList.add(element.tName);
                      tradeIdList.add(element.tId);
                    });

                    state.sourcingPurpose.forEach((element) {
                      purposeList.add(element.sName);
                      purposeIdList.add(element.sId);
                    });
                    state.destination.forEach((element) {
                      destinationList.add(element.country);
                      destinationCodeList.add(element.code);
                    });
                    state.shipping.forEach((element) {
                      shippingList.add(element.shipping);
                      shippingIdList.add(element.shippingId);
                    });
                    state.pieces.forEach((element) {
                      piecesList.add(element.pName);
                      piecesIdList.add(element.pId);
                    });

                    _quotationBloc.add(ShowLoadedData());

                    return LoadingLogo();
                  } else if (state is ShowLoadedDataState) {
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
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildtextFormField(context,
                text: Languages.of(context).productName,
                inputText: Languages.of(context).inputProduct,
                maxLines: 1,
                controller: productNameCtrl),

            dropDownButton(context,
                text: Languages.of(context).categoryName,
                dropText: Languages.of(context).dropCategory,
                dropList: categoryList),

            dropDownButton(context,
                text: Languages.of(context).sourcingPurpose,
                dropText: Languages.of(context).dropSourcing,
                dropList: purposeList),

            _buildtextFormField(context,
                text: Languages.of(context).quantity,
                inputText: '000000000',
                // margin: 60,
                controller: quantityCrtl),

            dropDownButton(context,
                text: Languages.of(context).dropQuantity,
                dropText: Languages.of(context).dropQuantity,
                dropList: piecesList),

            dropDownButton(context,
                text: Languages.of(context).tradeTerms,
                dropText: Languages.of(context).dropTrade,
                dropList: tradeList),

            // <----start Details---->
            _buildtextFormField(context,
                text: Languages.of(context).details,
                inputText: Languages.of(context).inputDetails,
                height: 0.3,
                minLines: 1,
                maxLines: null,
                controller: detailsCrtl),

            Padding(
              padding: const EdgeInsetsDirectional.only(top: 20),
              child: Center(
                child: Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: MediaQuery.of(context).size.height * 0.23,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: defaultPrimaryBackgroundColor.withOpacity(0.15),
                    ),
                    child: IconButton(
                        icon: Column(
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
                        onPressed: loadAssets)),
              ),
            ),
            Visibility(
              visible: _showImages,
              child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(20, 20, 20, 0),
                  child: Center(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      width: MediaQuery.of(context).size.width,
                      height: 85,
                      child: ListView.builder(
                          itemCount: images.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (ctx, i) {
                            Asset asset = images[i];

                            return Center(
                              child: Padding(
                                padding: const EdgeInsets.all(3.0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10.0),
                                  child: Container(
                                      width: 80,
                                      height: 85,
                                      child: AssetThumb(
                                        asset: asset,
                                        width: 300,
                                        height: 300,
                                      )),
                                ),
                              ),
                            );
                          }),
                    ),
                  )),
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
                  dropDownButton(context,
                      text: Languages.of(context).certifications,
                      dropText: Languages.of(context).dropCertificate,
                      dropList: certList),
                  Padding(
                    padding: const EdgeInsetsDirectional.only(
                        start: 35, top: 1, bottom: 1, end: 35),
                    child: Visibility(
                      visible: selecetedCertBool,
                      child: Container(
                        height: 70,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: selecetedCert.length,
                          itemBuilder: (ctx, i) {
                            return Container(
                              child: Row(
                                children: [
                                  Text(selecetedCert[i]),
                                  IconButton(
                                    icon: Icon(
                                      Icons.cancel,
                                      color: orangeColor,
                                    ),
                                    iconSize: 15,
                                    onPressed: () {
                                      setState(() {
                                        selecetedCert.removeAt(i);
                                        selecetedCertId.removeAt(i);
                                        if (selecetedCert.length == 0)
                                          selecetedCertBool = false;
                                      });
                                    },
                                  ),
                                  VerticalDivider(
                                    color: Colors.grey,
                                    thickness: 2,
                                    endIndent: 25,
                                    indent: 25,
                                  ),
                                  SizedBox(width: 3)
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                  _buildtextFormField(context,
                      text: Languages.of(context).requirements,
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
                  dropDownButton(context,
                      text: Languages.of(context).shippingMethod,
                      dropText: Languages.of(context).dropShipping,
                      dropList: shippingList),
                  dropDownButton(context,
                      text: Languages.of(context).destination,
                      dropText: Languages.of(context).dropDestination,
                      dropList: destinationList),
                  _buildtextFormField(context,
                      text: Languages.of(context).port,
                      inputText: Languages.of(context).port,
                      controller: portCtrl),
                  _buildtextFormField(context,
                      text: Languages.of(context).leadTime,
                      inputText: '000000000',
                      // margin: 60,
                      controller: leadTimeForInCtrl),
                  _buildtextFormField(context,
                      text: Languages.of(context).paymentTerm,
                      inputText: Languages.of(context).paymentTerm,
                      controller: paymentTermCtrl),
                ],
              ),
            ),
            buildCheckbox(1, text: Languages.of(context).check1),
            buildCheckbox(2, text: Languages.of(context).check2),
            Visibility(
                visible: showErrorMessage,
                child: Padding(
                  padding: const EdgeInsetsDirectional.only(top: 15),
                  child: Center(
                    child: Container(
                        width: MediaQuery.of(context).size.width * 0.8,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: defaultPrimaryBackgroundColor.withOpacity(0.5),
                        ),
                        child: Padding(
                            padding: EdgeInsets.only(
                                top: 10, right: 5.0, left: 5, bottom: 10),
                            child: Text(
                              Languages.of(context).termsConditions,
                              textAlign: TextAlign.center,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ))),
                  ),
                )),
            SizedBox(height: 10),
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
                      color: orangeColor,
                      child: Text(
                        Languages.of(context).submit,
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      onPressed: () {
                        if (_formKey.currentState.validate()) {
                          if (_checked1 != true || _checked2 != true)
                            setState(() => showErrorMessage = true);
                          else {
                            setState(() => showErrorMessage = false);
                            data['qty'] = quantityCrtl.text.trim();
                            data['product'] = productNameCtrl.text.trim();
                            data['details'] = detailsCrtl.text.trim();
                            data['other_requirements'] =
                                otherReqCtrl.text.trim();
                            data['ship_in'] = portCtrl.text.trim();
                            data['lead_time'] = leadTimeForInCtrl.text.trim();
                            data['payment_term'] = quantityCrtl.text.trim();
                            _quotationBloc.add(PostReqQuotation(
                                data: data, dataIdentifier: dataIdentifier));
                          }
                          print('dataSubmit: $data');
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

  Widget dropDownButton(BuildContext context,
      {String text, String dropText, List<String> dropList}) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(18, 20, 18, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Row(
              children: [
                Text(
                  '$text *',
                  style: TextStyle(
                      fontFamily: 'assets/fonts/Roboto-Light.ttf',
                      fontSize: 16,
                      color: (requiredList.contains(text))
                          ? Colors.red
                          : Colors.black),
                ),
              ],
            ),
          ),
          Container(
            child: DropdownButtonFormField<String>(
              itemHeight: 50,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Colors.white, width: 2.0),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(
                      color: Colors.white,
                      width: 2.0,
                    ),
                  ),
                  filled: true,
                  fillColor: Colors.white),
              isExpanded: true,
              items: dropList.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value,
                      style: TextStyle(color: Colors.black, fontSize: 14)),
                );
              }).toList(),
              onChanged: (dropDownVal) {
                setState(() {
                  String key;

                  if (dropText == Languages.of(context).dropCategory) {
                    key = 'category_id';
                    data[key] =
                        categoryIdList[categoryList.indexOf(dropDownVal)];
                  } else if (dropText == Languages.of(context).dropSourcing) {
                    key = 'sourcing';
                    data[key] = dropDownVal;
                  } else if (dropText == Languages.of(context).dropQuantity) {
                    key = 'pieces';
                    data[key] = piecesIdList[piecesList.indexOf(dropDownVal)];
                  } else if (dropText == Languages.of(context).dropTrade) {
                    key = 'trade';
                    data[key] = tradeIdList[tradeList.indexOf(dropDownVal)];
                  } else if (dropText ==
                      Languages.of(context).dropCertificate) {
                    key = 'certifications';
                    selecetedCert.add(dropDownVal);
                    selecetedCertId
                        .add(certIdList[certList.indexOf(dropDownVal)]);
                    selecetedCertBool = true;
                    data[key] =
                        selecetedCertId.toList().toString(); //selecetedCertId;
                  } else if (dropText == Languages.of(context).dropShipping) {
                    key = 'shipping_method';
                    data[key] =
                        shippingIdList[shippingList.indexOf(dropDownVal)];
                  } else if (dropText ==
                      Languages.of(context).dropDestination) {
                    key = 'destination';
                    data[key] = destinationCodeList[
                        destinationList.indexOf(dropDownVal)];
                  }
                });
              },
              hint: Text(
                dropDownVal != '' ? dropDownVal : dropText,
                style: TextStyle(
                  color: backTabColor.withOpacity(0.8),
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  setState(() {
                    requiredList.add(text);
                  });
                } else {
                  requiredList.remove(text);
                }
                return null;
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildtextFormField(BuildContext context,
      {String text,
      String inputText,
      double height = 0.07,
      int minLines,
      int maxLines,
      TextEditingController controller}) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(18, 20, 18, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Row(
              children: [
                Text(
                  '$text *',
                  style: TextStyle(
                      fontFamily: 'assets/fonts/Roboto-Light.ttf',
                      fontSize: 16,
                      color: requiredList.contains(text)
                          ? Colors.red
                          : Colors.black),
                ),
              ],
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * height,
            child: ConstrainedBox(
              constraints: BoxConstraints(minWidth: double.infinity),
              child: Padding(
                padding: const EdgeInsets.all(0),
                child: TextFormField(
                    expands: true,
                    controller: controller,
                    maxLines: null,
                    textAlignVertical: TextAlignVertical.top,
                    textInputAction: TextInputAction.next,
                    keyboardType: maxLines == null
                        ? TextInputType.multiline
                        : TextInputType.text,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        setState(() {
                          requiredList.add(text);
                        });
                      } else {
                        requiredList.remove(text);
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        fillColor: Colors.white,
                        focusColor: Colors.white,
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.white, width: 1.0),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(
                            color: Colors.white,
                            width: 2.0,
                          ),
                        ),
                        hintText: inputText,
                        hintStyle: TextStyle(
                          color: backTabColor.withOpacity(0.8),
                        ),
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        isDense: true,
                        filled: true),
                    style: TextStyle(
                      height: 2.0,
                    )),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> loadAssets() async {
    List<Asset> resultList = <Asset>[];
    String error = 'No Error Detected';

    try {
      resultList = await MultiImagePicker.pickImages(
        maxImages: 3,
        enableCamera: true,
        selectedAssets: images,
        cupertinoOptions: CupertinoOptions(takePhotoIcon: "chat"),
        materialOptions: MaterialOptions(
          actionBarColor: "#E16036",
          actionBarTitle: "Upload images",
          allViewTitle: "All Photos",
          useDetailsView: false,
          selectCircleStrokeColor: "#000000",
        ),
      );
    } on Exception catch (e) {
      error = e.toString();
    }

    if (!mounted) return;

    setState(() {
      images = resultList;
      _showImages = true;

      for (int i = 0; i < images.length; i++) {
        data['document[$i]'] = images[i].name;
        dataIdentifier['document[$i]'] = images[i].identifier;
      }
      // _error = error;
    });
  }
}

import 'dart:io';

import 'package:bawabtalsharq/Model/user_model.dart';
import 'package:bawabtalsharq/Utils/Localization/Language/Languages.dart';
import 'package:bawabtalsharq/Utils/constants.dart';
import 'package:bawabtalsharq/Utils/loading.dart';
import 'package:bawabtalsharq/Utils/styles.dart';
import 'package:bawabtalsharq/bloc/updateProfileBlocs/updateAccount/update_account_bloc.dart';
import 'package:bawabtalsharq/bloc/updateProfileBlocs/updateAccount/update_account_event.dart';
import 'package:bawabtalsharq/bloc/updateProfileBlocs/updateAccount/update_account_state.dart';
import 'package:bawabtalsharq/main.dart';
import 'package:bawabtalsharq/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';

class UpdateProfile extends StatefulWidget {
  @override
  _UpdateProfileState createState() => _UpdateProfileState();
}

class _UpdateProfileState extends State<UpdateProfile> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  String _phoneErrorMessage;

  UserLocal _currentUser;

  String firstNameError;
  String lastNameError;
  bool isLoading = false;

  UpdateAccountBloc _updateAccountBloc;

  File _image;
  final picker = ImagePicker();

  @override
  void initState() {
    // TODO: implement initState
    _updateAccountBloc = UpdateAccountBloc();
    _currentUser = Constants.getUserInfo2().data;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: appBarBuilder(
            title: Languages.of(context).myAccount,
            onBackPressed: () {
              Navigator.of(context).pop();
            }),
        body: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.only(
                  top: 30, left: 20, right: 20, bottom: 20),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      child: GestureDetector(
                        onTap: () {
                          getImage();
                        },
                        child: Stack(
                          children: [
                            Container(
                              child: Center(
                                child: Container(
                                  width: 96,
                                  height: 96,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                  ),
                                  child: _image == null
                                      ? ClipOval(
                                          child: Image(
                                            image:
                                                AssetImage(_currentUser.image),
                                            fit: BoxFit.fill,
                                          ),
                                        )
                                      : ClipOval(
                                          child: Image.file(
                                            _image,
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                ),
                              ),
                            ),
                            Positioned(
                                top: MediaQuery.of(context).size.width * 0.18,
                                right: MediaQuery.of(context).size.width * 0.32,
                                child: Container(
                                  width: 30,
                                  height: 30,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: Color(0xffffffff),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Color(0x29464545),
                                          offset: Offset(0, 1),
                                          blurRadius: 6,
                                          spreadRadius: 0)
                                    ],
                                  ),
                                  child: Icon(
                                    Icons.camera_alt,
                                    color: BaseOrange,
                                    size: 22,
                                  ),
                                ))
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 35,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: textFiledPrice(
                            context,
                            Languages.of(context).firstName,
                            width: .50,
                            errorMessage: firstNameError,
                            controller: firstNameController,
                          ),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Expanded(
                          child: textFiledPrice(
                              context, Languages.of(context).lasttNam,
                              width: .50,
                              errorMessage: lastNameError,
                              controller: lastNameController),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    textFiledPrice(
                      context,
                      Languages.of(context).tel,
                      width: 1,
                      errorMessage: _phoneErrorMessage,
                      controller: phoneController,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    BlocBuilder<UpdateAccountBloc, UpdateAccountState>(
                      bloc: _updateAccountBloc,
                      builder: (context, state) {
                        if (state is UpdateAccountLoadingState) {
                          if (!isLoading) {
                            LoadingLogo();
                            isLoading = true;
                          }
                        } else if (state is UpdateAccountLoadedState) {
                          print('loaded');
                          _updateAccountBloc.add(ResetState());
                          isLoading = false;
                          if (state.response.code == 200) {
                            showToast(text: "Update Successful");
                            SchedulerBinding.instance.addPostFrameCallback((_) {
                              Navigator.pushReplacementNamed(
                                  context, ScreenRoutes.mainScreen);
                            });
                          } else {
                            showToast(
                                text: state.response.msg,
                                toastGravity: ToastGravity.SNACKBAR);
                          }
                        }
                        return signInFlatButton(
                            context,
                            MediaQuery.of(context).size.height,
                            Languages.of(context).saveChange, () {
                          FocusScope.of(context).unfocus();
                          firstNameError = null;
                          lastNameError = null;
                          _phoneErrorMessage = null;
                          setState(() {
                            if (firstNameController.text.isEmpty)
                              firstNameError = 'Empty Field';
                            else if (lastNameController.text.isEmpty)
                              lastNameError = 'Empty Field';
                            else if (phoneController.text.isEmpty)
                              _phoneErrorMessage = 'Empty Field';
                            else if (_image == null) {
                              Scaffold.of(context).showSnackBar(SnackBar(
                                  content: Text('Please Select Image')));
                            } else {
                              _currentUser.firstname = firstNameController.text;
                              _currentUser.lastname = lastNameController.text;
                              _currentUser.phone = phoneController.text;
                              _updateAccountBloc.add(
                                UpdateEvent(_currentUser, image: _image),
                              );
                            }
                          });
                        }, widthOfBtn: 1);
                      },
                    )
                  ])),
        ));
  }

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }
}

// upload(File imageFile) async {
//   // open a bytestream
//   var stream =
//       new http.ByteStream(DelegatingStream.typed(imageFile.openRead()));
//   // get file length
//   var length = await imageFile.length();
//
//   // string to uri
//   var uri = Uri.parse("http://ip:8082/composer/predict");
//
//   // create multipart request
//   var request = new http.MultipartRequest("POST", uri);
//
//   // multipart that takes file
//   var multipartFile = new http.MultipartFile('file', stream, length,
//       filename: basename(imageFile.path));
//
//   // add file to multipart
//   request.files.add(multipartFile);
//
//   // send
//   var response = await request.send();
//   print(response.statusCode);
//
//   // listen for response
//   response.stream.transform(utf8.decoder).listen((value) {
//     print(value);
//   });
// }

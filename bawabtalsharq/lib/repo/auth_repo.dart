import 'dart:async';
import 'dart:convert';

import 'package:bawabtalsharq/Model/user_model.dart';
import 'package:bawabtalsharq/Utils/apis.dart';
import 'package:http/http.dart' as http;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepo {
  String verficationId;
  bool codeSent = false;

  // start Bahaa //
  Future<UserModel> doLogin(String email, String password) async {
    Map<String, dynamic> params = {"email": email, "password": password};
    var response = await http.post(
      Uri.encodeFull(APIS.serverURL + APIS.LOGIN_API),
      body: params,
    );
    if (response.statusCode == 200) {
      var decodedResponse = json.decode(response.body);
      UserModel modelResponse = UserModel.fromJson(decodedResponse);

      final SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('user', jsonEncode(modelResponse));

      return modelResponse;
    }
  }

  Future<UserModel> doRegister(String phone, String email, String password,
      String name, String userType) async {
    Map<String, dynamic> params = {
      "phone": phone,
      "email": email,
      "name": name,
      "password": password,
      "user_type": userType,
      "company": '',
      "website": '',
      "plan": '',
    };
    var response = await http.post(
      Uri.encodeFull(APIS.serverURL + APIS.REGISTER_API),
      body: params,
    );

    if (response.statusCode == 200) {
      var decodedResponse = json.decode(response.body);
      UserModel modelResponse = UserModel.fromJson(decodedResponse);

      final SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('user', jsonEncode(modelResponse));

      return modelResponse;
    }
  }
// End Bahaa //

// Start Asmaa //

  Future<dynamic> verifyPhone(phone) async {
    var complete = Completer();
    final PhoneCodeAutoRetrievalTimeout autoRetrieve = (String verId) {
      verficationId = verId;
      print('Phone Code TimeOut');
    };

    final PhoneCodeSent smsCodeSent = (String verId, [int forceCodeResend]) {
      this.verficationId = verId;
      this.codeSent = true;

      complete.complete({'verId': this.verficationId});
    };

    final PhoneVerificationCompleted verifiedSuccess =
        (AuthCredential authResult) {
      // AuthService().signIn(authResult);
      print('verfied Success');
    };

    final PhoneVerificationFailed verifiedFailed =
        (FirebaseAuthException authException) {
      complete.complete({'e': authException.message});
    };

    try {
      await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: phone,
        codeSent: smsCodeSent,
        codeAutoRetrievalTimeout: autoRetrieve,
        timeout: const Duration(seconds: 5),
        verificationCompleted: verifiedSuccess,
        verificationFailed: verifiedFailed,
      );
    } on FirebaseAuthException catch (e) {
      complete.complete({'e': e.toString()});
    }

    return complete.future;
  }

  String signInWithOTP(smsCode, verId) {
    String op;
    try {
      AuthCredential authCreds =
          PhoneAuthProvider.credential(smsCode: smsCode, verificationId: verId);
      FirebaseAuth.instance.signInWithCredential(authCreds);
      op = 'Verified Succefully';
    } on FirebaseAuthException catch (e) {
      op = e.toString();
    }
    return op;
  }

// End Asmaa //
}

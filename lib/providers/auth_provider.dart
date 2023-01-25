// ignore_for_file: unused_field, unused_local_variable

import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sheraa/models/age.dart';
import 'package:sheraa/models/auth_user.dart';
import 'package:sheraa/models/country.dart';
import 'package:sheraa/networking/api_provider.dart';
import 'package:sheraa/shared_preferences/shared_preferences_helper.dart';
import 'package:sheraa/utils/commons.dart';
import 'package:sheraa/utils/urls.dart';

class AuthProvider extends ChangeNotifier {
  // current language from shared prefernces 'ar' or 'en'
  String? _currentLang;
  ApiProvider _apiProvider = ApiProvider();
  void setCurrentLanguage(String currentLang) {
    _currentLang = currentLang;
    notifyListeners();
  }

  String get currentLang => _currentLang!;

  late String verificationId;

  Future<void> submitPhoneNumber(String phoneNumber) async {
    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: '+2$phoneNumber',
        timeout: const Duration(seconds: 14),
        verificationCompleted: verificationCompleted,
        verificationFailed: verificationFailed,
        codeSent: codeSent,
        codeAutoRetrievalTimeout: codeAutoRetrievalTimeout);
  }

  void verificationCompleted(PhoneAuthCredential credential) async {
    print("verificationCompleted");
    await signIn(credential);
  }

  void verificationFailed(FirebaseAuthException error) {
    print("verificationFailed :${error.toString()}");
  }

  void codeSent(String verificationId, int? resendToken) {
    this.verificationId = verificationId;
    print("codeSent");
  }

  void codeAutoRetrievalTimeout(String verificationId) {
    print("codeAutoRetrievalTimeout");
  }

  Future<void> submitOTP(String otpCode) async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId, smsCode: otpCode);
    await signIn(credential);
  }

  Future<void> signIn(PhoneAuthCredential credential) async {
    try {
      await FirebaseAuth.instance.signInWithCredential(credential);
      print("phoneOtpVerified");
    } catch (error) {
      print("error: ${error.toString()}");
    }

    Future<void> logOut() async {
      await FirebaseAuth.instance.signOut();
    }

    User loggedInUser() {
      return FirebaseAuth.instance.currentUser!;
    }
  }

  Country? _country;

  void setCurrentCountry(Country currentCountry) {
    _country = currentCountry;
    notifyListeners();
  }

  Country get currentCountry => _country!;

  String? _gender;

  void setGender(String gender) {
    _gender = gender;
    notifyListeners();
  }

  String get gender => _gender!;

  Age? _ageCategory;

  void setAgeCategory(Age ageCategory) {
    _ageCategory = ageCategory;
    notifyListeners();
  }

  Age get ageCategory => _ageCategory!;

  String? _userToken;

  void setUserToken(String token) {
    _userToken = token;
    notifyListeners();
  }

  String get userToken => _userToken!;

  AuthUser? _currentUser;

  void setCurrentUser(AuthUser currentUser) {
    _currentUser = currentUser;
    notifyListeners();
  }

  AuthUser? get currentUser => _currentUser;

  bool _isSwitched = false;
  void setSwitcher(bool isSwitched) {
    _isSwitched = !_isSwitched;
    notifyListeners();
  }

  bool get isSwitched => _isSwitched;
  String? _activationEmail;

  void setActivationEmail(String email) {
    _activationEmail = email;
    notifyListeners();
  }

  String get activationEmail => _activationEmail!;

  int? _userId;

  void setUserId(int id) {
    _userId = id;
    notifyListeners();
  }

  int get userId => _userId!;

  bool _verificationCodeError = false;

  void setVerificationCodeError(bool value) {
    _verificationCodeError = value;
    notifyListeners();
  }

  bool get verificationCodeError => _verificationCodeError;

  Future<bool> getUserProfileData(BuildContext context) async {
    AuthUser? authUser;
    bool result = false;
    final response = await _apiProvider.get(Urls.USER_PROFILE_URL, header: {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      "Accept-Language": currentLang,
      'Authorization': 'Bearer $userToken'
    });

    print(response['status_code']);
    print(response);
    if (response['status_code'] == 200) {
      print(response);
      result = true;
      //authUser = AuthUser.fromJson(response['response']['data']);
      setCurrentUser(AuthUser.fromJson(response['response']['data']));
      SharedPreferencesHelper.save("user", currentUser);
      print(currentUser!.name);
      notifyListeners();
    } else if (response['status_cod'] == 422) {
      Commons.showError(
          context: context, message: response['response']['message']);
    }
    return result;
  }

  void logoutUser(BuildContext context) async {
    final result = await _apiProvider.post(Urls.LOGOUT_URL, header: {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      "Accept-Language": currentLang,
      'Authorization': 'Bearer $userToken'
    });
    if (result['status_code'] == 200) {
      print("logout");
    } else if (result['status_code'] == 401) {
      Navigator.pop(context);
      SharedPreferencesHelper.remove("user");
      SharedPreferencesHelper.remove('token');
      print(result);
    }
  }
}

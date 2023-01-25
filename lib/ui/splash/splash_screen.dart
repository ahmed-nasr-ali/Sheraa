import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sheraa/custom_widgets/safe_area/page_container.dart';
import 'package:sheraa/models/age.dart';
import 'package:sheraa/models/auth_user.dart';
import 'package:sheraa/models/country.dart';
import 'package:sheraa/providers/auth_provider.dart';
import 'package:sheraa/shared_preferences/shared_preferences_helper.dart';
import 'package:sheraa/shared_preferences/user_information_data.dart';
import 'package:sheraa/utils/app_colors.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:percent_indicator/percent_indicator.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
//from ahmed version 2
}

class _SplashScreenState extends State<SplashScreen> {
  double _height = 0, _width = 0;
  AuthProvider? _authProvider;

  bool _initalRun = true;

  Future initData() async {
    await Future.delayed(Duration(seconds: 2));
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_initalRun) {
      _authProvider = Provider.of<AuthProvider>(context);
      _getLanguage();
      initData().then((value) async {
       // _checkIsFirstTime();
        //   await _checkIsLogin();
        await _getSavedData();
        //Navigator.pushNamed(context, '/choose_language');
      });

      _initalRun = false;
    }
  }

  Future<void> _getSavedData() async {
    var gender = await SharedPreferencesHelper.getUserGender();

    print("gender  :)  ${UserData.getUserGender()}");

    print('gender:$gender');
    _authProvider!.setGender(gender);
    var country = await SharedPreferencesHelper.read("country");
    print("Country is:$country");
    if (country != null) {
      _authProvider!.setCurrentCountry(Country.fromJson(country));
    }
    var age = await SharedPreferencesHelper.read("age");
    if (age != null) {
      _authProvider!.setAgeCategory(Age.fromJson(age));
    }
  }



  Future<Null> _checkIsFirstTime() async {
    var _firstTime = await SharedPreferencesHelper.checkIsFirstTime();
    var _user = await SharedPreferencesHelper.read("user");
    String? token = await SharedPreferencesHelper.getUsersetUserToken();
    print("token in shared is:$token");
    if (_firstTime) {
      SharedPreferencesHelper.setIsFirstTime(false);
      Navigator.pushReplacementNamed(context, '/choose_language');
    } else {
      SharedPreferencesHelper.setIsFirstTime(false);
      if (_user != null) {
        _authProvider!.setCurrentUser(AuthUser.fromJson(_user));
        _authProvider!.setUserToken(token!);

      }else{
        print("not set a user");
      }
      Navigator.pushReplacementNamed(context, '/bottom_navigation');
    }

    print("is First time$_firstTime");
  }

  Future<void> _getLanguage() async {
    String currentLang = await SharedPreferencesHelper.getUserLang();

    _authProvider!.setCurrentLanguage(currentLang);
    print('current language: ' + currentLang);
    // print('lang' + _authProvider.currentLang);
  }

  @override
  void initState() {
    super.initState();
    initData().then((value) {
      _getLanguage();

      //   _checkIsLogin();
    });
  }

  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;

    return PageContainer(
        child: Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/logo.png',
              fit: BoxFit.cover,
              height: 100,
            ),
            SizedBox(
              height: 100,
            ),
            Padding(
              padding: EdgeInsets.all(15.0),
              child: new LinearPercentIndicator(
                width: MediaQuery.of(context).size.width - 50,
                animation: true,
                lineHeight: 12.0,
                animationDuration: 800,
                percent: 1,
                progressColor: mainAppColor,
                backgroundColor: secondryMainColor,
                isRTL: true,
                barRadius: Radius.circular(15),
                onAnimationEnd: () async{
                  // Navigator.pushNamed(context, '/choose_language');
                   _checkIsFirstTime();
                  //print("end");
                },
              ),
            ),
          ],
        ),
      ),
    ));
  }
}

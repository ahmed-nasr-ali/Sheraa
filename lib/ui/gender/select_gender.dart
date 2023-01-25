import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:sheraa/shared_preferences/user_information_data.dart';
import 'package:sheraa/custom_widgets/buttons/custom_button.dart';
import 'package:sheraa/custom_widgets/custom_container/custom_container.dart';
import 'package:sheraa/custom_widgets/no_data/no_data.dart';
import 'package:sheraa/custom_widgets/safe_area/page_container.dart';
import 'package:sheraa/locale/app_localizations.dart';
import 'package:sheraa/models/age.dart';
import 'package:sheraa/providers/auth_provider.dart';
import 'package:sheraa/providers/countries_provider.dart';
import 'package:sheraa/shared_preferences/shared_preferences_helper.dart';
import 'package:sheraa/ui/bottom_navigation/bottom_navigation.dart';
import 'package:sheraa/utils/app_colors.dart';
import 'package:sheraa/utils/error.dart';

class SelectGenderScreen extends StatefulWidget {
  const SelectGenderScreen({Key? key}) : super(key: key);

  @override
  _SelectGenderScreenState createState() => _SelectGenderScreenState();
}

class _SelectGenderScreenState extends State<SelectGenderScreen> {
  double _width = 0, _height = 0;
  int? selectedIndex;
  bool _isMale = false, _isFemale = false;
  bool genderSelected = false;
  bool genderNotSelected = false;
  bool ageSelected = false;
  bool ageNotSelected = false;
  AuthProvider? _authProvider;
  Future<List<Age>>? _agesGroup;
  bool initialRun = true;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (initialRun) {
      _agesGroup = Provider.of<CountriesProvider>(context, listen: false)
          .getAgesList(context);

      initialRun = false;
    }
  }

  Widget bodyContent() {
    return ListView(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: _width * 0.5,
                  height: _height * 0.2,
                  child: CustomContainer(
                    hasHorizontalMargin: true,
                    selectedColor: _isMale ? mainAppColor : accentColor,
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          if (!_isMale) {
                            _isMale = true;
                            _isFemale = false;
                            genderSelected = true;
                            genderNotSelected = false;
                          }
                        });
                        SharedPreferencesHelper.setUserGender('male');
                        UserData.setUserGender("male");
                        print("=================================");
                        print(UserData.getUserGender());

                        _authProvider!.setGender('male');
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset('assets/images/MAN.png'),
                          Text(AppLocalizations.of(context)!.translate('male'))
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  width: _width * 0.5,
                  height: _height * 0.2,
                  child: CustomContainer(
                    hasHorizontalMargin: true,
                    selectedColor: _isFemale ? mainAppColor : accentColor,
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          if (!_isFemale) {
                            _isMale = false;
                            _isFemale = true;
                            genderSelected = true;
                            genderNotSelected = false;
                          }
                        });
                        SharedPreferencesHelper.setUserGender('female');
                        UserData.setUserGender("female");
                        print("=================================");
                        print(UserData.getUserGender());

                        _authProvider!.setGender('female');
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset('assets/images/women.png'),
                          Text(
                              AppLocalizations.of(context)!.translate('female'))
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            genderNotSelected
                ? Container(
                    child: Text(
                      AppLocalizations.of(context)!
                          .translate("gender_validation"),
                      style: TextStyle(color: Colors.redAccent),
                    ),
                  )
                : Container(),
            SizedBox(
              height: 20,
            ),
            Text(
              AppLocalizations.of(context)!.translate('age_category'),
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 200,
              child: FutureBuilder<List<Age>>(
                future: _agesGroup,
                builder: (context, snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.none:
                      return Center(
                        child: SpinKitPulse(color: mainAppColor),
                      );
                    case ConnectionState.active:
                      return Text('');
                    case ConnectionState.waiting:
                      return Center(
                        child: SpinKitFadingCircle(color: mainAppColor),
                      );
                    case ConnectionState.done:
                      if (snapshot.hasError)
                        return Error(
                          errorMessage:
                              AppLocalizations.of(context)!.translate('error'),
                          onRetryPressed: () {},
                        );
                      else {
                        if (snapshot.data!.length > 0)
                          return ListView.builder(
                              shrinkWrap: true,
                              itemCount: snapshot.data!.length,
                              itemBuilder: (context, index) {
                                return CustomContainer(
                                  width: _width * 0.8,
                                  height: _height * 0.07,
                                  hasHorizontalMargin: true,
                                  selectedColor: selectedIndex == index
                                      ? mainAppColor
                                      : accentColor,
                                  child: InkWell(
                                    onTap: () {
                                      setState(() {
                                        selectedIndex = index;
                                      });
                                      UserData.setAgeId(
                                          snapshot.data![index].id!);
                                      print(
                                          '======================================');
                                      print(UserData.getAgeId());
                                      SharedPreferencesHelper.save(
                                          "age", snapshot.data![index]);
                                      _authProvider!.setAgeCategory(
                                          snapshot.data![index]);
                                      setState(() {
                                        ageSelected = true;
                                        ageNotSelected = false;
                                      });
                                    },
                                    child: Row(
                                      children: [
                                        Image.asset(
                                          'assets/images/checkbox.png',
                                          color: selectedIndex == index
                                              ? mainAppColor
                                              : grayColor,
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          snapshot.data![index].groupName ==
                                                  null
                                              ? "text"
                                              : snapshot
                                                  .data![index].groupName!,
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              });
                        else
                          return Center(
                            child: NoData(
                                message: AppLocalizations.of(context)!
                                    .translate('no_results')),
                          );
                      }
                  }
                  return Center(
                    child: SpinKitFadingCircle(color: mainAppColor),
                  );
                },
              ),
            ),
            ageNotSelected
                ? Container(
                    child: Text(
                      AppLocalizations.of(context)!.translate("age_validation"),
                      style: TextStyle(color: Colors.redAccent),
                    ),
                  )
                : Container(),
            SizedBox(
              height: 10,
            ),
            CustomButton(
              btnLbl: AppLocalizations.of(context)!.translate(
                "continue",
              ),
              enableHorizontalMargin: true,
              enableVerticalMargin: true,
              enableCircleBorder: true,
              onPressedFunction: () {
                if (!genderSelected) {
                  print("select gender");
                  setState(() {
                    genderNotSelected = true;
                  });
                }
                if (!ageSelected) {
                  setState(() {
                    ageNotSelected = true;
                  });
                } else {
                  print("selected");
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (_) => BottomNavigation()),
                      (route) => false);
                  // Navigator.pushNamed(context, '/bottom_navigation');
                }
              },
              btnColor: mainAppColor,
              btnStyle: TextStyle(color: whiteColor),
              borderColor: mainAppColor,
              height: _height * 0.067,
              width: _width * 0.8,
            )
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;
    _authProvider = Provider.of<AuthProvider>(context);

    return PageContainer(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: whiteColor,
          elevation: 0,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              size: 20,
            ),
            color: blackColor,
            onPressed: () => Navigator.pop(context),
          ),
          centerTitle: true,
          title: Text(
            AppLocalizations.of(context)!.translate('choose_gender'),
            textAlign: TextAlign.center,
            style: TextStyle(
                color: blackColor, fontSize: 18, fontWeight: FontWeight.bold),
          ),
          actions: [
            Container(
              padding: EdgeInsets.all(12),
              child: InkWell(
                onTap: () {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (_) => BottomNavigation()),
                      (route) => false);
                  // Navigator.pushReplacementNamed(context, '/bottom_navigation');
                },
                child: Text(
                  AppLocalizations.of(context)!.translate('skip'),
                  style: TextStyle(color: blackColor),
                ),
              ),
            )
          ],
        ),
        body: bodyContent(),
      ),
    );
  }
}

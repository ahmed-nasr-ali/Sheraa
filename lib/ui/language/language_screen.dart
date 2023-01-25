import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sheraa/shared_preferences/user_information_data.dart';
import 'package:sheraa/custom_widgets/connectivity/network_indicator.dart';
import 'package:sheraa/custom_widgets/custom_container/custom_container.dart';
import 'package:sheraa/custom_widgets/safe_area/page_container.dart';
import 'package:sheraa/locale/app_localizations.dart';
import 'package:sheraa/locale/locale_helper.dart';
import 'package:sheraa/providers/auth_provider.dart';
import 'package:sheraa/shared_preferences/shared_preferences_helper.dart';
import 'package:sheraa/utils/app_colors.dart';

class ChooseLanguageScreen extends StatefulWidget {
  const ChooseLanguageScreen({Key? key}) : super(key: key);

  @override
  _ChooseLanguageScreenState createState() => _ChooseLanguageScreenState();
}

class _ChooseLanguageScreenState extends State<ChooseLanguageScreen> {
  double? _height, _width;
  bool _isArabic = false;
  bool _isEnglish = false;
  AuthProvider? _authProvider;
  bool intialRun = true;

  @override
  void didChangeDependencies() {
    if (intialRun) {
      _authProvider = Provider.of<AuthProvider>(context);

      intialRun = false;
    }
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;
    return NetworkIndicator(
        child: PageContainer(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                AppLocalizations.of(context)!.translate('choose_lang'),
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                AppLocalizations.of(context)!.translate('select_lang'),
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(
                height: 50,
              ),
              CustomContainer(
                width: _width! * 0.9,
                height: _height! * .075,
                hasHorizontalMargin: true,
                selectedColor: _isArabic ? mainAppColor : accentColor,
                child: InkWell(
                  onTap: () {
                    setState(() {
                      if (!_isArabic) {
                        _isArabic = true;
                        _isEnglish = false;
                        SharedPreferencesHelper.setUserLang('ar');
                        SharedPreferencesHelper.setIsFirstTime(false);
                        helper.onLocaleChanged(new Locale('ar'));
                        _authProvider!.setCurrentLanguage('ar');
                        Navigator.pushReplacementNamed(
                            context, '/choose_country');
                        UserData.setUserLang("ar");
                      }
                    });
                  },
                  child: Center(
                    child: Text(
                      AppLocalizations.of(context)!.translate('arabic'),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
              CustomContainer(
                width: _width! * 0.9,
                height: _height! * .075,
                hasHorizontalMargin: true,
                selectedColor: _isEnglish ? mainAppColor : accentColor,
                child: InkWell(
                  onTap: () {
                    setState(() {
                      if (!_isEnglish) {
                        _isArabic = false;
                        _isEnglish = true;
                      }
                    });
                    SharedPreferencesHelper.setUserLang('en');
                    helper.onLocaleChanged(new Locale('en'));
                    _authProvider!.setCurrentLanguage('en');
                    Navigator.pushReplacementNamed(context, '/choose_country');
                    UserData.setUserLang("en");
                    SharedPreferencesHelper.setIsFirstTime(false);
                  },
                  child: Center(
                    child: Text(
                      AppLocalizations.of(context)!.translate('english'),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }
}

// ignore_for_file: must_be_immutable, unused_local_variable, unused_field

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';

import 'package:sheraa/custom_widgets/TextStyle/small_text.dart';
import 'package:sheraa/custom_widgets/buttons/custom_button.dart';
import 'package:sheraa/custom_widgets/snakbar%20widget/snakbar.dart';
import 'package:sheraa/locale/app_localizations.dart';
import 'package:sheraa/networking/api%20error/error%20403/403_error.dart';
import 'package:sheraa/networking/api%20error/server%20error/server_error.dart';
import 'package:sheraa/providers/navigation_provider.dart';
import 'package:sheraa/shared_preferences/user_information_data.dart';
import 'package:sheraa/ui/bottom_navigation/bottom_navigation.dart';
import 'package:sheraa/utils/app_colors.dart';
import 'package:sheraa/utils/urls.dart';

import '../new/presentation/pages/my ads screen/my_ads_Screen.dart';

class DeleteAdScreen extends StatefulWidget {
  int adId;
  final Function onPressedFunction;
  DeleteAdScreen({
    Key? key,
    required this.adId,
    required this.onPressedFunction,
  }) : super(key: key);

  @override
  State<DeleteAdScreen> createState() => _DeleteAdScreenState();
}

class _DeleteAdScreenState extends State<DeleteAdScreen> {
  double? _width;

  double? _height;

  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    _width = MediaQuery.of(context).size.width;
    _height = MediaQuery.of(context).size.height;

    return Column(
      children: [
        Expanded(child: Container()),
        Container(
          height: _height! / 162.4, //5
          width: _width! / 9.375, //40
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(_height! / 162.4 // 5
                ),
            color: Color(0xFFEFEFEF),
          ),
        ),
        SizedBox(
          height: _height! / 81.2, //10
        ),
        _isLoading
            ? Container(
                width: _width!,
                height: _height! / 3.866666666666667, //210
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(_height! / 32.48), //25
                    topRight: Radius.circular(_height! / 32.48), //25
                  ),
                ),
                child: Center(child: SpinKitFadingCircle(color: mainAppColor)),
              )
            : Container(
                width: _width!,
                child: Container(
                  padding: EdgeInsets.only(
                    left: _width! / 18.75, //20
                    right: _width! / 18.75, //20
                    top: _height! / 40.6, //20
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(_height! / 32.48), //25
                      topRight: Radius.circular(_height! / 32.48), //25
                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: _height! / 23.2, //35
                      ),
                      Image.asset("assets/images/delete.png"),
                      SizedBox(
                        height: _height! / 81.2, //10
                      ),
                      SmallText(
                        size: _height! / 58,
                        typeOfFontWieght: 1,
                        color: blackColor,
                        text: AppLocalizations.of(context)!
                            .translate("Delete Ad"),
                      ),
                      SizedBox(
                        height: _height! / 32.48, //25
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomButton(
                              enableVerticalMargin: false,
                              enableHorizontalMargin: false,
                              width: _width! / 3.260869565217391, //115
                              height: _height! / 20.3, //35
                              btnLbl: AppLocalizations.of(context)!
                                  .translate("Not Sold"),
                              onPressedFunction: widget.onPressedFunction,
                              btnColor: whiteColor,
                              btnStyle: TextStyle(
                                color: mainAppColor,
                                fontSize: _height! / 58,
                              ),
                              borderColor: mainAppColor),
                          SizedBox(
                            width: _width! / 53.57142857142857, //7
                          ),
                          CustomButton(
                              enableVerticalMargin: false,
                              enableHorizontalMargin: false,
                              width: _width! / 3.260869565217391, //115
                              height: _height! / 20.6, //35
                              btnLbl: AppLocalizations.of(context)!
                                  .translate("sold"),
                              onPressedFunction: widget.onPressedFunction,
                              btnColor: mainAppColor,
                              btnStyle: TextStyle(
                                color: whiteColor,
                                fontSize: _height! / 58,
                              ),
                              borderColor: mainAppColor),
                        ],
                      ),
                      SizedBox(
                        height: _height! / 22.55555555555556, //36
                      )
                    ],
                  ),
                ),
              ),
      ],
    );
  }

  deleteAdMethod() async {
    final navigatonBarScreen =
        Provider.of<NavigationProvider>(context, listen: false);

    final homeServerError =
        Provider.of<HomeServerError>(context, listen: false);

    final erro403 = Provider.of<Error403>(context, listen: false);

    setState(() {
      _isLoading = true;
    });
    final response = await post(
        Uri.parse(
          "${Urls.GET_DELETE_AD_URL}${widget.adId}",
        ),
        headers: <String, String>{
          'Accept': 'application/json',
          "Accept-Language": UserData.getUSerLang(),
          'Content-Type': 'application/json',
          "Authorization": "Bearer ${UserData.getUserApiToken()}"
        });

    if (response.statusCode == 200) {
      setState(() {
        navigatonBarScreen.upadateNavigationIndex(4);
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => BottomNavigation()),
            (route) => false);
        Navigator.push(
            context, MaterialPageRoute(builder: (_) => MyAdsScreen()));

        snakBarWidget(
            context: context,
            content: AppLocalizations.of(context)!
                .translate("Delete Ad successfully"));
      });
    } else if (response.statusCode == 401) {
      setState(() {
        navigatonBarScreen.upadateNavigationIndex(4);
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => BottomNavigation()),
            (route) => false);

        snakBarWidget(
            context: context,
            content:
                AppLocalizations.of(context)!.translate("login_register_des"));
      });
    } else if (response.statusCode == 422) {
      Navigator.of(context).popUntil((route) => route.isFirst);

      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              backgroundColor: mainAppColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25)),
              title: SmallText(
                size: 12,
                color: blackColor,
                text: AppLocalizations.of(context)!
                    .translate("There is an internet connection error"),
                typeOfFontWieght: 1,
              ),
            );
          });
    } else if (response.statusCode == 403) {
      Navigator.of(context).popUntil((route) => route.isFirst);
    } else {
      setState(() {
        homeServerError.serverError(context, response.statusCode);
      });
    }
  }
}

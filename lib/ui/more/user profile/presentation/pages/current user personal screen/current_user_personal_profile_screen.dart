// ignore_for_file: unused_field, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:sheraa/custom_widgets/TextStyle/small_text.dart';
import 'package:sheraa/custom_widgets/buttons/custom_button.dart';
import 'package:sheraa/custom_widgets/connectivity/network_indicator.dart';
import 'package:sheraa/custom_widgets/custom_text_form_field/custom_text_form_field.dart';
import 'package:sheraa/custom_widgets/safe_area/page_container.dart';
import 'package:sheraa/custom_widgets/snakbar%20widget/snakbar.dart';
import 'package:sheraa/locale/app_localizations.dart';
import 'package:sheraa/shared_preferences/user_information_data.dart';
import 'package:sheraa/ui/more/user%20profile/domin/entity/user_entity.dart';
import 'package:sheraa/ui/more/user%20profile/presentation/controller/update_current_user_date_controller.dart';
import 'package:sheraa/ui/more/user%20profile/presentation/widgets/current%20user%20personal%20profile%20widgets/phone_number_country_code.dart';
import 'package:sheraa/ui/more/user%20profile/presentation/widgets/current%20user%20personal%20profile%20widgets/user_image.dart';

import 'package:sheraa/utils/app_colors.dart';

import '../../widgets/current user personal profile widgets/choose_gender.dart';
import '../../widgets/current user personal profile widgets/group_age.dart';

class CurrentUserPersonalProfileScreen extends StatefulWidget {
  UserEntity userDetails;
  CurrentUserPersonalProfileScreen({
    Key? key,
    required this.userDetails,
  }) : super(key: key);

  @override
  State<CurrentUserPersonalProfileScreen> createState() =>
      _CurrentUserPersonalProfileScreenState();
}

class _CurrentUserPersonalProfileScreenState
    extends State<CurrentUserPersonalProfileScreen> {
  TextEditingController _userFristName = TextEditingController();

  TextEditingController _userFamilyName = TextEditingController();

  TextEditingController _userEmailAdress = TextEditingController();

  List<dynamic> _groupAge = [];

  bool _isLoading = false;

  double? _height;

  double? _width;

  @override
  void initState() {
    super.initState();

    _userFristName.text = widget.userDetails.name ?? "";

    _userFamilyName.text = "";

    _userEmailAdress.text = widget.userDetails.email ?? "";
  }

  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;

    _width = MediaQuery.of(context).size.width;

    return NetworkIndicator(
      child: PageContainer(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            elevation: 0,
            centerTitle: true,
            leading: IconButton(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Image.asset("assets/images/arrow_simple_chock.png")),
            title: SmallText(
                color: blackColor,
                size: _height! / 50.75, //16
                typeOfFontWieght: 1,
                text: AppLocalizations.of(context)!
                    .translate("Profile personly")),
          ),
          body: _isLoading
              ? SpinKitFadingCircle(color: mainAppColor)
              : ListView(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: _height! / 162.4, //5
                        ),
                        Divider(
                          height: 0,
                          color: containerColor,
                        ),
                        UserImage(
                          userImage: widget.userDetails.avatar ?? "",
                        ),
                        SizedBox(
                          height: _height! / 27.06666666666667, //30
                        ),
                        CustomTextFormField(
                          topPadding: _height! / 162.4, //5
                          horizontalMargin: _width! / 23.4375, //16
                          textColor: textGrayColor,
                          labelColor: blackColor,
                          containerUnselectedColor: whiteColor,
                          contentPadding: _width! / 25, //15
                          controller: _userFristName,
                          hasHorizontalMargin: true,
                          enableBorder: false,
                          enabled: true,
                          inputData: TextInputType.text,
                          isPassword: false,
                          maxLines: 1,
                          readOnly: false,
                          labelText: AppLocalizations.of(context)!
                              .translate("first_name"),
                          hintTxt: widget.userDetails.name,
                        ),
                        SizedBox(
                          height: _height! / 81.2, //10
                        ),
                        CustomTextFormField(
                          topPadding: _height! / 162.4, //5
                          horizontalMargin: _width! / 23.4375, //16
                          textColor: textGrayColor,
                          labelColor: blackColor,
                          containerUnselectedColor: whiteColor,
                          contentPadding: _width! / 25, //15
                          controller: _userFamilyName,
                          hasHorizontalMargin: true,
                          enableBorder: false,
                          enabled: true,
                          inputData: TextInputType.text,
                          isPassword: false,
                          maxLines: 1,
                          readOnly: false,
                          labelText: AppLocalizations.of(context)!
                              .translate("second_name"),
                        ),
                        SizedBox(
                          height: _height! / 81.2, //10
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: _width! / 22.05882352941176, //16
                            ),
                            Image.asset("assets/images/link.png"),
                            SizedBox(
                              width: _width! / 75, //5
                            ),
                            SmallText(
                              text: UserData.getUSerLang() == "ar"
                                  ? "15487885/"
                                  : "https://sheraa.net/m",
                              color: UserData.getUSerLang() == "ar"
                                  ? mainAppColor
                                  : blackColor,
                              size: _height! / 58,
                            ),
                            SmallText(
                              text: UserData.getUSerLang() == "ar"
                                  ? "https://sheraa.net/m"
                                  : "15487885/",
                              color: UserData.getUSerLang() == "ar"
                                  ? blackColor
                                  : mainAppColor,
                              size: _height! / 58,
                            )
                          ],
                        ),
                        SizedBox(
                          height: _height! / 54.13333333333333, //15
                        ),
                        CustomTextFormField(
                          topPadding: _height! / 162.4, //5
                          horizontalMargin: _width! / 23.4375, //16
                          textColor: textGrayColor,
                          labelColor: blackColor,
                          containerUnselectedColor: whiteColor,
                          contentPadding: _width! / 25, //15
                          controller: _userEmailAdress,
                          hasHorizontalMargin: true,
                          enableBorder: false,
                          enabled: true,
                          inputData: TextInputType.text,
                          isPassword: false,
                          maxLines: 1,
                          readOnly: false,
                          labelText:
                              "${AppLocalizations.of(context)!.translate("email optional")})",
                        ),
                        PhoneNoAndCountryCode(
                          countryCode: "todo",
                          phoneNo: widget.userDetails.phone ?? "",
                        ),
                        ChooseGender(),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: _width! / 23.4375, //16
                          ),
                          child: SmallText(
                              typeOfFontWieght: 1,
                              color: blackColor,
                              size: _height! / 67.66666666666667, //12
                              text: AppLocalizations.of(context)!
                                  .translate("Age group")),
                        ),
                        SizedBox(
                          height: _height! / 40.6, //20
                        ),
                        GroupAge(),
                        SizedBox(
                          height: _height! / 24.60606060606061, //33
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomButton(
                              enableVerticalMargin: false,
                              enableHorizontalMargin: false,
                              width: _width! / 1.19047619047619, //315
                              height: _height! / 16.24, //50
                              btnLbl: AppLocalizations.of(context)!
                                  .translate("Save Changes"),
                              onPressedFunction: () async {
                                setState(() {
                                  _isLoading = true;
                                });
                                bool x = await UpdateCurrentUserDataController
                                    .updateCurrentUserDataMethod(
                                  context,
                                  _userFristName.text,
                                  _userEmailAdress.text,
                                  widget.userDetails.phone ?? "",
                                );

                                if (!x) {
                                  snakBarWidget(
                                      context: context, content: "حدث خطأ ما");
                                }
                              },
                              btnColor: mainAppColor,
                              btnStyle: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: whiteColor,
                                  fontSize: _height! / 67.66666666666667),
                              borderColor: mainAppColor,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: _height! / 24.60606060606061, //33
                        ),
                      ],
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}

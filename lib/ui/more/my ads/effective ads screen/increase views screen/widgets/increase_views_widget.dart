// ignore_for_file: must_be_immutable, non_constant_identifier_names, unused_local_variable

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sheraa/custom_widgets/TextStyle/small_text.dart';
import 'package:sheraa/custom_widgets/buttons/custom_button.dart';
import 'package:sheraa/locale/app_localizations.dart';
import 'package:sheraa/providers/increase%20views/increase_views_provider.dart';
import 'package:sheraa/ui/more/balance/payment%20method/payment_method_screen.dart';
import 'package:sheraa/ui/more/my%20ads/effective%20ads%20screen/increase%20views%20screen/special%20ad%20screen/special_ad_screen.dart';
import 'package:sheraa/ui/more/my%20ads/effective%20ads%20screen/increase%20views%20screen/vip%20ad%20screen/vip_ad_screen.dart';
import 'package:sheraa/utils/app_colors.dart';

class IncreaseViewsWidget extends StatefulWidget {
  int ad_Id;
  String imageUrl;
  String adtype;
  bool isVip;

  IncreaseViewsWidget({
    Key? key,
    required this.ad_Id,
    required this.imageUrl,
    required this.adtype,
    required this.isVip,
  }) : super(key: key);

  @override
  State<IncreaseViewsWidget> createState() => _IncreaseViewsWidgetState();
}

class _IncreaseViewsWidgetState extends State<IncreaseViewsWidget> {
  double? _height;

  double? _width;

  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;

    _width = MediaQuery.of(context).size.width;

    final increaseViwsProvider = Provider.of<IncreaseVeiwsProvider>(
      context,
    );
    return Column(
      children: [
        Column(
          children: [
            SizedBox(
              height: _height! / 73.81818181818182, //11
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: _width! / 23.4375, //16
              ),
              child: Row(
                children: [
                  Container(
                    width: _width! / 12.5, //30
                    height: _height! / 27.06666666666667, //30
                    child: Image.asset(
                      widget.imageUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(
                    width: _width! / 53.57142857142857, //7
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            SmallText(
                                size: _height! / 58,
                                color: blackColor,
                                typeOfFontWieght: 1,
                                text: widget.adtype),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => widget.isVip
                                          ? VipAdScreen()
                                          : SpecialAdScreen(),
                                    ));
                              },
                              child: Container(
                                margin: EdgeInsets.symmetric(
                                    horizontal: _width! / 75),
                                child: Image.asset(
                                    "assets/images/question-fill.png"),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: _height! / 162.4,
                        ),
                        SmallText(
                          size: _height! / 81.2,
                          color: textGrayColor,
                          typeOfFontWieght: 0,
                          text: AppLocalizations.of(context)!.translate(
                              "Your ad appears at the top of the list of ads in all added departments and cities"),
                        ),
                        SizedBox(
                          height: _height! / 54.13333333333333, //15
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SizedBox(
                  width: _width! / 7.075471698113208,
                ),
                InkWell(
                  onTap: () {
                    if (widget.isVip) {
                      increaseViwsProvider.increaseVipNo();
                    } else {
                      increaseViwsProvider.increaseSpecialNo();
                    }
                  },
                  child: Container(
                    width: _width! / 15,
                    height: _height! / 32.48,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: containerColor),
                    ),
                    child: Image.asset(
                      "assets/images/addwhite.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(
                  width: _width! / 75,
                ),
                SmallText(
                  typeOfFontWieght: 1,
                  color: blackColor,
                  text: widget.isVip
                      ? (increaseViwsProvider.vipAdsNumber.toString())
                      : increaseViwsProvider.specialAdsNumber.toString() +
                          " " +
                          AppLocalizations.of(context)!.translate("a_day"),
                ),
                SizedBox(
                  width: _width! / 75,
                ),
                InkWell(
                  onTap: () {
                    if (widget.isVip) {
                      increaseViwsProvider.dereaseVipNo();
                    } else {
                      increaseViwsProvider.dereaseSpeicalNo();
                    }
                  },
                  child: Container(
                    width: _width! / 15,
                    height: _height! / 32.48,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: containerColor),
                    ),
                    child: Image.asset(
                      "assets/images/minus.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(
                  width: _width! / 75, //5
                ),
                SmallText(
                  color: Color(0xFFF30333),
                  size: _height! / 67.66666666666667, //12
                  text: widget.isVip
                      ? AppLocalizations.of(context)!.translate("a_Discount") +
                          " "
                              "2" +
                          " %"
                      : AppLocalizations.of(context)!.translate("a_Discount") +
                          " "
                              "4" +
                          " %",
                )
              ],
            ),
            Row(
              children: [
                SmallText(
                  typeOfFontWieght: 1,
                  size: _height! / 67.66666666666667, //12
                  color: blackColor,
                  text: widget.isVip ? "10,00" : "5",
                ),
                SizedBox(
                  width: _width! / _width!,
                ),
                SmallText(
                  typeOfFontWieght: 0,
                  size: _height! / 67.66666666666667, //12
                  color: blackColor,
                  text: AppLocalizations.of(context)!.translate("R .S"),
                ),
                SizedBox(
                  width: _width! / 15,
                ),
              ],
            )
          ],
        ),
        SizedBox(
          height: _height! / 54.13333333333333, //15
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomButton(
              enableVerticalMargin: false,
              enableHorizontalMargin: false,
              width: _width! / 2.314814814814815, //162
              height: _height! / 20.6, //35
              btnLbl: AppLocalizations.of(context)!.translate("Buy Ad"),
              onPressedFunction: () {
                Map _body = {
                  "ad_id": widget.ad_Id,
                  "days_no": widget.isVip
                      ? increaseViwsProvider.vipAdsNumber
                      : increaseViwsProvider.specialAdsNumber,
                  "type": widget.isVip ? "vip" : "special"
                };
                print(_body);

                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => PaymentMethodScreen(
                              pageName: "increase views",
                              body: _body,
                            )));
              },
              btnColor: whiteColor,
              btnStyle: TextStyle(
                  fontWeight: FontWeight.normal,
                  color: mainAppColor,
                  fontSize: _height! / 67.66666666666667),
              borderColor: mainAppColor,
            ),
          ],
        ),
        SizedBox(
          height: _height! / 54.13333333333333, //15
        ),
      ],
    );
  }
}
